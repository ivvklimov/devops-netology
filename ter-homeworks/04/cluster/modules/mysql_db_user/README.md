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
| [yandex_mdb_mysql_database.database](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_database) | resource |
| [yandex_mdb_mysql_user.mysql_user](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ID кластера managed MySQL | `string` | n/a | yes |
| <a name="input_db"></a> [db](#input\_db) | Имя базы данных | `string` | n/a | yes |
| <a name="input_db_user_roles"></a> [db\_user\_roles](#input\_db\_user\_roles) | n/a | `list(string)` | <pre>[<br>  "ALL"<br>]</pre> | no |
| <a name="input_password"></a> [password](#input\_password) | Пароль пользователя | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Имя пользователя | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_id"></a> [database\_id](#output\_database\_id) | ID созданной базы данных |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | ID созданного пользователя |
