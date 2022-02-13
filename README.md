Prerequisites for Static Web Site
Install AWS CLI 
Add your Credentials correctly 
purchase DNS 
I have used terraform 0.14 version 


Static Website Infrastructure
S3 bucket that hosts our website files for our subdomain
S3 bucket that serves as the redirect to our subdomain
SSL wildcard certificate validated for our domain that automatically renews
Cloudfront distribution for the www and non-www domain which is our CDN
Route 53 records pointed at to our Cloudfront distributions

1 Step
Create manually your s3 backend for storing the Terraform state files, making sure you update the account ID and bucket name.

providers.tf
I have set up 2 providers here. The first AWS provider is the default provider (as it has no alias) this is what will be using for the majority of our components.
The second AWS provider is specifically for the SSL certificate. These need to be created in us-east-1 for Cloudfront to be able to use them.

variables.tf
We are going to use these 4 variables throughout the project.

s3.tf
The first S3 bucket is where we are going to host all our website files. At a minimum, you will need to upload an index.html file in this bucket once it has been created.
The second S3 bucket is going to redirect any requests to the www version of your website

acm.tf
we need to set up our SSL certificate. I have gone with email validation in this setup as it is by far the quickest method. When the certificate has been created by Terraform, AWS will send an email to the owner of the domain to approve the certificate request

cloudfront.tf
Now that we have done the S3 and SSL certificate we can look at creating the Cloudfront distributions. We need to create 2, one for each S3 bucket.
Any HTTP requests to this distribution will be redirected to HTTPS automatically.

terraform init - To initialise the project and download any required packages.
terraform plan - To see what has changed compared to your current configuration.
terrform apply - To apply your changes.
