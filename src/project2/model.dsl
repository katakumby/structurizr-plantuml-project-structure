
workspace "Big Bank plc" "This is an example workspace to illustrate the key features of Structurizr, via the DSL, based around a fictional online banking system." {
    # !identifiers hierarchical

    model {
        
        !include ../inc/person

        !include ../inc/systems
        
        !include ../inc/relations

        !include ../inc/deployments


    } 

    views {
        !include ../inc/views 
        styles {
            !include ../inc/styles
        }
    }
}