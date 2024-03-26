        insuranceSystem = softwareSystem "Insurance system"{

            webapp = container "Web Application"

            service1 = group "Service 1" {
                service1Api = container "Service 1 API" {
                    tags "Service 1" "Service API"

                    rest = component "REST API?" "REST" "Service 1" "Service API"
                }
                container "Service 1 Database" {
                    tags "Service 1" "Database"
                    service1Api -> this "Reads from and writes to"
                }
            }

            service2 = group "Service 2" {
                service2Api = container "Service 2 API" {
                    tags "Service 2" "Service API"
                }
                container "Service 2 Database" {
                    tags "Service 2" "Database"
                    service2Api -> this "Reads from and writes to"
                }
            }

            service3 = group "Service 3" {
                service3Api = container "Service 3 API" {
                    tags "Service 3" "Service API"
                }
                container "Service 3 Database" {
                    tags "Service 3" "Database"
                    service3Api -> this "Reads from and writes to"
                }
                
            }

            service4 = group "Service 4" {
                service4Api = container "Service 4 API" {
                    tags "Service 4" "Service API"
                }
                container "Service 4 Database" {
                    tags "Service 4" "Database"
                    service4Api -> this "Reads from and writes to"
                }
            }

            service5 = group "Service 5" {
                service5Api = container "Service 5 API" {
                    tags "Service 5" "Service API"
                }
                container "Service 5 Database" {
                    tags "Service 5" "Database"
                    service5Api -> this "Reads from and writes to"
                }
            }

            service6 = group "Service 6" {
                service6Api = container "Service 6 API" {
                    tags "Service 6" "Service API"
                }
                container "Service 6 Database" {
                    tags "Service 6" "Database"
                    service6Api -> this "Reads from and writes to"
                }
            }

            service7 = group "Service 7" {
                service7Api = container "Service 7 API" {
                    tags "Service 7" "Service API"
                }
                container "Service 7 Database" {
                    tags "Service 7" "Database"
                    service7Api -> this "Reads from and writes to"
                }
            }

            service8 = group "Service 8" {
                service8Api = container "Service 8 API" {
                    tags "Service 8" "Service API"
                }
                container "Service 8 Database" {
                    tags "Service 8" "Database"
                    service8Api -> this "Reads from and writes to"
                }
            }

        }