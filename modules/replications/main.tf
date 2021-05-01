data "aws_iam_policy_document" "dms_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["dms.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "dms-access-for-endpoint" {
  assume_role_policy = data.aws_iam_policy_document.dms_assume_role.json
  name               = "dms-access-for-endpoint-terraform-HK-${var.replicationIdSuffix}"
}

resource "aws_iam_role_policy_attachment" "dms-access-for-endpoint-AmazonDMSRedshiftS3Role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSRedshiftS3Role"
  role       = aws_iam_role.dms-access-for-endpoint.name
}

resource "aws_iam_role" "dms-cloudwatch-logs-role" {
  assume_role_policy = data.aws_iam_policy_document.dms_assume_role.json
  name               = "dms-cloudwatch-logs-role-terraform-HK-${var.replicationIdSuffix}"
}

resource "aws_iam_role_policy_attachment" "dms-cloudwatch-logs-role-AmazonDMSCloudWatchLogsRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSCloudWatchLogsRole"
  role       = aws_iam_role.dms-cloudwatch-logs-role.name
}

resource "aws_iam_role" "dms-vpc-role" {
  assume_role_policy = data.aws_iam_policy_document.dms_assume_role.json
  name               = "dms-vpc-role-terraform-HK-${var.replicationIdSuffix}"
}

resource "aws_iam_role_policy_attachment" "dms-vpc-role-AmazonDMSVPCManagementRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"
  role       = aws_iam_role.dms-vpc-role.name
}

resource "aws_dms_replication_subnet_group" "replicationSubnetGroup" {
  replication_subnet_group_description = "Subnet Group Created for DMS Replication Task"
  replication_subnet_group_id          = "replication-subnet-group-terraform-HK-${var.replicationIdSuffix}"
  count = var.isReplicationSubnetGroupExists ? 0 : 1
  subnet_ids = var.subnetIds
  tags = var.tags
}

resource "aws_dms_replication_instance" "dmsReplicationInstance" {
  allocated_storage            = var.replicationStorage
  multi_az                     = var.multiAZ
  publicly_accessible          = var.replicationInstancePublicallyAccessible
  replication_instance_class   = var.replicationInstanceClass
  replication_instance_id      = "replication-instance-terraform-HK-${var.replicationIdSuffix}"
  replication_subnet_group_id  = var.isReplicationSubnetGroupExists ? var.subnetGroupId : aws_dms_replication_subnet_group.replicationSubnetGroup.0.id
  tags = var.tags

  depends_on = [var.repliation_depends_on]
}


resource "aws_dms_replication_task" "replicationTask" {
  migration_type            = var.migrationType
  replication_instance_arn  = aws_dms_replication_instance.dmsReplicationInstance.replication_instance_arn
  replication_task_id       = "replication-task-terraform-HK-${var.replicationIdSuffix}"
  source_endpoint_arn       = var.sourceEndPointArn
  target_endpoint_arn       = var.targetEndPointArn
  table_mappings            = var.tableMappings
  tags = var.tags
}