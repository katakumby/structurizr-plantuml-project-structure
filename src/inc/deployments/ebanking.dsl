
        deployment_dev_ibs = deploymentEnvironment "Development" {
            devPc = deploymentNode "Developer Laptop" "" "Microsoft Windows 10 or Apple macOS" {
                browser = deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
                    developerSinglePageApplicationInstance = containerInstance internetBankingSystem.singlePageApplication
                }
                webServer = deploymentNode "Docker Container - Web Server" "" "Docker" {
                   tomcat = deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        developerWebApplicationInstance = containerInstance internetBankingSystem.webApplication
                        developerApiApplicationInstance = containerInstance internetBankingSystem.apiApplication
                    }
                }
                dbServer = deploymentNode "Docker Container - Database Server" "" "Docker" {
                    oracle = deploymentNode "Database Server" "" "Oracle 12c" {
                        developerDatabaseInstance = containerInstance internetBankingSystem.database
                    }
                }
            }
            dc = deploymentNode "Big Bank plc" "" "Big Bank plc data center" "" {
                deploymentNode "bigbank-dev001" "" "" "" {
                    softwareSystemInstance mainframe
                }
            }

        }

        deployment_prod_ibs = deploymentEnvironment "Live" {
            customerMobile =  deploymentNode "Customer's mobile device" "" "Apple iOS or Android" {
                liveMobileAppInstance = containerInstance internetBankingSystem.mobileApp
            }
            customerPc = deploymentNode "Customer's computer" "" "Microsoft Windows or Apple macOS" {
                browser = deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
                    liveSinglePageApplicationInstance = containerInstance internetBankingSystem.singlePageApplication
                }
            }

            dc = deploymentNode "Big Bank plc" "" "Big Bank plc data center" {
                 web = deploymentNode "bigbank-web***" "" "Ubuntu 16.04 LTS" "" 4 {
                    instance = deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        liveWebApplicationInstance = containerInstance internetBankingSystem.webApplication
                    }
                }
                api = deploymentNode "bigbank-api***" "" "Ubuntu 16.04 LTS" "" 8 {
                   instance = deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        liveApiApplicationInstance = containerInstance internetBankingSystem.apiApplication
                    }
                }

                db01 = deploymentNode "bigbank-db01" "" "Ubuntu 16.04 LTS" {
                    primaryDatabaseServer = deploymentNode "Oracle - Primary" "" "Oracle 12c" {
                        livePrimaryDatabaseInstance = containerInstance internetBankingSystem.database
                    }
                }
                db02 = deploymentNode "bigbank-db02" "" "Ubuntu 16.04 LTS" "Failover" {
                    secondaryDatabaseServer = deploymentNode "Oracle - Secondary" "" "Oracle 12c" "Failover" {
                        liveSecondaryDatabaseInstance = containerInstance internetBankingSystem.database "Failover"
                    }
                }
                deploymentNode "bigbank-prod001" "" "" "" {
                    softwareSystemInstance mainframe
                }
            }

            dc.db01.primaryDatabaseServer -> dc.db02.secondaryDatabaseServer "Replicates data to"
        }
        