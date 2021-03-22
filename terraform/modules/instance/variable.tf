variable "keypair_name" {
    type = string
    default = "keypair"
    description = "keypair name for a node"
}

variable "security_groups" {
    type = list
    default = [
        "gncs-ipv4-all"
    ]
    description = "security groups for instance"
}

variable "path_to_public_key" {
    type = string
    default = "path_to_public_key"
    description = "path to public key for a node"
}

variable "instance_name" {
    type = string
    default = "instance_name"
    description = "instance name for a node"
}

variable "image_name" {
    type = string
    default = "image_name"
    description = "image name for a node"
}

variable "flavor_name" {
    type = string
    default = "flavor_name"
    description = "flavor name for a node"
}

variable "tag_name" {
    type = string
    default = "tag_name"
    description = "tag name for a node"
}