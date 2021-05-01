provider "aws" {
  version = "~> 2.0"
  region  = var.region
  access_key = var.awsAccessKey
  secret_key = var.awsSecretAccessKey
}

resource "random_integer" "unique_identifier" {
  min     = 10000
  max     = 100000
}

module "vpc" {
  source = "./vpc"
  createVpc       = (var.vpcExists) ? false : true
  vpcCIDRBlock    = var.vpcCIDRBlock
  instanceTenancy = var.instanceTenancy
  dnsSupport      = var.dnsSupport
  dnsHostNames    = var.dnsHostNames
  vpcName         = var.vpcName
  subnetsList     = var.subnetsList
  subnetIds       = var.subnetIds
  vpcId           = var.vpcId
}

module "sourceEndpoint" {
  source = "./modules/endpoints"
  databaseName          = var.databaseName
  databaseEngine        = var.sourceDatabaseEngine
  dbPassword            = var.sourceDbPassword
  dbServerPort          = var.sourceDbServerPort
  dbHost                = var.sourceHost
  dbSSLMode             = var.sourceDbSSLModel
  dbUserName            = var.sourceDbUserName
  endpoints_depends_on  = random_integer.unique_identifier.result
  unique_identifer      = random_integer.unique_identifier.result
  tags                  = var.tags
  endpointUniqueId      = var.sourceEndpointUniqueId
}

module "targetEndpoint" {
  source = "./modules/endpoints"
  databaseName          = var.rdsDatabaseName
  databaseEngine        = var.rdsDatabaseEngine
  dbPassword            = var.rdsPassword
  dbServerPort          = var.rdsDbPort
  dbHost                = var.rdsHostName
  dbSSLMode             = var.rdsDbSSLModel
  dbUserName            = var.rdsUserName
  endpoints_depends_on  = module.sourceEndpoint.endPointArn
  unique_identifer      = random_integer.unique_identifier.result
  tags                  = var.tags
  endpointUniqueId      = var.targetEndpointUniqueId
}


module "dms_replications"{
  source = "./modules/replications"
  replicationStorage                       = var.replicationAllocatedStorage
  multiAZ                                  = var.isMultiAZ
  replicationInstancePublicallyAccessible  = var.replicationInstancePublicallyAccessible
  replicationInstanceClass                 = var.dmsReplicationInstanceClass
  replicationIdSuffix                      = random_integer.unique_identifier.result
  migrationType                            = var.migrationType
  sourceEndPointArn                        = module.sourceEndpoint.endPointArn
  targetEndPointArn                        = module.targetEndpoint.endPointArn
  tableMappings                            = var.tableMappings
  repliation_depends_on                    = module.targetEndpoint.endPointArn
  isReplicationSubnetGroupExists           = var.isReplicationSubnetGroupExists
  subnetGroupId                            = var.replicationSubnetGroupId
  subnetIds                                = module.vpc.subnetIds
}