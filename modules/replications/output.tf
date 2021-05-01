output "replicationSubnetGroupId" {
    value = var.isReplicationSubnetGroupExists ? var.subnetGroupId : aws_dms_replication_subnet_group.replicationSubnetGroup.0.replication_subnet_group_id
}

output "replicationInstanceArn" {
    value = aws_dms_replication_instance.dmsReplicationInstance.replication_instance_arn
}

output "replicationInstancePrivateIps" {
    value = aws_dms_replication_instance.dmsReplicationInstance.replication_instance_private_ips
}

output "replicationInstancePublicIps" {
    value = aws_dms_replication_instance.dmsReplicationInstance.replication_instance_public_ips
}

output "replicationInstanceId" {
    value = aws_dms_replication_instance.dmsReplicationInstance.replication_instance_id
}

output "replicationInstancePubliclyAccessible" {
    value = aws_dms_replication_instance.dmsReplicationInstance.publicly_accessible
}

output "replicationTaskArn" {
    value = aws_dms_replication_task.replicationTask.replication_task_arn 
}

output "replicationTaskId" {
    value = aws_dms_replication_task.replicationTask.replication_task_id 
}

output "replicationInstanceClass" {
    value = aws_dms_replication_instance.dmsReplicationInstance.replication_instance_class 
}

output "replicationMultiAZ" {
    value = aws_dms_replication_instance.dmsReplicationInstance.multi_az 
}