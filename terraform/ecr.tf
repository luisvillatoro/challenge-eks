resource "aws_ecr_repository" "cactustech-ecr" {
  name                 = "challenge"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}