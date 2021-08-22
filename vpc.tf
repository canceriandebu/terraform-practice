resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/22"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"

  tags {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "dev-subnet-vpc-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.16.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2a"
    tags {
        Name = "dev-subnet-vpc-1"
    }
}