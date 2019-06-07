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
- setup authentication and registration
- organise routes according to data schema
- have all basic CRUD pages working
- install bootstrap
- make UI look half acceptable
- create dashboard view
...
- implement cache
