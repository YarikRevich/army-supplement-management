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
    node "Personnel" as staff_personnel
    node "Rank" as staff_rank
    
    staff_personnel <-[#red]--> staff_rank
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

    equipment_arms_assignments <--[#green]--> equipment_arms_disposition
    equipment_arms_assignments <--[#green]--> equipment_arms_type
    equipment_arms_assignments <--[#green]-> staff_personnel
    
    equipment_medicine_assignments <--[#green]--> equipment_medicine_disposition
    equipment_medicine_assignments <--[#green]--> equipment_medicine_type
    equipment_medicine_assignments <-[#green]--> staff_personnel
    
    equipment_vehicles_assignments <--[#green]--> equipment_vehicles_disposition
    equipment_vehicles_assignments <-[#green]--> equipment_vehicles_type
    equipment_vehicles_assignments <-[#green]--> staff_personnel

    equipment_attachments_assignments <-[#green]--> equipment_attachments_disposition
    equipment_attachments_assignments <-[#green]--> equipment_attachments_type
    equipment_attachments_assignments <-[#green]--> staff_personnel
}

together {
cloud "Administration" as administration {
    node "Deployment records" as administration_deployment_records
    
    node "Trainings" as administration_trainings
    node "Trainings topic" as administration_trainings_topic
    
    node "Permissions" as administration_permissions
    node "Permission entries" as administration_permission_entries
    
    administration_deployment_records <--[#blue]--> staff_personnel
    administration_trainings <--[#blue]--> administration_trainings_topic
    administration_trainings <--[#blue]--> staff_personnel
    administration_permissions <--[#blue]--> administration_permission_entries
    administration_permissions <--[#blue]--> staff_personnel
}

cloud "Logistics" as logistics {
    node "Assignments" as logistics_assignments
    node "Route" as logistics_route
    node "Cargo" as logistics_cargo 

    logistics_assignments <--[#magenta]-> staff_personnel
    logistics_assignments <--[#magenta]-> logistics_route
    logistics_assignments <--[#magenta]-> logistics_cargo
}
}

cloud "Communication" as communication {
    node "Logistics journal" as logistics_journal
    node "Logistics journal topic" as logistics_journal_topic
    
    node "Administration journal" as administration_journal
    node "Administration journal topic" as administration_journal_topic
    
    node "Equipment inventory journal" as equipment_inventory_journal
    node "Equipment inventory journal topic" as equipment_inventory_journal_topic
    
    logistics_journal <-[#db006a]--> logistics_journal_topic
    logistics_journal <-[#db006a]--> logistics_assignments
    logistics_journal <--[#db006a]--> staff_personnel
    
    administration_journal <-[#db006a]--> administration_journal_topic
    administration_journal <--[#db006a]--> staff_personnel
    
    equipment_inventory_journal <-[#db006a]--> equipment_inventory_journal_topic
    equipment_inventory_journal <--[#db006a]--> staff_personnel
}

footer "Topology represents only one military base out of global topology structure"
```