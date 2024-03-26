```plantuml
!pragma teoz true
skinparam linetype ortho

title 
    High level design of "Army Supplement Management" 
end title

header
<font color=red>Warning:</font>
Diagram may be updated.
endheader

cloud "Staff" as staff {
    node "Administrative" as staff_administrative
    node "General" as staff_general
    node "Inventory holders" as staff_inventory_holders
}

cloud "Equipment inventory" as equipment_inventory {
    node "Arms assignments" as equipment_arms_assignments
    node "Arms disposition" as equipment_arms_disposition
    node "Arms type" as equipment_arms_type
    
    node "Medicine assignments" as equipment_medicine_assignments
    node "Medicine disposition" as equipment_medicine_disposition
    node "Medicine type" as equipment_medicine_type
    
    node "Vehicles assignments" as equipment_vehicles_assignments
    node "Vehicles disposition" as equipment_vehicles_disposition
    node "Vehicles type" as equipment_vehicles_type
    
    node "Attachments assignments" as equipment_attachments_assignments
    node "Attachments disposition" as equipment_attachments_disposition
    node "Attachments type" as equipment_attachments_type

    equipment_arms_assignments <--[#blue]--> equipment_arms_disposition
    equipment_arms_assignments <--[#blue]--> equipment_arms_type
    equipment_arms_assignments <--[#blue]-> staff_inventory_holders
    
    equipment_medicine_assignments <--[#blue]--> equipment_medicine_disposition
    equipment_medicine_assignments <--[#blue]--> equipment_medicine_type
    equipment_medicine_assignments <-[#blue]--> staff_inventory_holders
    
    equipment_vehicles_assignments <--[#blue]--> equipment_vehicles_disposition
    equipment_vehicles_assignments <-[#blue]--> equipment_vehicles_type
    equipment_vehicles_assignments <-[#blue]--> staff_inventory_holders

    equipment_attachments_assignments <-[#blue]--> equipment_attachments_disposition
    equipment_attachments_assignments <-[#blue]--> equipment_attachments_type
    equipment_attachments_assignments <-[#blue]--> staff_inventory_holders
}

together {
cloud "Administration" as administration {
    node "Deployment records" as administration_deployment_records
    
    node "Trainings" as administration_trainings
    node "Trainings topic" as administration_trainings_topic
    
    node "Permissions" as administration_permissions
    node "Permission entries" as administration_permission_entries
    
    administration_deployment_records <--[#brown]--> staff_administrative
    administration_trainings <--[#brown]--> administration_trainings_topic
    administration_permissions <--[#brown]--> administration_permission_entries
}

cloud "Logistics" as logistics {
    node "Assignments" as logistics_assignments
    node "Route" as logistics_route
    node "Cargo" as logistics_cargo 

    logistics_assignments <--[#red]-> logistics_route
    logistics_assignments <--[#red]-> logistics_cargo
}
}

cloud "Communication" as communication {
    node "Logistics journal" as logistics_journal
    node "Logistics journal topic" as logistics_journal_topic
    
    node "Administration journal" as administration_journal
    node "Administration journal topic" as administration_journal_topic
    
    node "Equipment inventory journal" as equipment_inventory_journal
    node "Equipment inventory journal topic" as equipment_inventory_journal_topic
    
    logistics_journal <-[#green]--> logistics_journal_topic
    administration_journal <-[#green]--> administration_journal_topic
    equipment_inventory_journal <-[#green]--> equipment_inventory_journal_topic
    
    logistics_journal <-[#green]--> logistics_assignments
    logistics_journal <--[#green]--> staff_administrative
    logistics_journal <--[#green]--> staff_general
    
    administration_journal <--[#green]--> staff_administrative
    administration_journal <--[#green]--> staff_general 
}

footer "Topology represents only one military base out of global topology structure"
```