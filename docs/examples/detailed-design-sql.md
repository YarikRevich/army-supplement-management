```plantuml
!pragma teoz true

title 
    Detailed SQL design of "Army Supplement Management" 
end title

header
<font color=red>Warning:</font>
Diagram may be updated.
endheader

cloud "\l\lEquipment inventory" as equipment_inventory {

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
}

entity "equipment_inventory_attachments_type" {
    *id : number <<PK>>
    --
    name : varchar<10>
    compatability : varchar<10>
}

}

cloud "\l\lLogistics" as logistics {

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

}

cloud "\l\lStaff" as staff {

entity "staff_rank" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

entity "staff_personnel" {
    *id : number <<PK>>
    *rank : number <<FK>> # staff_rank(id)
    --
    name : varchar<20>
    surname : varchar<20>
    phone : varchar<15>
    address : varchar<50>
    origin : varchar<30>
    extra_contact : varchar<20>
    kind : enum('external', 'internal')
}

}

cloud "\l\lCommunication" as communication {

entity "communication_logistics_journal" {
    *id : number <<PK>>
    *initiated_by : number <<FK>> # staff_personnel(id)
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
    *initiated_by : number <<FK>> # staff_personnel(id)
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
    *initiated_by : number <<FK>> # staff_personnel(id)
    *subordinate : number <<FK>> # staff_personnel(id)
    *topic : number <<FK>> # communication_equipment_inventory_journal_topic(id)
    -- 
    created_at : timestamp
}

entity "communication_equipment_inventory_journal_topic" {
    *id : number <<PK>>
    --
    name : varchar<20>
}

}

cloud "\l\lAdministration" as administration {
entity "administration_trainings" {
    *id : number <<PK>>
    *approved_by : number <<FK>> # staff_personnel(id)
    *initiated_by : number <<FK>> # staff_personnel(id)
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
    *approved_by : number <<FK>> # staff_personnel(id)
    --
    facility : location
    till : timestamp
    since : timestamp
}

entity "administration_permissions" {
    *id : number <<PK>>
    *approved_by : number <<FK>> # staff_personnel(id)
    *entry : number <<FK>> # administration_permission_entries(id)
    --
}

entity "administration_permission_entries" {
    *id : number <<PK>>
    --
    name : varchar<20>
    scope : enum('administrative', 'executive', 'logistics', 'inventory', 'communication')
}

}

footer "Topology represents only one military base out of global topology structure"
```