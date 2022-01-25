resource "local_file" "my-pet" {
  filename = var.filename
  content = var.content
}
resource "random_pet" "other-pet" {
    lenth = var.length
    prefix = var.prefix
    separator = var.separator
    
  
}