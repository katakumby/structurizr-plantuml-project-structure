            insuranceSystem -> internetBankingSystem "Uses"

            //todo uncomment this 
            # internetBankingSystem -> insuranceSystem "Uses2" 
            insuranceSystem.service1Api -> internetBankingSystem.apiApplication.signinController "Some service to component"
            
            insuranceSystem.service1Api.rest -> internetBankingSystem.apiApplication.signinController "Some component to component1"
            internetBankingSystem.apiApplication.signinController -> insuranceSystem.service1Api.rest "Some component to component2"

            