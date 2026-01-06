terraform {
  required_version = ">1.9.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
  }
}

provider "local" {
  # Configuration options
}
resource "local_file" "aws-practice" {
  filename        = "devops.txt"
  content         = "This is a practice file for AWS using Terraform."
  file_permission = "0444"

}

resource "local_file" "practice-file" {
  filename = "jenkins.txt"
  content  = "Hi Im Learning aws and Devops."

}

resource "local_file" "practice" {
  filename = "nginx.txt"
  content  = "Hi Im Learning aws and Devops with MULTI CLOUD AZURE GCP."

}