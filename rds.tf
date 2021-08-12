# Create Database Instance Restored from DB Snapshots
# terraform aws db instance
resource "aws_db_instance" "database-instance" {
  skip_final_snapshot     = true

  identifier              = "improvement-db"
  storage_type            = "gp2" #optional not mandatory
  allocated_storage       = 20

  engine               = "postgres"
  engine_version       = "12.5"
  instance_class       = "db.t2.micro"# to use the free tier
  
  port                 = 5432
  name     = "completePostgresql"
  username = var.username 
  password = var.password
  
  parameter_group_name= "postgres12"
  max_allocated_storage = 1000
  db_subnet_group_name    = "vpc-seeing on the ec2"
  
  availability_zone = "see which reagion is near you and you want to use" #try one near you and one far all different from the ec2 to see if have an differences
  publicly_accessible = true #to be accessible outside the vpc
  deletion_protection = false

  tags = {
     Name = "Using terraform to AWS RDS Post"
  }

}
