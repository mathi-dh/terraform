variable "region" {
  description = "The region where the resources are to be deployed"
  default     = "xxxxx"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  default     = "t2.medium"
}


variable "security_group" {
  description = "The name of the security group"
  type        = "list"
  default     = ["xxxxxx"]

}

variable "zone_subnet" {
  description = "The name of the subnet"
  type        = "map"
  default     = {
          "A" = "xxxxxx"
          "B" = "xxxxxx"
  }
}

variable "ami_id" {
  description = "ami_id"
  type        = "string"
  default     = "ami-xxxxxxxx"
}

variable "sshuser" {}

variable "volume_mapping" {
  type  = "map"
  default = {   
      "mapping1" = {
                    "device" = "/dev/xvdc" 
                    "size"   = "5"
                   },
      "mapping3" = {
                    "device" = "/dev/xvdde"
                    "size"   = "7"
                   }
      "mapping4" = {
                    "device" = "/dev/xvdd"
                    "size"   = "6"
                   }

    
}
}
