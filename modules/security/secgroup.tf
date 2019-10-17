resource "aws_security_group" "allow_all" {
  name = "allow_all"
  description = "Allows all egress traffic, only 8080 ingress"

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "Allow All Egress, Open 8080 for Web Hosting"
  }
}

output "security_group_id" {
  value = "${aws_security_group.allow_all.id}"
}
