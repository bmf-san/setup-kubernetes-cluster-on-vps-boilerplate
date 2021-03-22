output "ip" {
    value = (openstack_compute_instance_v2.gobel_instance.access_ip_v4)
}