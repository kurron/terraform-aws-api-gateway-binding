terraform {
    required_version = ">= 0.11"
    backend "s3" {}
}

data "terraform_remote_state" "api_gateway" {
    backend = "s3"
    config {
        bucket = "transparent-test-terraform-state"
        key    = "us-west-2/debug/aplication-services/api-gateway/terraform.tfstate"
        region = "us-east-1"
    }
}

module "api_gateway_binding" {
    source = "../"

    region                       = "us-west-2"
    api_gateway_id               = "${data.terraform_remote_state.api_gateway.api_gateway_id}"
    api_gateway_root_resource_id = "${data.terraform_remote_state.api_gateway.api_gateway_root_resource_id}"
    api_root_path                = "api"
    root_api_key_required        = "false"
    child_api_key_required       = "true"
}

output "parent_resource_id" {
    value = "${module.api_gateway_binding.parent_resource_id}"
}

output "child_resource_id" {
    value = "${module.api_gateway_binding.child_resource_id}"
}

output "parent_method_http_method" {
    value = "${module.api_gateway_binding.parent_method_http_method}"
}

output "child_method_http_method" {
    value = "${module.api_gateway_binding.child_method_http_method}"
}
