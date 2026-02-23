resource "aws_db_instance" "strapi" {
  identifier          = "strapi-db"
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "strapi"
  password            = "Strapi1234"
  skip_final_snapshot = true
  publicly_accessible = true
}

resource "aws_db_subnet_group" "strapi" {
  name       = "strapi-db-subnet-group"
  subnet_ids = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]

  tags = {
    Name = "strapi-db-subnet-group"
  }
}
