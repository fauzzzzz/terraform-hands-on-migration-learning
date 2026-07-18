#create s3 bucket

resource "aws_s3_bucket" "zspace_tfstate_bucket" {
  bucket = "zspace-tfstate-bucket" 

#put some tags
  tags = {
    Name        = "zspace-tfstate-bucket"
    Environment = "Dev"

  }
}

resource "aws_s3_bucket_versioning" "zspace_tfstate_bucket_versioning" {
  bucket = aws_s3_bucket.zspace_tfstate_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}