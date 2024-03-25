

/*
 * This is a combined version of the following workspaces, with automatic layout enabled:
 *
 * - "Big Bank plc - System Landscape" (https://structurizr.com/share/28201/)
 * - "Big Bank plc - Internet Banking System" (https://structurizr.com/share/36141/)
*/
workspace extends /model.dsl {
    name "Amazon Web Services Example"
    description "An example AWS deployment architecture."

    model {

        springPetClinic = softwaresystem "Spring PetClinic" "Allows employees to view and manage information regarding the veterinarians, the clients, and their pets." {
            !docs docs/springPetClinic
            webApplication2 = container "Web Application" "Allows employees to view and manage information regarding the veterinarians, the clients, and their pets." "Java and Spring Boot" {
                tags "Application"
            }
            database2 = container "Database" "Stores information regarding the veterinarians, the clients, and their pets." "Relational database schema" {
                tags "Database"
            }
        }

        webApplication2 -> database2 "Reads from and writes to" "MySQL Protocol/SSL"
        # webApplication2 -> service3Api "Reads 2from and writes to" "MySQL Protocol/SSL"
        
        service3Api -> webApplication2 "?Reads 2from and writes to" "MySQL Protocol/SSL"

        webApplication2 -> internetBankingSystem "Initialize payment" "MySQL Protocol/SSL"

        live = deploymentEnvironment "Live2" {

            deploymentNode "Amazon Web Services" {
                tags "Amazon Web Services - Cloud"

                region = deploymentNode "US-East-1" {
                    tags "Amazon Web Services - Region"

                    route53 = infrastructureNode "Route 53" {
                        description "Highly available and scalable cloud DNS service."
                        tags "Amazon Web Services - Route 53"
                    }

                    elb = infrastructureNode "Elastic Load Balancer" {
                        description "Automatically distributes incoming application traffic."
                        tags "Amazon Web Services - Elastic Load Balancing"
                    }

                    deploymentNode "Autoscaling group" {
                        tags "Amazon Web Services - Auto Scaling"

                        deploymentNode "Amazon EC2" {
                            tags "Amazon Web Services - EC2"

                            webApplicationInstance = containerInstance webApplication2
                        }
                    }

                    deploymentNode "Amazon RDS" {
                        tags "Amazon Web Services - RDS"

                        deploymentNode "MySQL" {
                            tags "Amazon Web Services - RDS MySQL instance"

                            databaseInstance = containerInstance database2
                        }
                    }

                }
            }

            route53 -> elb "Forwards requests to" "HTTPS"
            elb -> webApplicationInstance "Forwards requests to" "HTTPS"
        }
   
    }

    views {
        systemlandscape springPetClinic "SystemLandscape" {
            include ->springPetClinic->
            autoLayout
        }
        deployment springPetClinic "Live" "AmazonWebServicesDeployment" {
            include *
            autolayout lr

            animation {
                route53
                elb
                webApplicationInstance
                databaseInstance
            }
        }




    }
}
