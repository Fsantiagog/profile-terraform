variable "bucket_name" {
    description = "Nombre del bucket S3"
    type        = string
    default     = "profile-website-fsantiagog"
}

variable "environment" {
    description = "Environment tag"
    type        = string
    default     = "dev"
}