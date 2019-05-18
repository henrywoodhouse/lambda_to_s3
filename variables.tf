variable "lambda_memory" {
  description = "The maximum memory of the lambda function in MB"
  default     = 129
}

variable "timeout" {
  description = "The maximum lambda execution time in seconds"
  default     = 30
}

variable "region" {
  description = "The region the lambda will be run from"
  default     = "eu-west-1"
}
