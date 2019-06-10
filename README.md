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
- fix patient/appointment relationship --> https://medium.com/@pk60905/many-to-many-relationship-in-rails-cf86e12db8b0
- add cocoon form on appointments, to add patients to appointments
- create dashboard view/ calendar
...
- implement cache + indexes
