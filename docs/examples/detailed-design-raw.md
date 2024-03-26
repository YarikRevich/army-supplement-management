```plantuml
!pragma teoz true
left to right direction
skinparam nodesep 20
skinparam ranksep 80
scale 300 width
scale 2000 height
skinparam linetype ortho

title 
    Detailed design of "Army Supplement Management" 
end title

header
<font color=red>Warning:</font>
Diagram may be updated.
endheader

cloud "Staff" as staff {

entity "staff_personnel" {
    *id : number <<PK>>
    *rank : number <<FK>> # staff_rank(id)
    --
    name : varchar<20>
    surname : varchar<20>
    age : number<3>
    phone : varchar<15>
    address : varchar<50>
    origin : varchar<30>
    extra_contact : varchar<20>
    kind : enum('external', 'internal')
}

entity "staff_rank" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

staff_personnel }|...|| staff_rank

}

together {
cloud "Equipment inventory" as equipment_inventory {

entity "equipment_inventory_arms_assignments" {
    *id : number <<PK>>
    *item : number <<FK>> # equipment_inventory_arms_disposition(id)
    *assignee : number <<FK>> # staff_personnel(id)
    --
    created_at : timestamp
}

entity "equipment_inventory_arms_disposition" {
    *id : number <<PK>>
    *type : number <<FK>> # equipment_inventory_arms_type(id)
    --
    quantity : number
}

entity "equipment_inventory_arms_type" {
    *id : number <<PK>>
    --
    name : varchar<10>
    caliber : double<5,2>
}

entity "equipment_inventory_vehicles_assignments" {
    *id : number <<PK>>
    *item : number <<FK>> # equipment_inventory_vehicles_disposition(id)
    *assignee : number <<FK>> # staff_personnel(id)
    --
    created_at : timestamp
}

entity "equipment_inventory_vehicles_disposition" {
    *id : number <<PK>>
    *type : number <<FK>> # equipment_inventory_vehicles_type(id)
    --
    quantity : number
}

entity "equipment_inventory_vehicles_type" {
    *id : number <<PK>>
    --
    name : varchar<10>
    engine : enum('ice', 'electric')
    consumption : number
}

entity "equipment_inventory_attachments_assignments" {
    *id : number <<PK>>
    *item : number <<FK>> # equipment_inventory_attachments_disposition(id)
    *assignee : number <<FK>> # staff_personnel(id)
    --
    created_at : timestamp
}

entity "equipment_inventory_attachments_disposition" {
    *id : number <<PK>>
    *type : number <<FK>> # equipment_inventory_attachments_type(id)
    --
    quantity : number
}

entity "equipment_inventory_attachments_type" {
    *id : number <<PK>>
    --
    name : varchar<10>
    compatability : varchar<10>
}

equipment_inventory_arms_assignments }|...|| equipment_inventory_arms_disposition
equipment_inventory_arms_assignments }|...|| staff_personnel
equipment_inventory_arms_disposition }|...|| equipment_inventory_arms_type

equipment_inventory_vehicles_assignments }|...|| equipment_inventory_vehicles_disposition
equipment_inventory_vehicles_assignments }|...|| staff_personnel
equipment_inventory_vehicles_disposition }|...|| equipment_inventory_vehicles_type

equipment_inventory_attachments_assignments }|...|| equipment_inventory_attachments_disposition
equipment_inventory_attachments_assignments }|...|| staff_personnel
equipment_inventory_attachments_disposition }|...|| equipment_inventory_attachments_type
}

cloud "Administration" as administration {
entity "administration_trainings" {
    *id : number <<PK>>
    *approved_by : number <<FK>> # staff_personnel(id) == administrative
    *initiated_by : number <<FK>> # staff_personnel(id) == administrative
    *subordinate : number <<FK>> # staff_personnel(id)
    *topic : number <<FK>> # administration_trainings_topic(id)
    --
    till : timestamp 
    since : timestamp
}

entity "administration_trainings_topic" {
    *id : number <<PK>>
    --
    name : varchar<50>
    type : enum('combat', 'management')
}

entity "administration_deployment_records" {
    *id : number <<PK>>
    *approved_by : number <<FK>> # staff_personnel(id) == administrative
    --
    facility : location
    till : timestamp
    since : timestamp
}

entity "administration_permissions" {
    *id : number <<PK>>
    *approved_by : number <<FK>> # staff_personnel(id) == administrative
    *entry : number <<FK>> # administration_permission_entries(id)
    --
}

entity "administration_permission_entries" {
    *id : number <<PK>>
    --
    name : varchar<20>
    scope : enum('administrative', 'executive', 'logistics', 'inventory_holder', 'communication')
}

administration_trainings }|...|| staff_personnel
administration_trainings }|...|| administration_trainings_topic

administration_deployment_records }|...|| staff_personnel

administration_permissions }|...|| staff_personnel
administration_permissions }|...|| administration_permission_entries
}
}

cloud "Logistics" as logistics {

entity "logistics_assignments" {
    *id : number <<PK>>
    *route : number <<FK>> # logistics_route(id)
    *cargo : number <<FK>> # logistics_cargo(id)
    *assignee : number <<FK>> # staff_personnel(id)
    --
    created_at : timestamp
}

entity "logistics_route" {
    *id : number <<PK>>
    --
    from : location
    to : location

}

entity "logistics_cargo" {
    *id : number <<PK>>
    --
    name : varchar<20>
    description : varchar<100>
    delivered : boolean
    created_at : timestamp
}

logistics_assignments }|...|| logistics_route
logistics_assignments }|...|| logistics_cargo
logistics_assignments }|...|| staff_personnel

}

cloud "Communication" as communication {

entity "communication_logistics_journal" {
    *id : number <<PK>>
    *initiated_by : number <<FK>> # staff_personnel(id) == administrative
    *subordinate : number <<FK>> # staff_personnel(id)
    *assignment : number <<FK>> # logistics_assignments(id)
    *topic : number <<FK>> # communication_logistics_journal_topic(id)
    --
    created_at : timestamp
}

entity "communication_logistics_journal_topic" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

entity "communication_administration_journal" {
    *id : number <<PK>>
    *initiated_by : number <<FK>> # staff_personnel(id) == administrative
    *subordinate : number <<FK>> # staff_personnel(id)
    *topic : number <<FK>> # communication_administration_journal_topic(id)
    -- 
    created_at : timestamp
}

entity "communication_administration_journal_topic" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

entity "communication_equipment_inventory_journal" {
    *id : number <<PK>>
    *initiated_by : number <<FK>> # staff_personnel(id) == administrative
    *subordinate : number <<FK>> # staff_arm_holder(id)
    *topic : number <<FK>> # communication_equipment_inventory_journal_topic(id)
    -- 
    created_at : timestamp
}

entity "communication_equipment_inventory_journal_topic" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

communication_logistics_journal }|...|| logistics_assignments
communication_logistics_journal }|...|| communication_logistics_journal_topic
communication_logistics_journal }|...|| staff_personnel

communication_administration_journal }|...|| communication_administration_journal_topic
communication_administration_journal }|...|| staff_personnel

communication_equipment_inventory_journal }|...|| communication_equipment_inventory_journal_topic
communication_equipment_inventory_journal }|...|| staff_personnel
}

footer "Topology represents only one military base out of global topology structure"
```