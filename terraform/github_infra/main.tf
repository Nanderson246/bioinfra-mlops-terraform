provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "portfolio_repo" {
  name        = "bioinfra-mlops"
  description = "Portfolio repo created with Terraform"
  visibility  = "public"

  auto_init   = true  # Creates an empty README.md
  has_issues  = true
  has_wiki    = false
  topics      = ["mlops", "bioinformatics", "terraform", "portfolio"]
}

