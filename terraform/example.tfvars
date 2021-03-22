user_name="user-name"
password="password"
tenant_name="tenant-name"
security_gruops = [
    "gncs-ipv4-all"
]
auth_url="https://identity.tyo2.conoha.io/v2.0"
master_node = {
    keypair_name="keypair-name"
    instance_name="instance-name"
    image_name="vmi-ubuntu-20.04-amd64-30gb"
    flavor_name="g-2gb"
    tag_name="tag-name"
    host_name="host-name"
    new_user_name="new-user-name"
    new_user_password="new-user-password"
    path_to_public_key="~/.ssh/public.pub"
    path_to_private_key="~/.ssh/private"
    ssh_port="22"
}
worker_nodes = [
    {
        keypair_name="keypair-name"
        instance_name="instance-name"
        image_name="vmi-ubuntu-20.04-amd64-30gb"
        flavor_name="g-2gb"
        tag_name="tag-name"
        host_name="host-name"
        new_user_name="new-user-name"
        new_user_password="new-user-password"
        path_to_public_key="~/.ssh/public.pub"
        path_to_private_key="~/.ssh/private"
        ssh_port="22"
    }
]