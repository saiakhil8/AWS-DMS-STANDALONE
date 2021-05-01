variable "multiAZ"{
    type = string
    description = "MultiAz"
}
variable "replicationInstancePublicallyAccessible"{
    type = bool
    default = false
    description = "Replication Instance Accessibility"
}
variable "replicationInstanceClass"{
    type = string
    description = "Replication Instance Class"
}
variable "replicationIdSuffix"{
    type = number
    description = "Replication Instance Id Suffix"
}

variable "repliation_depends_on"{
    type = any
    default = []
}

variable "migrationType"{
    type = string
    description = "Migration Type"
}

variable "sourceEndPointArn"{
    type = string
    description = "Source EndPoint Arn"
}

variable "targetEndPointArn"{
    type = string
    description = "Target EndPoint Arn"
}

variable "tableMappings"{
    type = string
    description = "Table Mappings"
}

variable "replicationStorage"{
    type = string
    description = "Replication Storage"
}

variable "subnetGroupId"{
    type = string
    description = "Dms Replication SubnetGroup Id"
}

variable "subnetIds"{
    type = list(string)
    description = "List of subnets to be associated"
}

variable "isReplicationSubnetGroupExists"{
    type = bool
    description = "Dms Replication SubnetGroup Exists or not"
}

variable "tags"{
    type = map(string)
    description = "Tags"
}