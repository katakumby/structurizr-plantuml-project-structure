        container internetBankingSystem "Containers" {
            include *
            animation {
                customer mainframe email
                internetBankingSystem.webApplication
                internetBankingSystem.singlePageApplication
                internetBankingSystem.mobileApp
                internetBankingSystem.apiApplication
                internetBankingSystem.database
            }
            autoLayout
            description "The container diagram for the Internet Banking System (animation)."
        }
        component internetBankingSystem.apiApplication "Components" {
            include *
            animation {
                internetBankingSystem.singlePageApplication internetBankingSystem.mobileApp internetBankingSystem.database email mainframe
                internetBankingSystem.apiApplication.signinController internetBankingSystem.apiApplication.securityComponent
                internetBankingSystem.apiApplication.accountsSummaryController internetBankingSystem.apiApplication.mainframeBankingSystemFacade
                internetBankingSystem.apiApplication.resetPasswordController internetBankingSystem.apiApplication.emailComponent
            }
            autoLayout
            description "The component diagram for the API Application (animation)."
        }

        image internetBankingSystem.apiApplication.mainframeBankingSystemFacade "MainframeBankingSystemFacade" {
            image https://raw.githubusercontent.com/structurizr/examples/main/dsl/big-bank-plc/internet-banking-system/mainframe-banking-system-facade.png
            title "[Code] Mainframe Banking System Facade"
        }

        dynamic internetBankingSystem.apiApplication "SignIn" "Summarises how the sign in feature works in the single-page application (dynamic)." {
            internetBankingSystem.singlePageApplication -> internetBankingSystem.apiApplication.signinController "Submits credentials to"
            internetBankingSystem.apiApplication.signinController -> internetBankingSystem.apiApplication.securityComponent "Validates credentials using"
            internetBankingSystem.apiApplication.securityComponent -> internetBankingSystem.database "select * from users where username = ?"
            internetBankingSystem.database -> internetBankingSystem.apiApplication.securityComponent "Returns user data to"
            internetBankingSystem.apiApplication.securityComponent -> internetBankingSystem.apiApplication.signinController "Returns true if the hashed password matches"
            internetBankingSystem.apiApplication.signinController -> internetBankingSystem.singlePageApplication "Sends back an authentication token to"
            autoLayout
            description "Summarises how the sign in feature works in the single-page application  (dynamic)."
        }

        deployment internetBankingSystem "Development" "DevelopmentDeployment" {
            include *
            animation {
                # developerSinglePageApplicationInstance
                deployment_dev_ibs.devPc.browser.developerSinglePageApplicationInstance
                deployment_dev_ibs.devPc.webServer.tomcat.developerWebApplicationInstance deployment_dev_ibs.devPc.webServer.tomcat.developerApiApplicationInstance
                deployment_dev_ibs.devPc.dbServer.oracle.developerDatabaseInstance
            }
            autoLayout
            description "An example development deployment scenario for the Internet Banking System."
        }

        deployment internetBankingSystem "Live" "LiveDeployment" {
            include *
            animation {
                deployment_prod_ibs.customerPc.browser.liveSinglePageApplicationInstance
                deployment_prod_ibs.customerMobile.liveMobileAppInstance
                deployment_prod_ibs.dc.web.instance.liveWebApplicationInstance deployment_prod_ibs.dc.api.instance.liveApiApplicationInstance
                deployment_prod_ibs.dc.db01.primaryDatabaseServer.livePrimaryDatabaseInstance
                deployment_prod_ibs.dc.db02.secondaryDatabaseServer.liveSecondaryDatabaseInstance
            }
            autoLayout
            description "An example live deployment scenario for the Internet Banking System."
        }
