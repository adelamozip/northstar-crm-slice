# northstar-crm-slice
A verticle slice for the NorthStar CRM Slice App
This is for Module 48 - 49 Lab 48- 49.:

Freeze the model, roles, and stories before code. 

## Stack:
Angular, Spring Boot REST, PostgreSQL, Kafka, Openshift, Not React, or k3s Oracle, BitBucket

## Customer data model

```
1. customerId  UUID
2. name        String
3. Status      String (PROSPECT, ACTIVE)
```

## Interaction data model

```
1. interactionId   UUID
2. customerId      UUID (FK)
3. channel         String   (PHONE, EMAIL, CHAT, BRANCH)
4. summary         String
5. actor           String (agent username - RAVI, AMINA)
6. occurredAt      Instant
7. CorrelationId   String
```

## Fixtures

```
CUS-1001 Amina Khan  ACTIVE primary timeline demo
CUS-1002 Ravi Singh  PROSPECT   not yet an employee, or still onboarding
CUS-9999 (none) - not found/negative tests
correlation id 
```

## Roles 
```
1. Guest/ anonymous
2. Agent (service agent, record and read interactions)
3. Admin (read all, correct status)

## User stories

```
As a ________, I should [not] be able to ______.
Preconditions: what must be true for the story to matter
Postconditions: what must be true when th story ends

- As a guest, I should be able to list customers
- As a guest, I should not able to record an interaction
- As a guest, I should not able to read a customer timeline
- As an agent, I should be able to read Amina Khan (CUS-1001, Active)
- As an agent, I should be able to read Ravi Singh (CUS-1002, Prospect)
- As an agent, I should be able to record an interaction for an active customer
- As an agent, I should be able to list a customer's interaction
- As an agent, I should see only my own write attributed
- As an agent, I should able to move Ravi from Prospect to ACTIVE
- As an admin,
- As an admin,
- As an admin,


