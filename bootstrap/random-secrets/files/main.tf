locals {
  random_passwords = [
    "gitea-admin-password",
    "gitea-renovate-token",
  ]
}

resource "random_password" "passwords" {
  for_each = toset(local.random_passwords)
  length   = 64
  special  = false
}
