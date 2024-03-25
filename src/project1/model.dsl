workspace "Amazon Web Services Example" "An example AWS deployment architecture." {

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