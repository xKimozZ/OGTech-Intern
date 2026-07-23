# Nursery Management System
## Frontend Pages & Story Point Estimation

> This document lists the planned frontend pages based on the finalized database schema and project requirements.
>
> Story Points (SP) use the Fibonacci scale:
>
> - **1** – Very Small
> - **2-3** – Small
> - **5** – Medium
> - **8** – Large
> - **13** – Very Large

---

# Core Features

## 1. Authentication (3 SP)

### Login
- Email / Username
- Password
- Authentication
- Redirect based on role

**Story Points:** **3**

---

# 2. Admin Module

## Dashboard (8 SP)

Displays a quick overview of the system.

### Widgets

- Total Students
- Total Parents
- Total Teachers
- Total Classes
- Active Students
- Recent Activity Logs
- Recent Temperature Alerts

**Story Points:** **8**

---

## User Management (18 SP)

Since all users share the `Account` table, a single management module is sufficient.

### User List (5 SP)

Displays:

- Name
- Username
- Email
- Role
- Active Status

Features:

- Search
- Filter
- Activate/Deactivate

---

### Create User (5 SP)

Supports creating:

- Admin
- Teacher
- Parent

---

### Edit User (5 SP)

Update:

- Basic Information
- Password
- Active Status
- Role-specific information

---

### User Details (3 SP)

Displays complete user information.

---

## Privilege Management (8 SP)

Manage Admin permissions.

Features:

- Assign Privileges
- Remove Privileges
- View Assigned Privileges

---

## Class Management (13 SP)

### Class List (3 SP)

Displays:

- Class Name
- Assigned Teacher
- Student Count

---

### Create / Edit Class (5 SP)

- Create Class
- Rename Class
- Assign Teacher

---

### Class Details (5 SP)

Displays:

- Teacher
- Students
- Student Count

---

## Student Management (23 SP)

### Student List (5 SP)

Features:

- Search
- Filter
- Active/Inactive

---

### Add Student (5 SP)

Create a new student.

---

### Edit Student (5 SP)

Update student information.

---

### Student Details (8 SP)

Displays:

#### Information

- Name
- DOB
- Student Code
- Class

#### Parents

- Linked Parents

#### Activity

- Meal Logs
- Temperature Checks
- Toilet Logs

---

## Parent Linking (5 SP)

Manage Student ↔ Parent relationships.

Features:

- Link Parent
- Remove Parent

---

## Notifications (8 SP)

Admin can create notifications.

Features:

- Notification List
- Send Notification
- View Delivery Status

---

# 3. Teacher Module

## Dashboard (8 SP)

Displays:

- Assigned Class
- Student Count
- Recent Activities
- Quick Actions

---

## My Class (5 SP)

Displays:

- Student List
- Student Status

---

## Student Details (5 SP)

Teacher view of student profile.

Allows recording activities.

---

## Meal Logging (8 SP)

Teacher records meals.

Supported meal types:

- Breakfast
- Lunch
- Snack

Information:

- Meal Type
- Eating Status

---

## Temperature Checks (8 SP)

Teacher records:

- Temperature
- Notes

High temperatures generate notifications.

---

## Toilet Logs (5 SP)

Teacher records:

- Visit Type
- Notes

---

# 4. Parent Module

## Parent Dashboard (8 SP)

Displays:

- Linked Children
- Latest Meals
- Latest Temperature
- Latest Toilet Visits
- Recent Notifications

---

## Child Details (8 SP)

Displays complete child history.

Sections:

- Information
- Meals
- Temperature
- Toilet Visits

---

## Notifications (5 SP)

Displays notifications sent to the parent.

Features:

- Read
- Mark as Read

---

# Story Point Summary

| Module | Story Points |
|---------|-------------:|
| Authentication | 3 |
| Admin Dashboard | 8 |
| User Management | 18 |
| Privilege Management | 8 |
| Class Management | 13 |
| Student Management | 23 |
| Parent Linking | 5 |
| Notifications | 8 |
| Teacher Module | 31 |
| Parent Module | 21 |
| **Total Core** | **138 SP** |

---

# Database Modules Covered

The current database schema supports:

- ✅ Accounts
- ✅ Admins
- ✅ Teachers
- ✅ Parents
- ✅ Students
- ✅ Classes
- ✅ Student ↔ Parent Relationships
- ✅ Activity Logs
- ✅ Meal Logs
- ✅ Temperature Checks
- ✅ Toilet Logs
- ✅ Notifications
- ✅ Role Privileges

---

# Future Enhancements (Bonus Features)

These features were mentioned in the project requirements but are **not included in the finalized database schema**.

They can be implemented in future iterations by extending the database.

## Attendance

Possible pages:

- Attendance Dashboard
- Take Attendance
- Attendance History

**Estimated:** **8 SP**

---

## Incident Reports

Possible pages:

- Incident List
- Create Incident
- Incident Details

**Estimated:** **18 SP**

---

## Class Announcements

Possible pages:

- Announcement List
- Create Announcement

**Estimated:** **10 SP**

---

## Supply Requests

Possible pages:

- Request List
- Create Request

**Estimated:** **13 SP**

---

## Substitute Teacher Management

Possible pages:

- Assign Substitute Teacher

**Estimated:** **8 SP**

---

# Bonus Story Points

| Module | Story Points |
|---------|-------------:|
| Attendance | 8 |
| Incident Reports | 18 |
| Announcements | 10 |
| Supply Requests | 13 |
| Substitute Teachers | 8 |
| **Total Bonus** | **57 SP** |

---

# Overall Estimate

| Scope | Story Points |
|--------|-------------:|
| Core Features | **138 SP** |
| Bonus Features | **57 SP** |
| **Grand Total** | **195 SP** |

---

## Notes

- The **Core Features** section reflects the finalized database schema and should be considered the MVP for the project.
- **Bonus Features** are optional and require additional database tables before implementation.
- Story point estimates are intended for sprint planning and may be refined as implementation details become clearer.