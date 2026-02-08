output "instance_public_ip" {
  description = "Public IP of the Mac runner"
  value       = aws_instance.mac_runner.public_ip
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.mac_runner.id
}

output "host_id" {
  description = "Dedicated host ID"
  value       = aws_ec2_host.mac_host.id
}

output "ssh_command" {
  description = "SSH command to connect"
  value       = "ssh -i ~/.ssh/macgtd-runner ec2-user@${aws_instance.mac_runner.public_ip}"
}

output "vnc_info" {
  description = "VNC connection info"
  value       = "vnc://${aws_instance.mac_runner.public_ip}:5900"
}
