Make sure that the terminal is in the directory where  `main.tf`  is located:

-   Run the following command for Terraform to get any required dependencies based on the cloud provider being used:  
    `terraform init`
    
-   Run the following command to scan the  `main.tf`  for any issues:  
    `terraform plan`
    
-   Run the following command to create the real resource:  
    `terraform apply`
    
    Ensure that you check the changes that this action will make to your infrastructure and type  `yes`  to agree.

#### Clean up

To delete the created resource run the following command in the terminal, make sure that the terminal is in the directory where  `main.tf`  is located:  
`terraform destroy`

Ensure that you check the changes that this action will make to your infrastructure and type  `yes`  to agree.