## Creating A Virtual Machine in AWS
Virtual machines in AWS are referred to as EC2 instances.  This Terraform example takes you through the steps to create an EC2 using Terraform.  This section simply creates an EC2 instance on AWS.

### Initial Setup
* If you don't have terraform installed on you Mac, install Terraform using HomeBrew.  Check out HomeBrew at <https://brew.sh/> and using the following command to install Terraform: ```brew install terrafrom```
* Create a working folder
* Create a text file called aws-provider.tf in that folder.
* Create a text file called t2.micro-ubuntu.xenial.tf in that folder.

### Creating AWS Account
An Amazon Web Services account is assumed for this example.  If you don't have one go to <https://aws.amazon.com> and sign up.  AWS services are not free so keep all your credentials secure and be sure to destroy any resources you don't need.

### Create IAM user for Terraform to use
Create an IAM users in AWS for terraform to use as the admin user when creating, updating and destroying resources.  I created a user called 'terraform' and gave it administrative privileges.  It's also necessary to generate an access key and secret access key for this user.  You'll need these keys for programatic access.

### Create A Provider Configuration
Terraform uses cloud providers to provide infrastructure.  The promise is that Terraform is cloud agnostic and can use any cloud provider.  Terraform provides first class support for AWS.  Add the following to the aws-provider.tf file and save it.
```js
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-west-2"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
```
### Create An EC2 Resource Definition
Terraform requires little information to create an EC2 instance.  Add the following info to the t2.micro-ubuntu.xenial.tf file and save it.
```js
resource "aws_instance" "example" {
  ami           = "ami-b5ed9ccd"
  instance_type = "t2.micro"
}
```
The Amazon Machine Image (ami) used is from the Ubuntu EC2 AMI Locator site provided by Ubuntu.  A complete list of images can be found here <http://cloud-images.ubuntu.com/locator/ec2/>.

### Create Environment Variables
Create the following environment variables which will be used to provide programatic access to AWS.  The environment variables will hold the access_key and secret_key from the terraform IAM user.  Add the following to your .bash_profile file and save.  
```bash
export TF_VAR_access_key="123abc"
export TF_VAR_secret_key="abc123"
```
All environment variables will be consider by Terraform.  In the provider file access_key and secret_key are defined as variables.  Terraform will inject the environment variables as needed during execution.

### Create your ec2
From within the the working folder where you created the ```*.rf``` files run the command ```$ terraform plan```.

This will run a no operation execution of your files.  the output is something like the following:
```text
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_instance.example
      id:                           <computed>
      ami:                          "ami-b5ed9ccd"
      associate_public_ip_address:  <computed>
      availability_zone:            <computed>
      ebs_block_device.#:           <computed>
      ephemeral_block_device.#:     <computed>
      get_password_data:            "false"
      instance_state:               <computed>
      instance_type:                "t2.micro"
      ipv6_address_count:           <computed>
      ipv6_addresses.#:             <computed>
      key_name:                     <computed>
      network_interface.#:          <computed>
      network_interface_id:         <computed>
      password_data:                <computed>
      placement_group:              <computed>
      primary_network_interface_id: <computed>
      private_dns:                  <computed>
      private_ip:                   <computed>
      public_dns:                   <computed>
      public_ip:                    <computed>
      root_block_device.#:          <computed>
      security_groups.#:            <computed>
      source_dest_check:            "true"
      subnet_id:                    <computed>
      tenancy:                      <computed>
      volume_tags.%:                <computed>
      vpc_security_group_ids.#:     <computed>


Plan: 1 to add, 0 to change, 0 to destroy.
```
Terraform update will create the ec2.

```bash
$ terraform apply
```

Terraform destroy will undo the creation by tearing down the resources you previously created.  
```bash
$ terraform destroy
```

### Verify
After each terraform plan, update and destroy, verify using the AWS console that the desired changes took place or did not take place.
