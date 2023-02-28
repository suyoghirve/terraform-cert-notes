output "private_ip" {
  value = zipmap(aws_instance.instance.*.tags.Name, aws_instance.instance.*.private_ip)
}

output "private_dns" {
  value = zipmap(aws_instance.instance.*.tags.Name, aws_instance.instance.*.private_dns)
}

output "alb_id" {
  value = aws_lb.lb.dns_name
}