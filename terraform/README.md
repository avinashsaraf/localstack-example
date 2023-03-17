## Terraform variables

By default, terraform reads the variable values from `terraform.tfvars`. But if we have any other file name we pass it along with the commands
<br> `terraform plan -var-file=my-vars.tfvars` <br> `terraform apply -var-file=my-vars.tfvars` 
