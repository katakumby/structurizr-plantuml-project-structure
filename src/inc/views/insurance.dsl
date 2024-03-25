        container insuranceSystem "insuranceSystem_All" {
            include *
            autolayout
        }

        container insuranceSystem "Containers_Service1" {
            include ->service1->
            autolayout
        }

        container insuranceSystem "Containers_Service2" {
            include ->service2->
            autolayout
        }

        container insuranceSystem "Containers_Service3" {
            include ->service3->
            autolayout
        }