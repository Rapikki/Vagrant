
#output "ip_static_address" {
#  value = google_compute_address.static.address
#}

#output "check" {
#  value = ["terraform --version",
#           "docker -v",
#           "kubectl version",
#  ]
#}
#output "instances_self_links" {
#  description = "Output self_link of created instances."
  #value       = "${google_compute_instance.instances.*.self_link}"
#}

#output "instances_tags" {
#  description = "Output tags of created instances."
#  value       = "${google_compute_instance.instances.*.tags[0]}"
#}

#output "instance_id" {
  #value = google_compute_instance.vm_instance.id
#}

#output "ip_static_address" {
#  value = google_compute_address.static.address
#}
output "ip" {
value = "${google_compute_instance.vm_instance_apl1.network_interface.0.access_config.0.nat_ip}"
}
