resource "aws_instance" "webserver" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"

    tags = {
        Name = "WebServer"
        Environment = "Development"
    }


    connection {
        type         = "ssh"
        user         = "ec2-user"
        host         = "${self.public_ip}"
        private_key  = "${file("~/.ssh/known_hosts")}"
    }


    provisioner "remote-exec" {
    inline = [
            "sudo su -",
            "yum -y update",
            "yum install -y httpd",
            "service httpd start",
            "chkconfig httpd on",
            "usermod -a -G apache ec2-user",
            "chown -R ec2-user:apache /var/www",
            "chmod 777 /var/www/html/index.html",
            "rm -f /etc/httpd/conf/httpd.conf"
        ]
    }

    provisioner "file" {
        source = "index.html"
        destination = "/var/www/html/index.html"
    }
    provisioner "file" {
        source = "httpd.conf"
        destination = "/etc/httpd/conf/httpd.conf"
    }
    provisioner "remote-exec" {
        inline = [
        "sudo chmod 644 /var/www/html/index.html"
        ]
    }

    # Save the public IP for testing
    provisioner "local-exec" {
        command = "echo ${aws_instance.webserver.public_ip} > public-ip.txt"
    }
}