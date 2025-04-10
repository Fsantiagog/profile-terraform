resource "aws_iam_policy" "jenkins_s3_policy" {
  name = "JenkinsS3AccessPolicy"
  description = "Access Configuration for the Jenkins S3 Set Set"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*",
          "s3-object-lambda:*"
        ],
        Resource = [
          "*"
        ]
      }
    ]
  })
  tags = {
    Name = "${var.server-name}-server"
    Environment = var.environment
    Owner = "felipe.fsantiagogbea@gmail.com"
    Team = "DevOps"
    Project = "Profile"
  }
}

resource "aws_iam_role" "jenkins_instance_role" {
  name = "jenkins-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole",
        Sid = ""
      }
    ]
  })
  tags = {
    Name = "${var.server-name}-server"
    Environment = var.environment
    Owner = "felipe.fsantiagogbea@gmail.com"
    Team = "DevOps"
    Project = "Profile"
  }
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  policy_arn = aws_iam_policy.jenkins_s3_policy.arn
  role       = aws_iam_role.jenkins_instance_role.name
}

resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "jenkins_instance_profile"
  role = aws_iam_role.jenkins_instance_role.name
}