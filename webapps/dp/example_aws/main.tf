# Specify the provider and access details


resource "aws_elb" "web" {
  name = "terraform-example-elb"

  # The same availability zone as our instances
  availability_zones = ["${aws_instance.web.*.availability_zone}"]



  # The instances are registered automatically
  instances = ["${aws_instance.web.*.id}"]
}

resource "aws_instance" "web" {
  instance_type = "m1.small"
  ami           = "${lookup(var.aws_amis, var.aws_region)}"

  # This will create 4 instances
  count = 4
}
