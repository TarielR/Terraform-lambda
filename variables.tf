variable "region" {
  default = "us-east-1"
}

variable "tags" {
  description = "Tags to apply to Resources"
  default = {
    Owner   = "Tariel"
    Company = "Disney"
  }
}


