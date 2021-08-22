variable "AWS_REGION" {    
    default = "us-west-2"
}

variable "AMI" {
    type = map 
    default = {
        us-west-2 = "ami-090717c950a5c34d3"
    } 
}

variable "PUBLIC_KEY_PATH" {
  default = "/Users/debjyotisarkar/.ssh/id_rsa.pub"
}

variable "PRIVATE_KEY_PATH" {
  default = "/Users/debjyotisarkar/.ssh/id_rsa"
}

variable "EC2_USER" {
  default = "ubuntu"
}

variable "HOST" {
  default = "debu-nginx"
}
