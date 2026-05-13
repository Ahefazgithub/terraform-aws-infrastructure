output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private.id
}

output "public_subnet2_id" {
  description = "Second public subnet ID"
  value       = aws_subnet.public2.id
}

output "private_subnet2_id" {
  description = "Second private subnet ID"
  value       = aws_subnet.private2.id
}
