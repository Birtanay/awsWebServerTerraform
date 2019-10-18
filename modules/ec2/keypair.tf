resource "aws_key_pair" "deployer" {
  key_name = "frankfurtwebserver" 
  public_key = "${file("~/.ssh/frankfurt.pem")}"
}