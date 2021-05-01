
variable "createVpc"{
    type = bool
    description = "Bool specifying whether to create vpc or not"
}

variable "vpcName"{
    type = string
    description = "VPC NAME"
}

variable "dnsSupport"{
    type = bool
    description = "DNS Support Required?"
}

variable "dnsHostNames"{
    type = bool
    description = "DNS HostNames Required?"
}

variable "vpcCIDRBlock"{
    type = string
    description = "CIDR BLOCK FOR VPC"
}

variable "subnetIds"{
    type = list(string)
    description = "List of subnet ids -- Will be of length 0 if we need to create"
}

variable "subnetsList"{
    type = list(map(string))
    description = "List of subnets , Map includes name,cidrBlock, public or private"
}

variable "instanceTenancy"{
    type = string
    description = "Instance Tenancy"
}

variable "vpcId" {
    type = string
    description = "vpcId"
}

