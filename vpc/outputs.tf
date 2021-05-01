output "subnetIds" {
    value = var.createVpc ? tolist(data.template_file.subnetIds.*.rendered) : var.subnetIds
}

output "vpcId" {
    value = var.createVpc ? aws_vpc.vpc.0.id : var.vpcId
}