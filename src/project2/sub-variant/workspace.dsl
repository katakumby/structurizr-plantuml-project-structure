

/*
 * This is a combined version of the following workspaces, with automatic layout enabled:
 *
 * - "Big Bank plc - System Landscape" (https://structurizr.com/share/28201/)
 * - "Big Bank plc - Internet Banking System" (https://structurizr.com/share/36141/)
*/
workspace extends ../model.dsl {
    name "Big Bank plc - System Landscape"
    description "The system landscape for Big Bank plc."

    model {
        # !ref internetbankingsystem {
        #     url https://structurizr.com/share/36141/diagrams#SystemContext
        # }
    }

    views {
        systemlandscape "TEST1_SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext internetBankingSystem "SystemContext" {
            include *
            animation {
                internetBankingSystem
                customer
                mainframe
                email
            }
            autoLayout
            description "The system context diagram for the Internet Banking System."
            properties {
                structurizr.groups false
            }
        }

    }

}
