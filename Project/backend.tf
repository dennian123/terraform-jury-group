# terraform {
#     backend "s3" {   
#         backet = "terraform-project-virginia-backend"
#         key = "terraform-project/terraform.tfstate"
#         region = "us-east-1"   
#         # dynamodb_tabel = "table-name"
#     }
# }

terraform{
    backend "s3" {
        bucket = "terraform-project-ohio-backend"    #can be any. Must match name of your s3 backet
        key = "terraform-project/terraform.tfstate"  #provide the folder where terraform.tfstate file wiill be saved
        region = "us-east-2"
        dynamodb_table = "lock-state"                
    }
}
# terraform {
#     backend "s3" {
#         backet = "terraform-project-californiaBackend"
#         key = "terraform-project/terraform.tfstate"
#         region = "us-west-1"
#         # dynamodb_tabel = "table-name"
#     }
# }
# terraform {
#     backend "s3" {
#         backet = "terraform-project-oregonBackend"
#         key = "terraform-project/terraform.tfstate"
#         region = "us-west-2"
#         # dynamodb_tabel = "table-name"
#     }
# }
