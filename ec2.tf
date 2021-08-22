resource "aws_instance" "debu-nginx" {
  ami = "${lookup(var.AMI, var.AWS_REGION)}"
  instance_type = "t2.micro"
  count = 1

  #VPC
  subnet_id = "${aws_subnet.dev-public-subnet-vpc-main.id}"

  #Security group
  vpc_security_group_ids = ["${aws_security_group.dev-security-default.id}"]

  # the Public SSH key
    key_name = "${aws_key_pair.debu-key-pair.id}"

  # nginx installation
    provisioner "file" {
        source = "nginx.sh"
        destination = "/home/ubuntu/nginx.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /home/ubuntu/nginx.sh",
             "sudo /home/ubuntu/nginx.sh"
        ]
    }   
    connection {
        type = "ssh"
        user = "${var.EC2_USER}"
        host = "${self.public_ip}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }

}

// Sends your public key to the instance
resource "aws_key_pair" "debu-key-pair" {
    key_name = "debu-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}

output "ec2_public_ip" {
  value = "${aws_instance.debu-nginx[0].public_ip}"
}

output "ec2_private_ip" {
  value = "${aws_instance.debu-nginx[0].private_ip}"
}