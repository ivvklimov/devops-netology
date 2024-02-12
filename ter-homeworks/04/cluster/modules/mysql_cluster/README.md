## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_mdb_mysql_cluster.mysql_cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"my-cluster"` | no |
| <a name="input_cluster_resources"></a> [cluster\_resources](#input\_cluster\_resources) | n/a | <pre>object({<br>    resource_preset_id = string<br>    disk_type_id       = string<br>    disk_size          = number<br>  })</pre> | <pre>{<br>  "disk_size": 10,<br>  "disk_type_id": "network-hdd",<br>  "resource_preset_id": "b2.medium"<br>}</pre> | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | `"8.0"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `false` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | `"PRESTABLE"` | no |
| <a name="input_ha"></a> [ha](#input\_ha) | n/a | `bool` | `true` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | The ID of the network where the MySQL cluster will be deployed | `string` | n/a | yes |
| <a name="input_number_of_hosts"></a> [number\_of\_hosts](#input\_number\_of\_hosts) | Number of hosts in the MySQL cluster | `number` | `2` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
