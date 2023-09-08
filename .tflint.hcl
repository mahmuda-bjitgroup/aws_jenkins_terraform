plugin "aws" {
    enabled = true
    version = "0.26.0"
    source = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}

# Disallow legacy dot index syntax
rule "terraform_deprecated_index"{
 enabled = true
}

# Disallow deprecated (0.11-style) interpolation
rule "terraform_deprecated_interpolation"{
 enabled = true
}