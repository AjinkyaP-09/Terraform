resource "aws_instance" "myinstance" {
	instance_type = "t2.micro"
	ami = var.ami_id
	vpc_security_group_ids = var.security_group_ids
	tags = {
		Name = "MyInstance"
	}
	user_data = <<-EOF
        #!/bin/sh
        sudo apt-get update
        sudo apt install -y apache2
        sudo systemctl status apache2
        sudo systemctl start apache2
        sudo chown -R $USER:$USER /var/www/html
        sudo echo "<html><body><h1>Hello this is module-1<h1></body></html>" > /var/www/html/index.html
        EOF
}
