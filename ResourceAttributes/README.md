# THE RESOURCE ATTRIBUTES

This folder has two files 
A) main.tf (main resource definitions)
B) variables.tf (variables definition used by main)

I wanted to keep concepts simple so I used local module. (it can be scaled to other infra use cases.)
so the two modules used are

a) [local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) 🗄

b) [random_pet](https://registry.terraform.io/providers/weekendops/random/latest/docs/resources/pet) 🐶 

Using random_pet sounded more interesting than random passwords or interger or the cloud things. 

### The Logic
So we have two resources and we want to use output of one value as input of/in other.
In our example I simply wanted to generate a pet name and insert it for content argument of local_file module.

I was very skeptical of sequence as I feared that if I use file module first and use pet module second, It may not work.
But apparently it works. (Remember, I am no programmer, call it simpleton mind. I had a thought.. someone else might too better to pen it down for progeny😁)

```
resource "local_file" "namehere" {
 filename = /path/here/mypet.txt
 content = "My pet's name gotta be ${random_pet.petname.id}" 
 }

resource "random_pet" "petname" {
  length = var.length
  prefix = var.prefix
  
}
 ```
 
 The **${random_pet.petname.id}** this is important..
This is now referencing to _"id"_ genrerated from random_pet module. If you read the above linked doc, you should know that random_pet generates a 
> `id` = (string) The random pet name

**${expression..}** This part is apparently called as _"Interpolation Sequence"_ (I was happy calling it Dollar-curly-curly :face_exhaling: ) what it does is, it simply evaluates the expression enclosed in those curly brackets, converts it to a string
and inserts it in our content arguments. (Prrreeettty neat eh? )

The syntax is 
#### $ {ResourceType.ResourceName.Attribute}

* Resource       = random_pet

* Resource_name  = petname

* Attribute      =  id



the parameters are separated by dot (**.**) or a hyphen (**-**).

Now clone this repo, cd into this dir and initialize terraform.

when you `terraform plan` 
it will ask you to enter value for variable filename

```
❯ terraform plan
var.filename
  Enter a value: /YOUR_PATH/ResourceAttributes/pets.txt ⬅

random_pet.petr: Refreshing state... [id=Mr.-skink]

Terraform used the selected providers to       
generate the following execution plan.
Resource actions are indicated with the        
following symbols:
  + create

Terraform will perform the following actions:  

  # local_file.pet will be created
  + resource "local_file" "pet" {
      + content              = "It's name is Mr.-skink"
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = /YOUR_PATH/ResourceAttributes/pets.txt ⬅ 
```

This will be same case with `terraform apply` and/or `terraform destroy` (:raised_eyebrow: why do you want to destroy a pet?)
I did this just so everyone who is learning can take their own path. (pun intented!)
In windows at normal command prompt defining path would produce an access denied error. Why hamper progress when i can avoid it? 👨🏼‍🚀 

Happy terraforming! Maybe you be blessed with many random pets! :smirk_cat: :speak_no_evil: :gorilla::orangutan::skunk::panda_face: 







