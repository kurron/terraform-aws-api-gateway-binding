terraform {
    required_version = ">= 0.10.7"
    backend "s3" {}
}

provider "aws" {
    region     = "${var.region}"
}

resource "aws_api_gateway_resource" "parent_resource" {
    rest_api_id = "${var.api_gateway_id}"
    parent_id   = "${var.api_gateway_root_resource_id}"
    path_part   = "${var.api_root_path}"
}

resource "aws_api_gateway_resource" "child_resource" {
    rest_api_id = "${var.api_gateway_id}"
    parent_id   = "${aws_api_gateway_resource.parent_resource.id}"
    path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "parent_method" {
    rest_api_id        = "${var.api_gateway_id}"
    resource_id        = "${aws_api_gateway_resource.parent_resource.id}"
    http_method        = "ANY"
    authorization      = "NONE"
    api_key_required   = "${var.api_key_required}"
    request_parameters = {
        "method.request.header.host" = true,
        "method.request.path.proxy"  = true
    }
}

resource "aws_api_gateway_method" "child_method" {
    rest_api_id        = "${var.api_gateway_id}"
    resource_id        = "${aws_api_gateway_resource.child_resource.id}"
    http_method        = "ANY"
    authorization      = "NONE"
    api_key_required   = "${var.api_key_required}"
    request_parameters = {
        "method.request.header.host" = true,
        "method.request.path.proxy"  = true
    }
}
