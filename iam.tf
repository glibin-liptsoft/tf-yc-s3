# Добавлено на случай когда решат баг с yandex_storage_bucket_iam_binding что ресурс не может быть с индексами

# locals {
#   iam_non_empty = {
#     for k, v in var.iam : k => coalesce(v, [])
#     if length(coalesce(v, [])) > 0
#   }
# }

# resource "yandex_storage_bucket_iam_binding" "bucketadmin" {
#   for_each  = local.iam_non_empty
#   bucket    = var.bucket_name
#   role      = "storage.${each.key}"

#   members = each.value
# }



#OR

# resource "yandex_storage_bucket_iam_binding" "bucketadmin" {
#   count = var.iam.admin != null ? 1 : 0
#   bucket = var.bucket_name
#   role      = "storage.admin"

#   members = var.iam.admin
# }
# resource "yandex_storage_bucket_iam_binding" "bucketconfigviewer" {
#   count = var.iam.configViewer != null ? 1 : 0
#   bucket = var.bucket_name
#   role      = "storage.configViewer"

#   members = var.iam.configViewer
# }

# resource "yandex_storage_bucket_iam_binding" "bucketconfigurer" {
#   count = var.iam.configurer != null ? 1 : 0
#   bucket = var.bucket_name
#   role      = "storage.configurer"

#   members = var.iam.configurer
# }
# resource "yandex_storage_bucket_iam_binding" "bucketeditor" {
#   count = var.iam.editor != null ? 1 : 0
#   bucket = var.bucket_name
#   role      = "storage.editor"

#   members = var.iam.editor
# }
# resource "yandex_storage_bucket_iam_binding" "bucketuploader" {
#   bucket = var.bucket_name
#   role      = "storage.uploader"

#   members = var.iam.uploader
# }
# # resource "yandex_storage_bucket_iam_binding" "bucketviewer" {
#   bucket = var.bucket_name
#   role      = "storage.viewer"

#   members = var.iam.viewer
# }
