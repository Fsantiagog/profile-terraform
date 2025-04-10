output "jenkins_public_ip" {
  description = "Jenkins public IP address."
  value = aws_instance.jenkins.public_ip
}

output "jenkins_access_url" {
    description = "URL to access Jenkins."
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "get_initial_password_command" {
  description = "Command to get the initial admin password for Jenkins."
  value = "ssh -i ${var.public_key_path} ec2-user@${aws_instance.jenkins.public_ip} 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'"
}
output "ssh_key_pub" {
  description = "to see the public key"
  value = "ssh -i ${var.public_key_path} ec2-user@${aws_instance.jenkins.public_ip} 'sudo cat ~/.ssh/id_rsa.pub'"
}