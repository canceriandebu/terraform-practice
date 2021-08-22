variable "AWS_REGION" {    
    default = "us-west-2"
}

variable "AMI" {
    type = map 
    default = {
        us-west-2 = "ami-090717c950a5c34d3"
    } 
}