variable "region" {
    type = "string"
    description = "The AWS region to deploy into (e.g. us-east-1)"
}

variable "api_gateway_id" {
    type = "string"
    description = "ID of the API Gateway, e.g. f6wayvdtd1"
}

variable "api_gateway_root_resource_id" {
    type = "string"
    description = "ID of the API Gateway's root resource, e.g. rx3pwr22hf"
}

variable "api_root_path" {
    type = "string"
    description = "Base path of the API, e.g. api"
}

variable "api_key_required" {
    type = "string"
    description = "If true, then an API key must be sent with each request, e.g. true"
}
