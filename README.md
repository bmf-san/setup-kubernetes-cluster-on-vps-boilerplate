# setup-kubernetes-cluster-on-vps-boilerplate
This is a boilerplate for setup kubernetes cluster on vps by terraform and ansible.

I'm assuming conoha vps, but if you edit it, you can use it with other openstack compatible vps.

# Get started
## Generate a ssh key
Before you start, generate keys for each node user.

ex.
`ssh-keygen -t rsa`

## Setup tfvars
Copy /terraform/example.tfvars with any name you like, and edit it.

If you give tfvars file a name other than terraform.tfvars, you need to use option when executing a command. terraform COMMAND -var-file anyname.tfvars

If you name it terraform.tfvars, you do not need to specify -var-file option.

## Set up instances by terraform
```sh
cd terraform/
make init
make apply
```

If you want to delete the instance, run the following command.

```sh
cd terraform/
make destroy
```

## Provisioning by ansible
Execute after the instance creation is completed.

```sh
cd ansible/
make init-provision
make provision
```

## Check ssh connection
`ssh username@ipaddress -i path_to_private_key`

# Reference
- [www.linuxsysadmins.com - Install Kubernetes Cluster with Ansible on Ubuntu in 5 minutes](https://www.linuxsysadmins.com/install-kubernetes-cluster-with-ansible/)
- [nnstt1.hatenablog.com - 自宅 k8s クラスタのサービスに FQDN で繋がるようにした](https://nnstt1.hatenablog.com/entry/2020/11/13/070000)
- [MetalLB入門 ― オンプレKubernetesクラスタでLoadBalancerタイプのServiceを使う](https://www.kaitoy.xyz/2020/10/31/metallb/#:~:text=MetalLB%E3%81%AF%E3%80%81%E3%81%82%E3%82%89%E3%81%8B%E3%81%98%E3%82%81%E6%8C%87%E5%AE%9A%E3%81%95%E3%82%8C,%E3%81%AE%E6%A9%9F%E5%99%A8%E3%81%AB%E5%91%A8%E7%9F%A5%E3%81%99%E3%82%8B%E3%80%82&text=MetalLB%E3%81%8CARP(IPv4)%E3%81%A8,%E3%82%92%E8%A7%A3%E6%B1%BA%E3%81%97%E3%81%A6%E3%81%8F%E3%82%8C%E3%82%8B%E3%80%82)
- [ameblo.jp - 若手エンジニアのブログ](https://ameblo.jp/bakery-diary/entry-12614040050.html)
- [月10ドルで海外VPSでKubernetesを試してみる（kubernetes v1.9版）](https://inajob.hatenablog.jp/entry/2018/02/28/%E6%9C%8810%E3%83%89%E3%83%AB%E3%81%A7%E6%B5%B7%E5%A4%96VPS%E3%81%A7Kubernetes%E3%82%92%E8%A9%A6%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B%EF%BC%88kubernetes_v1.9%E7%89%88%EF%BC%89)
- [chidakiyo.hatenablog.com - Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what? \(Kubernetes NodePort と LoadBalancer と Ingress のどれを使うべきか\) を訳した](https://chidakiyo.hatenablog.com/entry/2018/09/10/Kubernetes_NodePort_vs_LoadBalancer_vs_Ingress%3F_When_should_I_use_what%3F_\(Kubernetes_NodePort_%E3%81%A8_LoadBalancer_%E3%81%A8_Ingress_%E3%81%AE%E3%81%A9%E3%82%8C%E3%82%92%E4%BD%BF%E3%81%86)
- [medium.com - On-premises Kubernetes pitfalls](https://medium.com/makotows-blog/on-premise-kubernetes-pitfalls-2aa49e1a4c2c)
- [metallb](https://metallb.universe.tf/)
- [MetalLB入門 ― オンプレKubernetesクラスタでLoadBalancerタイプのServiceを使う](https://www.kaitoy.xyz/2020/10/31/metallb/)
- [blog.framinal.life -【手順あり】MetalLBの使い方から動きまで解説します](https://blog.framinal.life/entry/2020/04/16/022042)
- [blog.web-apps.tech - MetalLBを使用してオンプレでもtype: LoadBalancerを使用する](https://blog.web-apps.tech/type-loadbalancer_by_metallb/)
- [blog.adachin.me - [OpenStack]TerraformでConoHa VPSのインスタンスを立ち上げてみた！](https://blog.adachin.me/archives/10378)
- [blog.mosuke.tech](https://blog.mosuke.tech/entry/2019/03/26/terraform-integrated-with-ansible/)
- [computingforgeeks.com - Install Kubernetes Cluster on Ubuntu 20.04 with kubeadm](https://computingforgeeks.com/deploy-kubernetes-cluster-on-ubuntu-with-kubeadm/)
- [snowsystem.net - Ubuntu 20.04LTSにkubernetes環境をkubeadmで構築する手順](https://snowsystem.net/container/kubernetes/kubernetes-build-env/)
- [k0kubun.hatenablog.com - 個人で運用するKubernetesクラスタ](https://k0kubun.hatenablog.com/entry/kubernetes)
- [www.redhat.com - HASHICORP TERRAFORM AND RED HAT ANSIBLE AUTOMATION](https://www.redhat.com/cms/managed-files/pa-terraform-and-ansible-overview-f14774wg-201811-en.pdf)
- [note.com - AnsibleとTerraformと](https://note.com/santak/n/n22dbb35f6c01)
- [booth.pm - Phases of kubeadm 2nd Edition](https://booth.pm/ja/items/1730081)
- [conoha.jp - ConoHa API Documentation](https://www.conoha.jp/docs/)
- [registry.terraform.io - openstack_compute_keypair_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_keypair_v2)
- [registry.terraform.io - openstack_compute_instance_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2)
- [qiita.com - 【Ubuntu 18.04】Ansible で Docker と docker-compose をインストールする](https://qiita.com/yukin01/items/dd1cfc07abefd6a13aa5)
- [qiita.com - TerraformでConoHaのインスタンスを立ててみる](https://qiita.com/kaminchu/items/d0776c381213d54a3a69)
- [qiita.com - TerraformからAnsibleのplaybookを実行する](https://qiita.com/hayaosato/items/ee0d6eabb7b3d0a22136)
- [gist.github.com - san-tak/tf-bookmark.md](https://gist.github.com/san-tak/9ef4d15eafb4c8a42af33ffa04464739)
- [github.com - maki0922/terraform_in_conoha](https://github.com/maki0922/terraform_in_conoha)
- [github.com - hobbby-kube](https://github.com/hobby-kube/provisioning)
- [github.com - r0b2g1t/terraform-openstack-ansible](https://github.com/r0b2g1t/terraform-openstack-ansible)
- [github.com - dan4ex/Terraform](https://github.com/dan4ex/Terraform)
- [github.com - kubernetes-digitalocean-terraform/kubernetes-digitalocean-terraform](https://github.com/kubernetes-digitalocean-terraform/kubernetes-digitalocean-terraform)
- [github.com - leocavalcante/up-n-running-k8s](https://github.com/leocavalcante/up-n-running-k8s)
- [github.com - ContainerSolutions/kubadmm-ansible](https://github.com/ContainerSolutions/kubadm-ansible)
- [github.com - zaki-lknr/initialize-kubeadm-ansible](https://github.com/zaki-lknr/initialize-kubeadm-ansible)

# License
This project is licensed under the terms of the MIT license.
