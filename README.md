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
- fix alerts and error messages display. Add alert boxes.
- create dashboard view/ calendar
- fix booked_time interface (datetimepicker)
...
- implement cache + indexes
