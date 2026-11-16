resource "yandex_storage_bucket_grant" "this" {
    bucket          = var.bucket_name
    access_key      = try(var.existing_service_account.access_key, null)
    secret_key      = try(var.existing_service_account.secret_key, null)

    acl             = var.acl

    dynamic "grant" {
        for_each = var.grant
        content {
            id          = grant.value.id
            type        = grant.value.type
            uri         = grant.value.uri
            permissions = grant.value.permissions
        }
    }
}