# Output the ALB DNS name
output "alb_dns_name" {
  value       = aws_lb.web_alb.dns_name
  description = "Access the website via this ALB DNS"
}
