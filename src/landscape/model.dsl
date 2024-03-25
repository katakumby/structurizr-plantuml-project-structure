
workspace "Theory of everything - Landscape" "Collection of all reusable." {
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