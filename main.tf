provider "aws" {

    region = "ap-south-1"
}


resource "aws_instance" "ec2_instance" {
ami           = "ami-0a6ed6689998f32a5" 
instance_type = "t2.micro"
tags = {
    Name = "TF_instance"
}
}
