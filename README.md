# terraform-hands-on-migration-learning

From AWS console action, to IaC with Terraform.

# 1. Select version

```jsx
	version.tf
```

- Version constrains define the range of version i wanna use
- Separate terraform core and provider

# 2. Create S3 Bucket

```jsx
	bucket-tfstate.tf
```

 

- Create S3 bucket for tfstate file
- Kinds of terraform block, fixed and modifiable arguments

# 3. IAM Role

- 

```jsx
	role-policy.tf
```

- Get the least necessary policy from console, copied the policy (this turn I do not attach the least principle, due to demo project, but noted to update.)
- Policies are attached to Roles to define permissions, and Users or Groups are granted permission to *assume* those Roles.
- Trust policy to specify who can use the role

# 4. Create DynamoDB Table

```jsx
	dynamoDB.tf
```

- Creating dynamoDB for state locking, so when one user active, another user unable to “terraform apply”

note : Get warning that this deprecated on the output after apply. and I use the other way for state locking, which is using s3 uselock_file.

# 5. Create Backend

```jsx
	backend.tf
```

- storing tfstate file to s3 bucket created.
- using encryption to secure file.
