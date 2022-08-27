source "azure-arm" "lx_image" {

  azure_tags = {
    dept = "Engineering"
    task = "Image deployment"
  }
  
	os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-focal"
  image_sku = "20_04-lts"

  managed_image_name                = "myPackerImage"
  managed_image_resource_group_name = "myPackerGroup"

	location = "East US"
  vm_size = "Standard_B1s"

	# For testing without Service account
	# use_azure_cli_auth = true
}

build {
  sources = ["source.azure-arm.lx_image"]

	provisioner "shell" {
    script = "./setup.sh"
  }

	
}