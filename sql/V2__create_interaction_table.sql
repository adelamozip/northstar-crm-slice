create table interaction (
    interaction_id uuid primary key,
    customer_id uuid not null references customer(customer_id),
    channel varchar(20) not null,
    summary text not null,
    actor varchar(100) not null,
    occurred_at timestamptz not null,
    correlation_id varchar(64) not null
);