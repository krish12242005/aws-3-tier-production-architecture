data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "app" {
  count = length(var.app_subnet_ids)

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.app_subnet_ids[count.index]
  vpc_security_group_ids     = [var.app_security_group_id]
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              cat > /usr/share/nginx/html/index.html <<'HTML'
              <html>
              <head>
                <title>AWS 3-Tier Application</title>
              </head>
              <body>
                <h1>AWS 3-Tier Architecture</h1>
                <p>Application Server is running successfully.</p>
              </body>
              </html>
              HTML
              EOF

  tags = {
    Name = "${var.project_name}-app-${count.index + 1}"
    Tier = "application"
  }
}