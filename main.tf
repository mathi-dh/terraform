provider "aws" {
  region                 = var.region
}

resource "aws_instance" "ec2_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group
  subnet_id              = var.zone_subnet["A"]
  tags = {
    Name = "terraform-maps-test"
  }
}



resource "aws_ebs_volume" "ebs_volume" {
  count = "${length(var.volume_mapping)}"
  availability_zone     = "${aws_instance.ec2_server.availability_zone}"
  size = "${lookup(var.volume_mapping[element(keys(var.volume_mapping), count.index)], "size")}"
  tags = {
    Name = "terraform-maps-test"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  count = "${length(var.volume_mapping)}"
  device_name           = "${lookup(var.volume_mapping[element(keys(var.volume_mapping), count.index)], "device")}"
  skip_destroy          = false
  volume_id             = "${element(aws_ebs_volume.ebs_volume.*.id, count.index)}"
  instance_id           = "${aws_instance.ec2_server.id}"
}

