--
-- Name: army_supplement_management; Type: DATABASE; Schema: public
--

DROP DATABASE IF EXISTS army_supplement_management;

--
-- Name: army_supplement_management; Type: DATABASE; Schema: public
--

CREATE DATABASE army_supplement_management;

--
-- Name: army_supplement_management; Type: DATABASE; Schema: public
--

USE army_supplement_management;

--
-- Name: staff_personnel; Type: TABLE; Schema: public
--

CREATE TABLE staff_personnel (
    id int PRIMARY KEY,
    `rank` int NOT NULL,

    name varchar(20) NOT NULL,
    surname varchar(20) NOT NULL,
    phone varchar(20) NOT NULL,
    address varchar(50) NOT NULL,
    origin varchar(30) NOT NULL,
    extra_contact varchar(20) NOT NULL,
    kind ENUM('external','internal') NOT NULL
);

--
-- Name: staff_rank; Type: TABLE; Schema: public
--

CREATE TABLE staff_rank (
    id int PRIMARY KEY,
    name varchar(20) NOT NULL UNIQUE
);

--
-- Name: transaction fk_staff_personnel_rank; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE staff_personnel ADD CONSTRAINT fk_staff_personnel_rank FOREIGN KEY (`rank`) REFERENCES staff_rank(id) ON DELETE CASCADE;

--
-- Name: equipment_inventory_arms_assignments; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_arms_assignments (
    id int PRIMARY KEY,
    item int NOT NULL,
    assignee int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: equipment_inventory_arms_disposition; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_arms_disposition (
    id int PRIMARY KEY,
    type int NOT NULL
);

--
-- Name: equipment_inventory_arms_type; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_arms_type (
    id int PRIMARY KEY,
    name varchar(10) NOT NULL UNIQUE,
    caliber double(5, 2) NOT NULL
);

--
-- Name: transaction fk_equipment_inventory_arms_disposition_type; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_arms_disposition ADD CONSTRAINT fk_equipment_inventory_arms_disposition_type FOREIGN KEY (type) REFERENCES equipment_inventory_arms_type(id) ON DELETE CASCADE;

--
-- Name: transaction fk_equipment_inventory_arms_assignments_item; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_arms_assignments ADD CONSTRAINT fk_equipment_inventory_arms_assignments_item FOREIGN KEY (item) REFERENCES equipment_inventory_arms_disposition(id) ON DELETE CASCADE;

--
-- Name: transaction fk_equipment_inventory_arms_assignments_assignee; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_arms_assignments ADD CONSTRAINT fk_equipment_inventory_arms_assignments_assignee FOREIGN KEY (assignee) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: equipment_inventory_vehicles_assignments; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_vehicles_assignments (
    id int PRIMARY KEY,
    item int NOT NULL,
    assignee int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: equipment_inventory_vehicles_disposition; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_vehicles_disposition (
    id int PRIMARY KEY,
    type int NOT NULL
);

--
-- Name: equipment_inventory_vehicles_type; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_vehicles_type (
    id int PRIMARY KEY,
    engine ENUM('ice', 'electric') NOT NULL,
    consumption int NOT NULL
);

--
-- Name: transaction fk_equipment_inventory_vehicles_disposition_type; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_vehicles_disposition ADD CONSTRAINT fk_equipment_inventory_vehicles_disposition_type FOREIGN KEY (type) REFERENCES equipment_inventory_vehicles_type(id) ON DELETE CASCADE;

--
-- Name: transaction fk_equipment_inventory_vehicles_assignments_item; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_vehicles_assignments ADD CONSTRAINT fk_equipment_inventory_vehicles_assignments_item FOREIGN KEY (item) REFERENCES equipment_inventory_vehicles_disposition(id) ON DELETE CASCADE;

--
-- Name: transaction fk_equipment_inventory_vehicles_assignments_assignee; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_vehicles_assignments ADD CONSTRAINT fk_equipment_inventory_vehicles_assignments_assignee FOREIGN KEY (assignee) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: equipment_inventory_attachments_assignments; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_attachments_assignments (
    id int PRIMARY KEY,
    item int NOT NULL,
    assignee int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: equipment_inventory_attachments_disposition; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_attachments_disposition (
    id int PRIMARY KEY,
    type int NOT NULL
);

--
-- Name: equipment_inventory_attachments_type; Type: TABLE; Schema: public
--

CREATE TABLE equipment_inventory_attachments_type (
    id int PRIMARY KEY,
    name varchar(10) NOT NULL,
    compatibility varchar(10) NOT NULL
);

--
-- Name: transaction fk_equipment_inventory_attachments_disposition_type; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_attachments_disposition ADD CONSTRAINT fk_equipment_inventory_attachments_disposition_type FOREIGN KEY (type) REFERENCES equipment_inventory_attachments_type(id) ON DELETE CASCADE;

--
-- Name: transaction fk_equipment_inventory_attachments_assignments_item; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_attachments_assignments ADD CONSTRAINT fk_equipment_inventory_attachments_assignments_item FOREIGN KEY (item) REFERENCES equipment_inventory_attachments_disposition(id) ON DELETE CASCADE;

--
-- Name: transaction fk_equipment_inventory_attachments_assignments_assignee; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE equipment_inventory_attachments_assignments ADD CONSTRAINT fk_equipment_inventory_attachments_assignments_assignee FOREIGN KEY (assignee) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: logistics_assignments; Type: TABLE; Schema: public
--

CREATE TABLE logistics_assignments (
    id int PRIMARY KEY,
    route int NOT NULL, 
    cargo int NOT NULL,
    assignee int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: logistics_route; Type: TABLE; Schema: public
--

CREATE TABLE logistics_route (
    id int PRIMARY KEY,
    `from` double NOT NULL,
    `to` double NOT NULL
);

--
-- Name: logistics_cargo; Type: TABLE; Schema: public
--

CREATE TABLE logistics_cargo (
    id int PRIMARY KEY,
    name varchar(20) NOT NULL,
    description varchar(100) NOT NULL,
    delivered boolean NOT NULL,
    created_at datetime NOT NULL
);

--
-- Name: transaction fk_logistics_assignments_route; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE logistics_assignments ADD CONSTRAINT fk_logistics_assignments_route FOREIGN KEY (route) REFERENCES logistics_route(id) ON DELETE CASCADE;

--
-- Name: transaction fk_logistics_assignments_cargo; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE logistics_assignments ADD CONSTRAINT fk_logistics_assignments_cargo FOREIGN KEY (cargo) REFERENCES logistics_cargo(id) ON DELETE CASCADE;

--
-- Name: transaction fk_logistics_assignments_assignee; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE logistics_assignments ADD CONSTRAINT fk_logistics_assignments_assignee FOREIGN KEY (assignee) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: administration_trainings; Type: TABLE; Schema: public
--

CREATE TABLE administration_trainings (
    id int PRIMARY KEY,
    approved_by int NOT NULL,
    initiated_by int NOT NULL,
    subordinate int NOT NULL,
    topic int NOT NULL,

    till double NOT NULL,
    since double NOT NULL
);


--
-- Name: administration_trainings_topic; Type: TABLE; Schema: public
--

CREATE TABLE administration_trainings_topic (
    id int PRIMARY KEY,
    name varchar(50) NOT NULL,
    type ENUM('combat', 'management') NOT NULL
);

--
-- Name: administration_deployment_records; Type: TABLE; Schema: public
--

CREATE TABLE administration_deployment_records (
    id int PRIMARY KEY,
    approved_by int NOT NULL,

    facility double NOT NULL, 
    till datetime NOT NULL,
    since datetime NOT NULL
);

--
-- Name: administration_permissions; Type: TABLE; Schema: public
--

CREATE TABLE administration_permissions (
    id int PRIMARY KEY,
    approved_by int NOT NULL,
    entry int NOT NULL
);

--
-- Name: administration_permission_entries; Type: TABLE; Schema: public
--

CREATE TABLE administration_permission_entries (
    id int PRIMARY KEY,
    name varchar(20) NOT NULL,
    scope ENUM('administrative', 'executive', 'logistics', 'inventory', 'communication') NOT NULL
);

--
-- Name: transaction fk_administration_trainings_approved_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_trainings ADD CONSTRAINT fk_administration_trainings_approved_by FOREIGN KEY (approved_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_trainings_initiated_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_trainings ADD CONSTRAINT fk_administration_trainings_initiated_by FOREIGN KEY (initiated_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_trainings_subordinate; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_trainings ADD CONSTRAINT fk_administration_trainings_subordinate FOREIGN KEY (subordinate) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_trainings_topic; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_trainings ADD CONSTRAINT fk_administration_trainings_topic FOREIGN KEY (topic) REFERENCES administration_trainings_topic(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_deployment_records_approved_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_deployment_records ADD CONSTRAINT fk_administration_deployment_records_approved_by FOREIGN KEY (approved_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_permissions_approved_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_permissions ADD CONSTRAINT fk_administration_permissions_approved_by FOREIGN KEY (approved_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_permissions_entry; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_permissions ADD CONSTRAINT fk_administration_permissions_entry FOREIGN KEY (entry) REFERENCES administration_permission_entries(id) ON DELETE CASCADE;

--
-- Name: communication_logistics_journal; Type: TABLE; Schema: public
--

CREATE TABLE communication_logistics_journal (
    id int PRIMARY KEY,
    initiated_by int NOT NULL,
    subordinate int NOT NULL,
    assignment int NOT NULL,
    topic int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: communication_logistics_journal_topic; Type: TABLE; Schema: public
--

CREATE TABLE communication_logistics_journal_topic (
    id int PRIMARY KEY,
    name varchar(20) NOT NULL
);

--
-- Name: communication_administration_journal; Type: TABLE; Schema: public
--

CREATE TABLE communication_administration_journal (
    id int PRIMARY KEY,
    initiated_by int NOT NULL,
    subordinate int NOT NULL,
    topic int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: communication_administration_journal_topic; Type: TABLE; Schema: public
--

CREATE TABLE communication_administration_journal_topic (
    id int PRIMARY KEY,
    name varchar(20) NOT NULL
);

--
-- Name: communication_equipment_inventory_journal; Type: TABLE; Schema: public
--

CREATE TABLE communication_equipment_inventory_journal (
    id int PRIMARY KEY,
    initiated_by int NOT NULL,
    subordinate int NOT NULL,
    topic int NOT NULL,

    created_at datetime NOT NULL
);

--
-- Name: communication_equipment_inventory_journal_topic; Type: TABLE; Schema: public
--

CREATE TABLE communication_equipment_inventory_journal_topic (
    id int PRIMARY KEY,
    name varchar(20) NOT NULL
);

--
-- Name: transaction fk_communication_logistics_journal_initiated_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_logistics_journal ADD CONSTRAINT fk_communication_logistics_journal_initiated_by FOREIGN KEY (initiated_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_logistics_journal_subordinate; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_logistics_journal ADD CONSTRAINT fk_communication_logistics_journal_subordinate FOREIGN KEY (subordinate) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_logistics_journal_assignment; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_logistics_journal ADD CONSTRAINT fk_communication_logistics_journal_assignment FOREIGN KEY (assignment) REFERENCES logistics_assignments(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_logistics_journal_topic; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_logistics_journal ADD CONSTRAINT fk_communication_logistics_journal_topic FOREIGN KEY (topic) REFERENCES communication_logistics_journal_topic(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_administration_journal_initiated_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_administration_journal ADD CONSTRAINT fk_communication_administration_journal_initiated_by FOREIGN KEY (initiated_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_administration_journal_subordinate; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_administration_journal ADD CONSTRAINT fk_communication_administration_journal_subordinate FOREIGN KEY (subordinate) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_administration_journal_topic; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_administration_journal ADD CONSTRAINT fk_communication_administration_journal_topic FOREIGN KEY (topic) REFERENCES communication_administration_journal_topic(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_equipment_inventory_journal_initiated_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_equipment_inventory_journal ADD CONSTRAINT fk_communication_equipment_inventory_journal_initiated_by FOREIGN KEY (initiated_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_equipment_inventory_journal_subordinate; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_equipment_inventory_journal ADD CONSTRAINT fk_communication_equipment_inventory_journal_subordinate FOREIGN KEY (subordinate) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_communication_equipment_inventory_journal_topic; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE communication_equipment_inventory_journal ADD CONSTRAINT fk_communication_equipment_inventory_journal_topic FOREIGN KEY (topic) REFERENCES communication_equipment_inventory_journal_topic(id) ON DELETE CASCADE;