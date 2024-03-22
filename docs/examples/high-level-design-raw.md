```plantuml
!pragma teoz true

title 
    Detailed design of "Army Supplement Management" 
end title

header
<font color=red>Warning:</font>
Diagram may be updated.
endheader

cloud "Equipment inventory" {
    node "Arms"
    node "Vehicles"
    node "Attachements"
}

cloud "Logistics" {
    node "Route"
    node "Assignements"
}

cloud "Staff" {
    node "Administrative"
    node "General"
}

cloud "Communication" {
    node "Logistics journal"
    node "Administration journal"
    node "Equipment inventory journal"
}

cloud "Administration" {
    node "Deployment records"
    node "Trainings"
    node "Permissions"
}
```