output "parent_resource_id" {
    value = "${aws_api_gateway_resource.parent_resource.id}"
    description = "The parent resource's identifier."
}

output "child_resource_id" {
    value = "${aws_api_gateway_resource.child_resource.id}"
    description = "The child resource's identifier."
}

output "parent_method_http_method" {
    value = "${aws_api_gateway_method.parent_method.http_method}"
    description = "The parent method's HTTP method, e.g. GET."
}

output "child_method_http_method" {
    value = "${aws_api_gateway_method.child_method.http_method}"
    description = "The child method's HTTP method, e.g. GET."
}
