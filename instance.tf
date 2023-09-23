provider "aws" {
  region = "us-east-1"
}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
locals {
  aws_region   = "us-east-1"
  imagem       = "233181867717.dkr.ecr.us-east-1.amazonaws.com/web-ecr:latest"
  service_name = "kube-news"
  service_port = 8080

}

# resource "aws_db_instance" "rds" {
#   identifier             = "postgresdb"
#   db_name                = "postgresdb"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   engine                 = "postgres"
#   engine_version         = "15.3"
#   username               = "postgresuser"
#   password               = "postgrespwd"
#   db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
#   vpc_security_group_ids = [aws_security_group.db-sg.id]
#   parameter_group_name   = aws_db_parameter_group.dbpg.name
#   availability_zone      = "us-east-1a"
#   publicly_accessible    = false
#   skip_final_snapshot    = true
# }

# resource "aws_ecs_cluster" "aws-ecs-cluster" {
#   name = "web-ecs"
#   tags = {
#     Name = "web-ecs"
#   }
# }

# resource "aws_ecs_task_definition" "aws-ecs-task" {
#   family = "web-task"

#   container_definitions = <<DEFINITION
#   [
#     {
#       "name": "${local.service_name}",
#       "image": "${local.imagem}",
#       "environment": ${jsonencode(
#   [
#     {
#       "name" : "DB_HOST",
#       "value" : "${aws_db_instance.rds.address}"
#     },
#     {
#       "name" : "DB_DATABASE",
#       "value" : "${aws_db_instance.rds.db_name}"
#     },
#     {
#       "name" : "DB_USERNAME",
#       "value" : "${aws_db_instance.rds.username}"
#     },
#     {
#       "name" : "DB_PASSWORD",
#       "value" : "${aws_db_instance.rds.password}"
#     }
# ])},
#       "essential": true,
#       "portMappings": [
#         {
#           "containerPort": ${local.service_port},
#           "hostPort": ${local.service_port}
#         }
#       ],
#       "cpu": 512,
#       "memory": 1024,
#       "networkMode": "awsvpc"
#     }
#   ]
#   DEFINITION

# requires_compatibilities = ["FARGATE"]
# network_mode             = "awsvpc"
# memory                   = "1024"
# cpu                      = "512"
# execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
# task_role_arn            = aws_iam_role.ecsTaskExecutionRole.arn

# tags = {
#   Name = "web-ecs-td"
# }
# depends_on = [aws_db_instance.rds]
# }

# data "aws_ecs_task_definition" "main" {
#   task_definition = aws_ecs_task_definition.aws-ecs-task.family
# }

# resource "aws_ecs_service" "aws-ecs-service" {
#   name            = "${local.service_name}-service"
#   cluster         = aws_ecs_cluster.aws-ecs-cluster.id
#   task_definition = "${aws_ecs_task_definition.aws-ecs-task.family}:${max(aws_ecs_task_definition.aws-ecs-task.revision, data.aws_ecs_task_definition.main.revision)}"
#   launch_type     = "FARGATE"
#   desired_count   = 1
#   network_configuration {
#     subnets         = [aws_subnet.main-subnet-private-1a.id, aws_subnet.main-subnet-private-1b.id]
#     security_groups = [aws_security_group.web-sg.id]
#   }

#   load_balancer {
#     target_group_arn = aws_lb_target_group.target_group.arn
#     container_name   = local.service_name
#     container_port   = local.service_port
#   }

# }

