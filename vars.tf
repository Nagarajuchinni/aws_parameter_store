variable "parameters" {
    default = [
        { name = "dev.rds.username", type = "String", value = "admin1"},

        ##pssword##
        { name = "dev.rds.password", type = "SecureString", value = "expense123"}
    ]     
    
}