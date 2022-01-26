resource "local_file" "pet" {
  filename = var.filename
  content = "It's name is ${random_pet.petr.id}"
}

resource "random_pet" "petr" {
  length = var.length
  prefix = var.prefix
  
}
