provider "aws" {
  region = "us-east-1"
}

module "ec2" {

  source = "../../modules/ec2"

  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
  name          = "test-server"

}