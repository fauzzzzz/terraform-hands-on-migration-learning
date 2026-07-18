# 1. policies
resource "aws_iam_policy" "zspace_migration_policy" {
  name = "zspace-migration-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "StateBackendAccess" #for state backend access (s3 usefile_lock, dynamoDB lock)
        Effect = "Allow"
        Action = ["s3:*", "dynamodb:*"] 
        Resource = ["*"]
      },
      {
        Sid    = "InfraAccess" #access for infrastructure
        Effect = "Allow"
        Action = ["ec2:*", "rds:*"]
        Resource = ["*"]
      }
    ]
  })
}

# 2. ROLE
resource "aws_iam_role" "zspace_migration_role" {
  name = "zspace-migration-role"
  
  # trust policy :  role ini for IAM user to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
    #   Principal = { 
    #     # ARN USER IAM 
    #     AWS = "arn:aws:iam::ACCOUNT_ID:user/IAM_USER_NAME" 
    #   }
    }]
  })
}

# 3. attachment (attach policy to role)
resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.zspace-migration-role.name
  policy_arn = aws_iam_policy.zspace_migration_policy.arn
}