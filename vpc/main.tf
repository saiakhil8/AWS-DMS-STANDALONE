resource "aws_vpc" "vpc" {
    count                = var.createVpc ? 1 : 0
    cidr_block           = var.vpcCIDRBlock
    instance_tenancy     = var.instanceTenancy 
    enable_dns_support   = var.dnsSupport 
    enable_dns_hostnames = var.dnsHostNames
    tags = {
        Name = var.vpcName,
        CreatedBy  = "Terraform"
    }
}

resource "aws_subnet" "vpcSubnets" {
    count                   = var.createVpc ? length(var.subnetsList) : 0
    vpc_id                  = aws_vpc.vpc.0.id
    cidr_block              = lookup(element(var.subnetsList,count.index),"subnetCidrBlock","10.0.1.0/24")
    map_public_ip_on_launch = lookup(element(var.subnetsList,count.index),"isPublic",true)

    tags = {
        Name = lookup(element(var.subnetsList,count.index),"subnetName","Subnet tf"),
        CreatedBy = "Terraform"
    }
}

resource "aws_internet_gateway" "vpcInternetGateWay" {
    count  = var.createVpc ? 1 : 0
    vpc_id = aws_vpc.vpc.0.id
    tags = {
        Name = "InternetGateway",
        CreatedBy = "Terraform"
    }
} 

resource "aws_route_table" "vpcRouteTable" {
    count  = var.createVpc ? 1 : 0
    vpc_id = aws_vpc.vpc.0.id
    tags = {
        Name = "VPC Route Table",
        CreatedBy = "Terraform"
    }
} 

resource "aws_route" "vpcInternetAccess" {
    count                  = var.createVpc ? 1 : 0
    route_table_id         = aws_route_table.vpcRouteTable.0.id
    gateway_id             = aws_internet_gateway.vpcInternetGateWay.0.id
    destination_cidr_block = "10.1.0.0/24"
} 

resource "aws_route_table_association" "vpcAssociation" {
    count = var.createVpc ? length(var.subnetsList) : 0
    subnet_id      = aws_subnet.vpcSubnets[count.index].id
    route_table_id = aws_route_table.vpcRouteTable.0.id
}

data "template_file" "subnetIds" {
  count    = var.createVpc ? length(var.subnetsList) : 0
  template = lookup(element(tolist(aws_subnet.vpcSubnets),count.index), "id")
  depends_on = [aws_subnet.vpcSubnets]
}