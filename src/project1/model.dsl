workspace "Domain 1 example" "An example." {
    
    !identifiers hierarchical
    
    model { 

        !include ../inc/person

        !include ../inc/systems
        !include ../inc/relations/simple
        !include ../inc/relations/detailed
        !include ../inc/deployments

    }

    views {
        !include ../inc/views
        styles {
           !include ../inc/styles
        }
    }

}