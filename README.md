# README

## App

### User (represents the doctor, lawyer, etc)
- name
- email
- password
- office_address
- phone_number
- (add other options)

- has_many patients

---

### Patient
- name
- email
- phone_number
- address
- notes
- user_id

- belongs_to user
- has_many appointments

---

### Appointment
- title
- description
- booked_time
- address
- notes
- patient_id

- belongs_to patient
