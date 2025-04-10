variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type = string
    default = "ami-00a929b66ed6e0de6"
}

variable "instance_type" {
    default = "t2.micro"
    description = "Instance type for the EC2 instance"
}

variable "server-name" {
    description = "Name of the server"
    default = "jenkins"
    type = string
}

variable "environment" {
    description = "Environment tag"
    default = "dev"
    type = string
}

variable "public_key_path" {
    description = "Path to the public key file"
    type = string
}

variable "bucket_name" {
    description = "S3 bucket name"
    type        = string
    default     = "profile-jenkins-fsantiagog"
}