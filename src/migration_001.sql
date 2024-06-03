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
-- Name: staff_rank; Type: INSERT INTO; Schema: public
--

INSERT INTO staff_rank (id, name) VALUES (0, "private");

--
-- Name: staff_rank; Type: INSERT INTO; Schema: public
--

INSERT INTO staff_rank (id, name) VALUES (1, "commander in chief");

--
-- Name: staff_personnel; Type: INSERT INTO; Schema: public
--

INSERT INTO staff_personnel (id, `rank`, name, surname, phone, address, origin, extra_contact, kind) VALUES (0, 0, "Yaroslav", "Svitlytskyi", "+380632260576", "Zaporizhzhya, Svitla 16", "Ukrainian", "+380936260575", "internal");

--
-- Name: staff_personnel; Type: INSERT INTO; Schema: public
--

INSERT INTO staff_personnel (id, `rank`, name, surname, phone, address, origin, extra_contact, kind) VALUES (1, 1, "Oleksandr", "Syrskyi", "+380632260572", "Kyiv, Nezalezhnosti 15", "Ukrainian", "+380936260573", "internal");


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
-- Name: equipment_inventory_arms_type; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_arms_type (id, name, caliber) VALUES (0, "auto rifle", 5.56);

--
-- Name: equipment_inventory_arms_disposition; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_arms_disposition (id, type) VALUES (0, 0);

--
-- Name: equipment_inventory_arms_assignments; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_arms_assignments (id, item, assignee, created_at) VALUES (0, 0, 0, NOW());

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
-- Name: equipment_inventory_vehicles_type; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_vehicles_type (id, engine, consumption) VALUES (0, "ice", 6);

--
-- Name: equipment_inventory_vehicles_disposition; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_vehicles_disposition (id, type) VALUES (0, 0);

--
-- Name: equipment_inventory_vehicles_assignments; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_vehicles_assignments (id, item, assignee, created_at) VALUES (0, 0, 0, NOW());

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
-- Name: equipment_inventory_attachments_type; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_attachments_type (id, name, compatibility) VALUES (0, "magnifier", "auto rifle");

--
-- Name: equipment_inventory_attachments_disposition; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_attachments_disposition (id, type) VALUES (0, 0);

--
-- Name: equipment_inventory_attachments_assignments; Type: INSERT INTO; Schema: public
--

INSERT INTO equipment_inventory_attachments_assignments (id, item, assignee, created_at) VALUES (0, 0, 0, NOW());

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

    from_longitude double NOT NULL,
    from_latitude double NOT NULL,
    to_longitude double NOT NULL,
    to_latitude double NOT NULL
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
-- Name: logistics_cargo; Type: INSERT INTO; Schema: public
--

INSERT INTO logistics_cargo (id, name, description, delivered, created_at) VALUES (0, "SS-18(Satan)", "Atomic bomb", false, NOW());

--
-- Name: logistics_route; Type: INSERT INTO; Schema: public
--

INSERT INTO logistics_route (id, from_longitude, from_latitude, to_longitude, to_latitude) VALUES (0, 50.45025118334274, 30.523905913252587, 55.75097851129243, 37.617478911934136);

--
-- Name: logistics_assignments; Type: INSERT INTO; Schema: public
--

INSERT INTO logistics_assignments (id, route, cargo, assignee, created_at) VALUES (0, 0, 0, 0, NOW());

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
    subordinate int NOT NULL,

    facility_longitude double NOT NULL,
    facility_latitude double NOT NULL,
    till datetime NOT NULL,
    since datetime NOT NULL
);

--
-- Name: administration_permissions; Type: TABLE; Schema: public
--

CREATE TABLE administration_permissions (
    id int PRIMARY KEY,
    approved_by int NOT NULL,
    subordinate int NOT NULL,

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
-- Name: transaction fk_administration_deployment_records_subordinate; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_deployment_records ADD CONSTRAINT fk_administration_deployment_records_subordinate FOREIGN KEY (subordinate) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_permissions_approved_by; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_permissions ADD CONSTRAINT fk_administration_permissions_approved_by FOREIGN KEY (approved_by) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_permissions_subordinate; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_permissions ADD CONSTRAINT fk_administration_permissions_subordinate FOREIGN KEY (subordinate) REFERENCES staff_personnel(id) ON DELETE CASCADE;

--
-- Name: transaction fk_administration_permissions_entry; Type: FK CONSTRAINT; Schema: public
--

ALTER TABLE administration_permissions ADD CONSTRAINT fk_administration_permissions_entry FOREIGN KEY (entry) REFERENCES administration_permission_entries(id) ON DELETE CASCADE;

--
-- Name: administration_permission_entries; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_permission_entries (id, name, scope) VALUES (0, "interbase transfer", "logistics");

--
-- Name: administration_permission_entries; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_permission_entries (id, name, scope) VALUES (1, "communicator", "administrative");

--
-- Name: administration_permissions; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_permissions (id, approved_by, subordinate, entry) VALUES (0, 1, 0, 0);

--
-- Name: administration_permissions; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_permissions (id, approved_by, subordinate, entry) VALUES (1, 1, 0, 1);

--
-- Name: administration_deployment_records; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_deployment_records (id, approved_by, subordinate, facility_longitude, facility_latitude, till, since) VALUES (0, 1, 0, 49.83596810799438, 24.005566492683307, NOW(), NOW());

--
-- Name: administration_trainings_topic; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_trainings_topic (id, name, type) VALUES (0, "TCCC CLS", "combat");

--
-- Name: administration_trainings; Type: INSERT INTO; Schema: public
--

INSERT INTO administration_trainings (id, approved_by, initiated_by, subordinate, topic, till, since) VALUES (0, 1, 1, 0, 0, NOW(), NOW());

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


--
-- Name: communication_equipment_inventory_journal_topic; Type: INSERT INTO; Schema: public
--

INSERT INTO communication_equipment_inventory_journal_topic (id, name) VALUES (0, "item reserved");


--
-- Name: communication_equipment_inventory_journal; Type: INSERT INTO; Schema: public
--

INSERT INTO communication_equipment_inventory_journal (id, initiated_by, subordinate, topic, created_at) VALUES (0, 0, 0, 0, NOW());


--
-- Name: communication_administration_journal_topic; Type: INSERT INTO; Schema: public
--

INSERT INTO communication_administration_journal_topic (id, name) VALUES (0, "training appointed");

--
-- Name: communication_administration_journal; Type: INSERT INTO; Schema: public
--

INSERT INTO communication_administration_journal (id, initiated_by, subordinate, topic, created_at) VALUES (0, 0, 0, 0, NOW());


--
-- Name: communication_logistics_journal_topic; Type: INSERT INTO; Schema: public
--

INSERT INTO communication_logistics_journal_topic (id, name) VALUES (0, "delivered goods");

--
-- Name: communication_logistics_journal; Type: INSERT INTO; Schema: public
--

INSERT INTO communication_logistics_journal (id, initiated_by, subordinate, assignment, topic, created_at) VALUES (0, 0, 0, 0, 0, NOW());

