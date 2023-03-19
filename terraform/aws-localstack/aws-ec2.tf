resource "aws_instance" "webserver" {
  ami           = "ami-0a2457eba250ca23d"
  instance_type = "t2.micro"
  tags          = {
    name = "nginx-webserver"
  }
  key_name               = aws_key_pair.webserver-key.id
  user_data              = file("./webserver-provision.sh")
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_key_pair" "webserver-key" {
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "allow ssh from internet"
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}
