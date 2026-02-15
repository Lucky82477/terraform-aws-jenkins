resource "aws_instance" "jenkins_server" {
  ami           = "ami-0f58b397bc5c1f2e8" # Amazon Linux 2 (ap-south-1)
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = file("${path.module}/../../userdata.sh")

  tags = {
    Name = "Jenkins-Docker-Server"
  }
}
