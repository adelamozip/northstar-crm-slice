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
correlation id   lab-request-001
```

## Roles 
```
1. Guest/ anonymous
2. Agent (service agent, record and read interactions)
3. Admin (read all, correct status)
```

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
- As an admin, I should be able to read every customer's timeline
- As an admin, I should be able to move RAVI from PROSPECT to ACTIVE
- As an admin, I should not able to delete the audit event after publish
```

### CAP-12 (Lab 49 Seed)
```
CAP-12 Record customer interaction for CUS-1001

given an ACTIVE customer when an agent records an interaction, then the row persists in POSTgreSQL
and CustomerInteractionRecordedV1 is published
with coorelationId lab-request-001 and Amina's customer id
```

## Event 

Topic: `crm.customer.interactions.v1`
Partition key: customerid
One event per successful create. Consumers dedupe on `eventId`.

```
CustomerInteractionRecordedV1
  eventId, eventType, eventVersion
  occurredAt, correlationId, actor,
  customerId, interactionId, channel
```

## Contract

```
POST /api/customers/{id}/interactions  201 + Location
GET  /api/customers/{id}               200
GET  /api/customers/{id}/interactions?page=0&size=20
GET  /api/customers/CUS-9999           404 DNE


Every call sends `Authorization: Bearer <jwt>` and 'X-Correlation-Id: lab-request-001`.
DTOs at the boundary. A JPA entity near reaches the client
Angular validates, then calls a typed service. Business rules stay in SB.
```

## Backend tasks
```
- Spring boot app 'northstar-crm-slice'
- Parent `spring-boot-starter-parent`
- Dependencies: web validation, seucrity, oauth2-resource-server, data-jpa, flyway, postgresql, kafka, actuator
-
-
-
-
-

```
## SQL: 
```
- sql/V1__create_customer_table.sql
- sql/V2__create_interaction_table.sql
- sql/V3__index_interaction_customer_occurred_at.sql
- Seed Amina and Ravi. We're not seeding CUS-9999

```

## Front end (Later module)
```
- Angular standalone features: customers/, interactions, shared/
- InteractionService.record(id, dto) via HttpClient
- Interceptor attaches JWT and X-Correlation-ID
- Signals for state, reactive forms before submit
```

## Demo
```
- Demo.http covers login, CUS 1001 create, timeline, CUS-9999 404
```


