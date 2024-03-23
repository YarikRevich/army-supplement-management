```plantuml
!pragma teoz true

title 
    Detailed design of "Army Supplement Management" 
end title

header
<font color=red>Warning:</font>
Diagram may be updated.
endheader

cloud "Staff" {
    node "Administrative" as staff_administrative
    node "General" as staff_general
    node "Inventory holders" as staff_inventory_holders
}

cloud "Equipment inventory" {
    node "Arms assignments" as equipment_arms_assignments
    node "Arms disposition" as equipment_arms_disposition
    node "Arms type" as equipment_arms_type
    node "Vehicles assignments" as equipment_vehicles_assignments
    node "Vehicles disposition" as equipment_vehicles_disposition
    node "Vehicles type" as equipment_vehicles_type
    node "Attachments assignments" as equipment_attachments_assignments
    node "Attachments disposition" as equipment_attachments_disposition
    node "Attachments type" as equipment_attachments_type

    equipment_arms_assignments --> equipment_arms_disposition
    equipment_arms_assignments --> equipment_arms_type
    equipment_arms_assignments --> staff_inventory_holders
    
    equipment_vehicles_assignments --> equipment_vehicles_disposition
    equipment_vehicles_assignments --> equipment_vehicles_type

    equipment_attachments_assignments --> equipment_attachments_disposition
    equipment_attachments_assignments --> equipment_attachments_type
}

cloud "Logistics" {
    node "Assignments" as logistics_assignments
    node "Route" as logistics_route
    node "Cargo" as logistics_cargo 

    logistics_assignments --> logistics_route
    logistics_assignments --> logistics_cargo
}

cloud "Communication" {
    node "Logistics journal" as logistics_journal
    node "Logistics journal topic" as logistics_journal_topic
    node "Administration journal" as administration_journal
    node "Administration journal topic" as administration_journal_topic
    node "Equipment inventory journal" as equipment_inventory_journal
    node "Equipment inventory journal topic" as equipment_inventory_journal_topic
    
    logistics_journal --> logistics_journal_topic
    administration_journal --> administration_journal_topic
    equipment_inventory_journal --> equipment_inventory_journal_topic
    
    logistics_journal --> logistics_assignments
    logistics_journal --> staff_administrative
    logistics_journal --> staff_general
    
    administration_journal --> staff_administrative
    administration_journal --> staff_general 
}

cloud "Administration" {
    node "Deployment records"
    node "Trainings"
    node "Permissions"
}
```