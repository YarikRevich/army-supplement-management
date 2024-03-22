```plantuml
!pragma teoz true

title 
    Detailed design of "Army Supplement Management" 
end title

header
<font color=red>Warning:</font>
Diagram may be updated.
endheader

cloud "Equipment inventory" as equipment_inventory {

entity "equipment_inventory_arms_assignements" {
    *id : number <<PK>>
    *item : number <<FK>> # equipment_inventory_arms_disposition(id)
    *asigneee : number <<FK>> # staff_inventory_holders(id)
    --
    since : timestamp
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
    name : varchar(10)
    caliber : double(5,2)
}

entity "equipment_inventory_vehicles_assignements" {
    *id : number <<PK>>
    *item : number <<FK>> # equipment_inventory_vehicles_disposition(id)
    *asigneee : number <<FK>> # staff_inventory_holders(id)
    --
    since : timestamp
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
    name : varchar(10)
    engine : enum('ice', 'electric')
    consumption : number
}

entity "equipment_inventory_attachments_assignements" {
    *id : number <<PK>>
    *item : number <<FK>> # equipment_inventory_attachments_disposition(id)
    *asigneee : number <<FK>> # staff_inventory_holders(id)
    --
    since : timestamp
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
    name : varchar(10)
    compatability : varchar(10)
}

equipment_inventory_arms_assignements }o..o{ equipment_inventory_arms_disposition
equipment_inventory_arms_disposition }o..|| equipment_inventory_arms_type

equipment_inventory_vehicles_assignements }o..o{ equipment_inventory_vehicles_disposition
equipment_inventory_vehicles_disposition }o..|| equipment_inventory_vehicles_type

equipment_inventory_attachments_assignements }o..o{ equipment_inventory_attachments_disposition
equipment_inventory_attachments_disposition }o..|| equipment_inventory_attachments_type
}

footer "Topology represents only one military base out of global topology structure"
```