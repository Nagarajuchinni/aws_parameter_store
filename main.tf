terraform {
  backend "s3" {
    bucket = "d76-terraform-state-chinni"
    key    = "parameter-store/terraform.tfstate"
    region = "us-east-1"

  }
}

variable "parameters" {
    default = [
        { name = "test", value = "string", value = "test"},
        { name = "test1", value = "string", value = "test1"}
    ]
      
    
}

resource "aws_ssm_parameter" "params" {
    count = length(var.parameters)
    name = var.parameters[count.index]
    type = var.parameters[count.index].type
    value = var.parameters[count.index].value
}
    