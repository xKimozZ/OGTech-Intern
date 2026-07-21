# NurseryLink API Contract

## Purpose

This document defines the planned REST API for the NurseryLink application.

The API is designed from the database schema and user requirements.

Implementation details may change, but the resources, permissions, and responsibilities should remain stable.

---

# Authentication

## POST /api/auth/login

### Purpose
Authenticate a user and return access information.

### Access
Public

### Request

```json
{
  "username": "string",
  "password": "string"
}
```

### Response

```json
{
  "token": "jwt-token",
  "accountId": 1,
  "role": "Admin|Teacher|Parent"
}
```

Admin responses should also include available privileges.

---

## GET /api/me

### Purpose
Return information about the currently authenticated user.

### Access
Authenticated users

### Response includes:

- Account information
- Role information
- Role-specific relationships

Examples:

Teacher:
- Assigned classes

Parent:
- Linked students

Admin:
- Assigned privileges

---

# Authorization Rules

Authorization must be enforced by the backend.

Frontend hiding is not considered security.

---

## Admin

Admins are controlled by privileges.

Privileges:

- ManageAdmins
- ManageTeachers
- ManageStudents
- ManageParents
- ViewReports

---

## Teacher

Teachers can:

- Access their assigned classes.
- Access students in their classes.
- Create activity records for their students.

Teachers cannot access other classes.

---

## Parent

Parents can:

- Access their linked students.
- View their children's activity history.
- Receive notifications.

Parents cannot access unrelated students.

---

# Admin Management

## POST /api/admins

Create an administrator.

Permission:

- Admin
- ManageAdmins

Creates:

- Account
- Admin profile
- Privileges

Rules:

- New privileges cannot exceed creator privileges.

---

## GET /api/admins

List administrators.

Permission:

- Admin
- ManageAdmins

---

## GET /api/admins/{id}

Get administrator details.

Permission:

- Admin
- ManageAdmins

---

## PATCH /api/admins/{id}/privileges

Update administrator privileges.

Permission:

- Admin
- ManageAdmins

---

## PATCH /api/admins/{id}/status

Activate/deactivate administrator.

Permission:

- Admin
- ManageAdmins

---

# Teacher Management

## POST /api/teachers

Create teacher.

Permission:

- Admin
- ManageTeachers

Creates:

- Account
- Teacher profile

---

## GET /api/teachers

List teachers.

Permission:

- Admin
- ManageTeachers

---

## GET /api/teachers/{id}

Get teacher details.

Permission:

- Admin
- ManageTeachers

---

## PATCH /api/teachers/{id}/status

Update teacher status.

Permission:

- Admin
- ManageTeachers

---

# Parent Management

## POST /api/parents

Create parent.

Permission:

- Admin
- ManageParents

Creates:

- Account
- Parent profile

---

## GET /api/parents

List parents.

Permission:

- Admin
- ManageParents

---

## GET /api/parents/{id}

Get parent details.

Permission:

- Admin
- ManageParents

---

## PATCH /api/parents/{id}/status

Update parent status.

Permission:

- Admin
- ManageParents

---

# Class Management

## POST /api/classes

Create class.

Permission:

- Admin
- ManageStudents

---

## GET /api/classes

List classes.

Permission:

- Admin
- ManageStudents
- Teacher (assigned classes)

---

## GET /api/classes/{id}

Get class details.

Permission:

- Admin
- Teacher (own class)

---

## PUT /api/classes/{id}

Update class information.

Permission:

- Admin
- ManageStudents

---

## PATCH /api/classes/{id}/teacher

Assign or change class teacher.

Permission:

- Admin
- ManageStudents

---

# Student Management

## POST /api/students

Create student.

Permission:

- Admin
- ManageStudents

---

## GET /api/students

List students.

Permission:

- Admin
- Teacher (own class)
- Parent (linked students)

Filtering:

- classId

---

## GET /api/students/{id}

Get student details.

Permission:

- Admin
- Teacher (own class)
- Parent (linked student)

---

## PUT /api/students/{id}

Update student information.

Permission:

- Admin
- ManageStudents

---

## PATCH /api/students/{id}/class

Move student to another class.

Permission:

- Admin
- ManageStudents

Rule:

- Historical activity records remain unchanged.

---

# Student Parent Relationships

## GET /api/students/{studentId}/parents

Get parents linked to a student.

Permission:

- Admin
- ManageParents
- Teacher (own class)

---

## POST /api/students/{studentId}/parents/{parentId}

Link parent to student.

Permission:

- Admin
- ManageParents

---

## DELETE /api/students/{studentId}/parents/{parentId}

Remove parent link.

Permission:

- Admin
- ManageParents

---

# Activity Logs

Activities are linked to students.

Supported activities:

- Meals
- Temperature checks
- Toilet visits

---

# Meal Logs

## POST /api/students/{studentId}/meals

Create meal record.

Permission:

- Teacher (own class)

Rules:

- Duplicate meal type for the same student/day is rejected.

---

## GET /api/students/{studentId}/meals

Get meal history.

Permission:

- Teacher (own class)
- Parent (linked student)

---

# Temperature Checks

## POST /api/students/{studentId}/temperature-checks

Create temperature record.

Permission:

- Teacher (own class)

Rules:

- Temperature value validation required.
- Fever creates a notification for linked parents.

---

## GET /api/students/{studentId}/temperature-checks

Get temperature history.

Permission:

- Teacher
- Parent (linked student)

---

# Toilet Logs

## POST /api/students/{studentId}/toilet-visits

Create toilet visit.

Permission:

- Teacher (own class)

---

## GET /api/students/{studentId}/toilet-visits

Get toilet history.

Permission:

- Teacher
- Parent (linked student)

---

# Notifications

## GET /api/notifications

Get notifications for current user.

Permission:

- Parent

---

## PATCH /api/notifications/{id}/read

Mark notification as read.

Permission:

- Parent

---

# Dashboard

## GET /api/dashboard/summary

Get dashboard summary information.

Permission:

- Admin with ViewReports privilege

---

# Future Features

Not part of the current implementation.

Possible future additions:

- Attendance tracking
- Incident reports
- Meal pattern alerts
- Daily summaries
- Class announcements
- Supply requests
- Substitute teachers