# Launch Template
resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-launch-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    echo "<h1>Server Details</h1><p><strong>Hostname:</strong> $(hostname)</p><p><strong>IP Address:</strong> $(hostname -I | cut -d' ' -f1)</p>" | sudo tee /var/www/html/index.html
    sudo systemctl enable apache2
    sudo systemctl start apache2
  EOF
  )

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }
}
