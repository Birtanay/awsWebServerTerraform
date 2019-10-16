resource "aws_instance" "webserver" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"

    tags = {
        Name = "WebServer"
        Environment = "Development"
    }
}