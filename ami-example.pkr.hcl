
locals { formatdate = (formatdate("DD-MM-YYYY", timestamp())) }

source "amazon-ebs" "packer-ami-example" {
  ami_name                = "${var.ami_name}-${local.formatdate}"
  ami_virtualization_type = "hvm"
  ssh_username            = "${var.login_user}"
  communicator            = "ssh"
  ebs_optimized           = true
  instance_type           = "${var.launch_instance}"
  region                  = "${var.region}"
  subnet_id               = "${var.subnet_id}"
  iam_instance_profile    = "${var.ec2_role}"
  source_ami_filter {
    filters = {
      name                = "amazon-linux-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["$baseAMIaccountID"]
  }

  tags = {
    OS_Version = "Amazon-Linux"
    Release    = "2.0."
  }

  launch_block_device_mappings {
    device_name           = "/dev/xvdb"
    volume_size           = "${var.export_home_size_gb}"
    volume_type           = "${var.ebs_volume_type}"
    delete_on_termination = true
    iops                  = 3000
    throughput            = 125
    encrypted             = true

  }

}


build {
  sources = ["source.amazon-ebs.sms-UTL-AMI"]
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install ansible2 -y"
    ]
  }


  provisioner "ansible" {
    playbook_file = [ "./ansible-configs/disk-config.yml"
]

  }



}