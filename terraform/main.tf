terraform {
    required_version = "0.14.0"
    required_providers {
        openstack = {
            source = "terraform-provider-openstack/openstack"
            version = "1.35.0"
        }
    }
}

module "master_instance" {
    source = "./modules/instance"
    keypair_name       = (var.master_node.keypair_name)
    path_to_public_key = (var.master_node.path_to_public_key)
    instance_name = (var.master_node.instance_name)
    image_name = (var.master_node.image_name)
    flavor_name = (var.master_node.flavor_name)
    tag_name = (var.master_node.tag_name)
}

module "worker_instance" {
    for_each = {for i, v in var.worker_nodes:  i => v}

    source = "./modules/instance"
    keypair_name       = (each.value.keypair_name)
    path_to_public_key = (each.value.path_to_public_key)
    instance_name = (each.value.instance_name)
    image_name = (each.value.image_name)
    flavor_name = (each.value.flavor_name)
    tag_name = (each.value.tag_name)
}

resource "local_file" "save_hosts" {
    content = templatefile("./templates/hosts.tpl", {
        master_host_name = (var.master_node.host_name)
        master_host_ip = (module.master_instance.ip)
        master_user = (var.master_node.new_user_name)
        master_path_to_private_key = (var.master_node.path_to_private_key)
        worker_nodes = var.worker_nodes
        worker_ips = module.worker_instance
    })
    filename = "../ansible/inventories/hosts"

    depends_on = [ 
        module.master_instance,
        module.worker_instance,
    ]
}

resource "local_file" "master_save_host_vars" { 
    content = templatefile("./templates/host_vars/host.tpl", {
        new_user_name = (var.master_node.new_user_name)
        new_user_password = (var.master_node.new_user_password)
        public_key = file(var.master_node.path_to_public_key)
        ssh_port = (var.master_node.ssh_port)
    })
    filename = "../ansible/inventories/host_vars/${var.master_node.host_name}.yml"

    depends_on = [ 
        module.master_instance,
    ]
}

resource "local_file" "worker_save_host_vars" {
    for_each = {for i, v in var.worker_nodes:  i => v}

    content = templatefile("./templates/host_vars/host.tpl", {
        new_user_name = (each.value.new_user_name)
        new_user_password = (each.value.new_user_password)
        public_key = file(each.value.path_to_public_key)
        ssh_port = (each.value.ssh_port)
    })
    filename = "../ansible/inventories/host_vars/${each.value.host_name}.yml"

    depends_on = [ 
        module.worker_instance,
    ]
}