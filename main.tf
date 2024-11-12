terraform {
  backend "s3" {
    bucket = "d76-terraform-state-chinni"
    key    = "parameter-store/terraform.tfstate"
    region = "us-east-1"

  }
}

variable "parameters" {
    default = [
        { name = "test", type = "String", value = "test"},
        { name = "dev.rds.username", type = "String", value = "admin1"},

        { name = "dev.rds.password", type = "SecureString", value = "Expense123"}
    ]     
    
}


resource "aws_ssm_parameter" "params" {
    count = length(var.parameters)
    name = var.parameters[count.index].name
    type = var.parameters[count.index].type
    value = var.parameters[count.index].value
}
    