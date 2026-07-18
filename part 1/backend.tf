terraform {
  backend "s3" {
    bucket         = "zspace-tfstate-bucket"
    key            = "zspace.tfstate" 
    region         = "eu-central-1"                          
    #dynamodb_table = "zspace-dynamo-lock"             #this modified cause deprecated output notification 
    encrypt        = true
    use_lockfile = true                                #use this instead for state locking directly in s3
  }
}