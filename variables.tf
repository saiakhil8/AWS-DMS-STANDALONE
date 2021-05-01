variable "region" {
  type = string
  description = "Aws Region"
}

variable "awsAccessKey"{
  type = string
  description = "Aws Access key with full access to create and read VPC, RDS INSTANCE, DMS"
}

variable "awsSecretAccessKey"{
  type = string
  description = "Aws Secret Access key with full access to create and read VPC, RDS INSTANCE, DMS"
}

variable "replicationAllocatedStorage" {
  type = number
  description = "Required Storage for RDS"
  default = 20
}


variable "rdsDatabaseName" {
  type = string
  description = "RDS Database Name"
}

variable "rdsUserName"{
  type = string
  description = "RDS DB USERNAME"
}

variable "rdsPassword" {
  type = string
  sensitive   = true
  description = "RDS DB Password"
}

variable "vpcId"{
  type = string
  description = "VPC ID list"
}

variable "subnetIds"{
  type = list(string)
  description = "SubnetIds list"
}


variable "sourceDatabaseName" {
    type = string
    description = "Name of Source Database Name"
}

variable "sourceDatabaseEngine" {
    type = string
    description = "Name of Source Database Engine"
}

variable "rdsDatabaseEngine" {
    type = string
    description = "Name of RDS Database Engine"
}

variable "sourceDbPassword" {
    type = string
    sensitive   = true
    description = "Name of Source Database Password"
}

variable "sourceDbServerPort" {
    type = string
    description = "Name of Source Db server port"
}

variable "rdsDbPort" {
    type = string
    description = "Name of Source Db server port"
}

variable "sourceEndpointUniqueId" {
    type = string
    description = "Name of Source Db server port"
}

variable "targetEndpointUniqueId" {
    type = string
    description = "Name of Source Db server port"
}


variable "sourceHost" {
    type = string
    description = "Name of Source Database Host"
}

variable "rdsHostName" {
    type = string
    description = "Name of Source Database Host"
}

variable "sourceDbUserName" {
    type = string
    description = "Name of Source Database UserName"
}

variable "replicationInstancePublicallyAccessible"{
  type = bool
  default = false
  description = "Replication Publically Accessible?"
}


variable "tableMappings"{
  type = string
  description = "Rules to include or exclude tables etc"
  default = "{\"rules\":[{\"rule-type\":\"selection\",\"rule-id\":\"1\",\"rule-name\":\"1\",\"object-locator\":{\"schema-name\":\"%\",\"table-name\":\"%\"},\"rule-action\":\"include\"}]}"
}

variable "migrationType"{
  type = string
  description = "Required Migration Type"
  default = "full-load"
}

variable "replicationSubnetGroupId"{
    type = string
    description = "Dms Replication SubnetGroup Id"
    default = ""
}

variable "isReplicationSubnetGroupExists"{
    type = bool
    description = "Dms Replication SubnetGroup Exists or not"
    default = true
}

variable "dmsReplicationInstanceClass"{
  type = string
  description = "DMS Replication Instance Class "
}


variable "vpcExists"{
    type = bool
    description = "Bool specifying whether to create vpc or not"
    default = false
}

variable "vpcName"{
    type = string
    description = "VPC NAME"
}

variable "dnsSupport"{
    type = bool
    description = "DNS Support Required?"
    default = true
}

variable "dnsHostNames"{
    type = bool
    default = true
    description = "DNS HostNames Required?"
}

variable "vpcCIDRBlock"{
    type = string
    description = "CIDR BLOCK FOR VPC"
}

variable "subnetsList"{
    type = list(map(string))
    description = "List of subnets , Map includes name,cidrBlock, public or private"
}

variable "instanceTenancy"{
    type = string
    description = "Instance Tenancy"
    default = "default"
}
variable "tags"{
    type = map(string)
    description = "Tags"
}

variable "isMultiAZ"{
  type = bool
  description = "Is Multi AZ?"
}

