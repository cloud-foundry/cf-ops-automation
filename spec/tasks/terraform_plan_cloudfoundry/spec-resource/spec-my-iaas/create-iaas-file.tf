resource "local_file" "my_iaas_spec" {
  content     = "this file is generated by terraform my_iaas_spec resource !"
  filename = "${path.cwd}/my-iaas-spec.txt"
}