provider "aws" {
  region = "us-east-1"
  profile = "felipeprofile"
}

terraform {
  backend "s3" {
    bucket = "profile-infra"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "felipeprofile"
  }
}

module "profile_dev" {
  source = "./modules/jenkins"

  ami_id = "ami-00a929b66ed6e0de6"
  public_key_path = file("../profile-jenkins.key.pub")
  bucket_name = "profile-website-fsantiagog"
}

module "profile_website_dev" {
  source = "./modules/website"
    bucket_name = "profile-website-fsantiago"
}


output "s3_bucket_website_name" {
  value = module.profile_website_dev.s3_bucket_website_name
}

output "s3_website_endpoint" {
  value = module.profile_website_dev.s3_website_endpoint
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

output "show_pub_key" {
  description = "To see the public key"
  value = module.profile_dev.ssh_key_pub
}