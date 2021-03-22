terraform {
    required_version = "0.14.0"
    required_providers {
        openstack = {
            source = "terraform-provider-openstack/openstack"
            version = "1.35.0"
        }
    }
}

resource "openstack_compute_keypair_v2" "gobel_keypair" {
    name       = (var.keypair_name)
    public_key = file(var.path_to_public_key)
}

resource "openstack_compute_instance_v2" "gobel_instance" {
    name        = (var.instance_name)
    image_name  = (var.image_name)
    flavor_name = (var.flavor_name)
    key_pair    = (var.keypair_name)
    security_groups = (var.security_groups)

    metadata = {
        instance_name_tag = (var.tag_name)
    }
}