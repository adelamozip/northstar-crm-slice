--- UUIDs stand in for CUS-1001 and CUS-1002. CUS-9999 is a placeholder for a customer that does not exist in the database.

create table customer (
    customer_id uuid primary key,
    name varchar(200) not null,
    status varchar(20) not null,
);

insert into customer(customer_id, name, status) values
('550e8400-e29b-41d4-a716-446655440000', 'Amina Khan', 'ACTIVE'),
('550e8400-e29b-41d4-a716-446655440001', 'Ravi Singh', 'PROSPECT');