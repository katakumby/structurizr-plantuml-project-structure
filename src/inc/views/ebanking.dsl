        container internetBankingSystem "Containers" {
            include *
            animation {
                customer mainframe email
                webApplication
                singlePageApplication
                mobileApp
                apiApplication
                database
            }
            autoLayout
            description "The container diagram for the Internet Banking System."
        }

        component apiApplication "Components" {
            include *
            animation {
                singlePageApplication mobileApp database email mainframe
                signinController securityComponent
                accountsSummaryController mainframeBankingSystemFacade
                resetPasswordController emailComponent
            }
            autoLayout
            description "The component diagram for the API Application."
        }

        image mainframeBankingSystemFacade "MainframeBankingSystemFacade" {
            image https://raw.githubusercontent.com/structurizr/examples/main/dsl/big-bank-plc/internet-banking-system/mainframe-banking-system-facade.png
            title "[Code] Mainframe Banking System Facade"
        }

        dynamic apiApplication "SignIn" "Summarises how the sign in feature works in the single-page application." {
            singlePageApplication -> signinController "Submits credentials to"
            signinController -> securityComponent "Validates credentials using"
            securityComponent -> database "select * from users where username = ?"
            database -> securityComponent "Returns user data to"
            securityComponent -> signinController "Returns true if the hashed password matches"
            signinController -> singlePageApplication "Sends back an authentication token to"
            autoLayout
            description "Summarises how the sign in feature works in the single-page application."
        }

        deployment internetBankingSystem "Development" "DevelopmentDeployment" {
            include *
            animation {
                developerSinglePageApplicationInstance
                developerWebApplicationInstance developerApiApplicationInstance
                developerDatabaseInstance
            }
            autoLayout
            description "An example development deployment scenario for the Internet Banking System."
        }

        deployment internetBankingSystem "Live" "LiveDeployment" {
            include *
            animation {
                liveSinglePageApplicationInstance
                liveMobileAppInstance
                liveWebApplicationInstance liveApiApplicationInstance
                livePrimaryDatabaseInstance
                liveSecondaryDatabaseInstance
            }
            autoLayout
            description "An example live deployment scenario for the Internet Banking System."
        }
