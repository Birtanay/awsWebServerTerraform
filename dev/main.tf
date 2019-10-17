module "my_secgroup" {
	source		= "../modules/security"
}

module "my_ec2" {
	source		= "../modules/ec2"
	ami_id		= "ami-0eaec5838478eb0ba"
	instance_type	= "t2.micro"
}