variable "databaseName" {
    type = string
    description = "Name of Source Database Name"
}

variable "databaseEngine" {
    type = string
    description = "Name of Source Database Engine"
}

variable "dbPassword" {
    type = string
    sensitive   = true
    description = "Name of Source Database Password"
}

variable "dbServerPort" {
    type = string
    description = "Name of Source Db server port"
}

variable "dbHost" {
    type = string
    description = "Name of Source Database Host"
}

variable "dbSSLMode" {
    type = string
    description = "Name of Source Database SSL Mode"
}

variable "dbUserName" {
    type = string
    sensitive   = true
    description = "Name of Source Database UserName"
}


variable "endpoints_depends_on"{
    type = any
    description = "For triggering endPoint resources"
    default = []
}

variable "unique_identifer"{
    type = number
    description = "Used as suffix for ids"
}

variable "endpointUniqueId"{
    type = string
    description = "Endpoint Name"
}

variable "tags"{
    type = map(string)
    description = "Tags"
}
