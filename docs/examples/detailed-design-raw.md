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

cloud "\l\lStaff" as staff {

entity "staff_personnel" {
    *id : number <<PK>>
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

staff_personnel }|...|| staff_rank #red : <color:red>is assigned as

}

together {
cloud "\l\l\l\lEquipment inventory" as equipment_inventory {

entity "equipment_inventory_arms_assignments" {
    *id : number <<PK>>
    --
    created_at : timestamp
}

entity "equipment_inventory_arms_disposition" {
    *id : number <<PK>>
    --
}

entity "equipment_inventory_arms_type" {
    *id : number <<PK>>
    --
    name : varchar<10>
    caliber : double<5,2>
}

entity "equipment_inventory_vehicles_assignments" {
    *id : number <<PK>>
    --
    created_at : timestamp
}

entity "equipment_inventory_vehicles_disposition" {
    *id : number <<PK>>
    --
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
    --
    created_at : timestamp
}

entity "equipment_inventory_attachments_disposition" {
    *id : number <<PK>>
    --
}

entity "equipment_inventory_attachments_type" {
    *id : number <<PK>>
    --
    name : varchar<10>
    compatability : varchar<10>
}

equipment_inventory_arms_assignments }|...|| equipment_inventory_arms_disposition #green : <color:green>allocates
equipment_inventory_arms_assignments }|...|| staff_personnel #green : <color:green>is issued to
equipment_inventory_arms_disposition }|...|| equipment_inventory_arms_type #green : <color:green>represents

equipment_inventory_vehicles_assignments }|...|| equipment_inventory_vehicles_disposition #green : <color:green>allocates
equipment_inventory_vehicles_assignments }|...|| staff_personnel #green : <color:green>is issued to
equipment_inventory_vehicles_disposition }|...|| equipment_inventory_vehicles_type #green : <color:green>represents

equipment_inventory_attachments_assignments }|...|| equipment_inventory_attachments_disposition #green : <color:green>allocates
equipment_inventory_attachments_assignments }|...|| staff_personnel #green : <color:green>is issued to
equipment_inventory_attachments_disposition }|...|| equipment_inventory_attachments_type #green : <color:green>represents
}

cloud "\l\lAdministration" as administration {
entity "administration_trainings" {
    *id : number <<PK>>
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
    --
    facility : location
    till : timestamp
    since : timestamp
}

entity "administration_permissions" {
    *id : number <<PK>>
    --
}

entity "administration_permission_entries" {
    *id : number <<PK>>
    --
    name : varchar<20>
    scope : enum('administrative', 'executive', 'logistics', 'inventory_holder', 'communication')
}

administration_trainings }|...|| staff_personnel #blue : <color:blue>approved by
administration_trainings }|...|| staff_personnel #blue : <color:blue>initiated by
administration_trainings }|...|| staff_personnel #blue : <color:blue>subordinate
administration_trainings }|...|| administration_trainings_topic #blue : <color:blue>is about

administration_deployment_records }|...|| staff_personnel #blue : <color:blue>approved by

administration_permissions }|...|| staff_personnel #blue : <color:blue>approved by
administration_permissions }|...|| administration_permission_entries #blue : <color:blue>is type of
}
}

cloud "\l\lLogistics" as logistics {

entity "logistics_assignments" {
    *id : number <<PK>>
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

logistics_assignments }|...|| logistics_route #magenta : <color:magenta>directs to
logistics_assignments }|...|| logistics_cargo #magenta : <color:magenta>carries
logistics_assignments }|...|| staff_personnel #magenta : <color:magenta>delivered by

}

cloud "\l\l\lCommunication" as communication {

entity "communication_logistics_journal" {
    *id : number <<PK>>
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
    -- 
    created_at : timestamp
}

entity "communication_equipment_inventory_journal_topic" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

communication_logistics_journal }|...|| logistics_assignments #db006a : <color:#db006a>associated with
communication_logistics_journal }|...|| communication_logistics_journal_topic #db006a : <color:#db006a>is about
communication_logistics_journal }|...|| staff_personnel #db006a : <color:#db006a>initiated by
communication_logistics_journal }|...|| staff_personnel #db006a : <color:#db006a>delivered by

communication_administration_journal }|...|| communication_administration_journal_topic #db006a : <color:#db006a>is about
communication_administration_journal }|...|| staff_personnel #db006a : <color:#db006a>initiated by
communication_administration_journal }|...|| staff_personnel #db006a : <color:#db006a>related to

communication_equipment_inventory_journal }|...|| communication_equipment_inventory_journal_topic #db006a : <color:#db006a>is about
communication_equipment_inventory_journal }|...|| staff_personnel #db006a : <color:#db006a>initiated by
communication_equipment_inventory_journal }|...|| staff_personnel #db006a : <color:#db006a>assigned to
}

footer "Topology represents only one military base out of global topology structure"
```