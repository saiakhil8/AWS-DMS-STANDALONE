resource "aws_dms_endpoint" "endpoint" {
  database_name               = var.databaseName
  endpoint_type               = var.endpointType 
  endpoint_id                 = var.endpointUniqueId
  engine_name                 = var.databaseEngine
  password                    = var.dbPassword
  port                        = var.dbServerPort
  server_name                 = var.dbHost
  ssl_mode                    = var.dbSSLMode
  username                    = var.dbUserName
  tags                        = var.tags 
  depends_on                  = [var.endpoints_depends_on]
}
