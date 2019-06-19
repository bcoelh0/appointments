# README

## App

### User (represents the doctor, lawyer, etc)
- name
- email
- password
- office_address
- phone_number
- (add other options)

- *has_many appointments*
- *has_many patients*

---

### Appointment
- title
- description
- booked_time
- address
- notes
- user_id

- *belongs_to user*
- *has_many patients*

---

### Patient
- name
- email
- phone_number
- address
- notes
- appointment_id
- user_id

  *belongs_to user*
- *belongs_to appointment*


## gems to add
- cocoon


## To do
- setup mailers
  - when appointment is created:
    1. send email immediately to patients
    2. send email 24 hours before booked_time

- make dashboard look better
- create "landing page" for unlogged users

...
- implement cache + indexes
