
# variable "instance_type" {
#   description = "EC2 instance launch"
#   type = string
#   default = "t2.micro"

# }

variable "filename" {
  # default = "~/Desktop/pets.txt"
  # default = "%homedrive%%homepath%/Desktop/Pets.txt"
  #intentionally left blank. This should prompt 
  #for path where you want file please end with name.extention
}

variable "length" {
  default = "1"
}

variable "prefix" {
  default = "Mr."
}
