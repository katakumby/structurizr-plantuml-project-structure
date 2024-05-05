

/*
 * This is a combined version of the following workspaces, with automatic layout enabled:
 *
 * - "Big Bank plc - System Landscape" (https://structurizr.com/share/28201/)
 * - "Big Bank plc - Internet Banking System" (https://structurizr.com/share/36141/)
*/
workspace extends ../../model.dsl {
    name "Amazon Web Services Example"
    description "An example AWS deployment architecture."

    model {

        springPetClinic = softwaresystem "Spring PetClinic" "Allows employees to view and manage information regarding the veterinarians, the clients, and their pets." {
            webApplication2 = container "Web Application" "Allows employees to view and manage information regarding the veterinarians, the clients, and their pets." "Java and Spring Boot" {
                tags "Application"
            }
            database2 = container "Database" "Stores information regarding the veterinarians, the clients, and their pets." "Relational database schema" {
                tags "Database"
            }
        }
        
        insuranceSystem.service3Api -> webApplication2 "?Reads 2from and writes to" "MySQL Protocol/SSL"
   
    }

    views {
        systemlandscape springPetClinic "SystemLandscape" {
            include ->springPetClinic->
            autoLayout
        }


    }
}
