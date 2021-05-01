

output "sourceEndPointArn" {
    value = module.sourceEndpoint.endPointArn
}

output "targetEndPointArn" {
    value = module.targetEndpoint.endPointArn
}

output "replicationSubnetGroupId" {
    value = module.dms_replications.replicationSubnetGroupId
}

output "replicationInstanceArn" {
    value = module.dms_replications.replicationInstanceArn
}

output "replicationInstancePrivateIps" {
    value = module.dms_replications.replicationInstancePrivateIps
}

output "replicationInstancePublicIps" {
    value = module.dms_replications.replicationInstancePublicIps
}

output "replicationInstanceId" {
    value = module.dms_replications.replicationInstanceId
}

output "replicationInstancePubliclyAccessible" {
    value = module.dms_replications.replicationInstancePubliclyAccessible
}

output "replicationTaskArn" {
    value = module.dms_replications.replicationTaskArn
}

output "replicationTaskId" {
    value = module.dms_replications.replicationTaskId
}

output "replicationInstanceClass" {
    value = module.dms_replications.replicationInstanceClass
}

output "replicationMultiAZ" {
    value = module.dms_replications.replicationMultiAZ
}


