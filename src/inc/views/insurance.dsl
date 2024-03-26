        container insuranceSystem "insuranceSystem_All" {
            include *
            autolayout
        }

        container insuranceSystem "Containers_Service1" {
            include ->insuranceSystem.service1->
            autolayout
        }

        container insuranceSystem "Containers_Service2" {
            include ->insuranceSystem.service2->
            autolayout
        }

        container insuranceSystem "Containers_Service3" {
            include ->insuranceSystem.service3->
            autolayout
        }

        component insuranceSystem.service1Api "Containers_Service1_Component" {
            include *
            autolayout
        } 