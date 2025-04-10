
resource "aws_instance" "jenkins" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.jenkins_key.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile = aws_iam_instance_profile.jenkins_instance_profile.name
  associate_public_ip_address = true

  user_data = file("./modules/jenkins/jenkins-install.sh")

  tags = {
    Name = "${var.server-name}-server"
    Environment = var.environment
    Owner = "felipe.fsantiagogbea@gmail.com"
    Team = "DevOps"
    Project = "Profile"
  }
}