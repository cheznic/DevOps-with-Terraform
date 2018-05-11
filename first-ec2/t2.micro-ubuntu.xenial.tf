resource "aws_instance" "example" {
  ami           = "ami-b5ed9ccd"
  instance_type = "t2.micro"
}
