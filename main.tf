terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}


provider "google" {
  # Configuration options
  credentials = "fast-cascade-416401-f9a4ee6d81f6.json"
  project     = var.project
  region      = var.region
}


# This is the bucket for your state files
resource "google_storage_bucket" "raw" {
  project                     = var.project
  name                        = "${var.data_project}-raw"
  force_destroy               = false
  uniform_bucket_level_access = true
  location                    = var.region
  labels                      = local.labels
}


locals {
  labels = {
    "data-project" = var.data_project
  }
}

variable "project" {
  type        = string
  default     = "fast-cascade-416401"
  description = "ID Google project"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region Google project"
}

variable "data_project" {
  type        = string
  default     = "mysat10_cicd_project"
  description = "Name of data pipeline project to use as resource prefix"
}






