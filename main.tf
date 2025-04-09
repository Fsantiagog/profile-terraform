provider "aws" {
  region = "us-east-1"
  profile = "felipeprofile"
}


module "profile_dev" {
  source = "./jenkins_module"

  ami_id = "ami-00a929b66ed6e0de6"
  public_key_path = file("../profile-jenkins.key.pub")
}

output "jenkins_public_ip" {
  description = "Jenkins public IP address."
  value = module.profile_dev.jenkins_public_ip
}

output "jenkins_access_url" {
  description = "URL to access Jenkins."
  value = module.profile_dev.jenkins_access_url
}

output "get_initial_password_command" {
  description = "Command to get the initial admin password for Jenkins."
  value = module.profile_dev.get_initial_password_command
}