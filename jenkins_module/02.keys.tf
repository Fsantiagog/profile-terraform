resource "aws_key_pair" "jenkins_key" {
  key_name = "jenkins_key"
  public_key = var.public_key_path
  tags = {
    Name = "${var.server-name}-key"
    Environment = var.environment
    Owner = "felipe.fsantiagogbea@gmail.com"
    Team = "DevOps"
    Project = "Profile"
  }
}