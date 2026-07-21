# NurseryLink Database Schema

## Notes

- This document is the source of truth for database structure.
- PK = Primary Key.
- FK = Foreign Key.
- UQ = Unique constraint.
- Nullable fields are marked where applicable.

---

# Account

Base table for all system users.

| Column | Type | Constraint |
|---|---|---|
| AccountId | int | PK |
| Name | nvarchar | |
| UserName | nvarchar | UQ |
| Email | nvarchar | UQ |
| Password | nvarchar | |
| Role | int/enum | |
| IsActive | bit | |
| CreatedAt | datetime | |
| DeletedAt | datetime | Nullable |
| UpdatedAt | datetime | |

Relationships:

- One Account can have one Admin, Teacher, or Parent profile.

---

# Admin

Admin-specific data.

| Column | Type | Constraint |
|---|---|---|
| AdminId | int | PK |
| AccountId | int | FK, UQ |
| CreatedByAdminId | int | FK |

Relationships:

- Admin.AccountId → Account.AccountId
- Admin.CreatedByAdminId → Admin.AdminId

---

# Teacher

Teacher-specific data.

| Column | Type | Constraint |
|---|---|---|
| TeacherId | int | PK |
| AccountId | int | FK, UQ |

Relationships:

- Teacher.AccountId → Account.AccountId

---

# Parent

Parent-specific data.

| Column | Type | Constraint |
|---|---|---|
| ParentId | int | PK |
| AccountId | int | FK, UQ |

Relationships:

- Parent.AccountId → Account.AccountId

---

# Privilege

Available permissions.

| Column | Type | Constraint |
|---|---|---|
| PrivilegeId | int | PK |
| Name | nvarchar | |

---

# AccountPrivilege

Many-to-many relationship between accounts and privileges.

| Column | Type | Constraint |
|---|---|---|
| PrivilegeId | int | PK, FK |
| AccountId | int | PK, FK |

Relationships:

- AccountPrivilege.AccountId → Account.AccountId
- AccountPrivilege.PrivilegeId → Privilege.PrivilegeId

---

# Class

Nursery classes.

| Column | Type | Constraint |
|---|---|---|
| ClassId | int | PK |
| ClassName | nvarchar | |
| TeacherId | int | FK |

Relationships:

- Class.TeacherId → Teacher.TeacherId
- One Teacher can have many Classes.

---

# Student

Children registered in the nursery.

| Column | Type | Constraint |
|---|---|---|
| StudentId | int | PK |
| FullName | nvarchar | |
| DateOfBirth | datetime | |
| StudentCode | nvarchar | UQ |
| IsActive | bit | |
| JoinedAt | datetime | |
| LeftAt | datetime | Nullable |
| UpdatedAt | datetime | |
| ClassId | int | FK |

Relationships:

- Student.ClassId → Class.ClassId

---

# StudentParent

Links students and parents.

| Column | Type | Constraint |
|---|---|---|
| StudentId | int | PK, FK |
| ParentId | int | PK, FK |

Relationships:

- StudentParent.StudentId → Student.StudentId
- StudentParent.ParentId → Parent.ParentId

---

# ActivityLog

Base record for student activities.

| Column | Type | Constraint |
|---|---|---|
| ActivityLogId | int | PK |
| Type | enum | |
| CreatedAt | datetime | |
| CreatedByAccountId | int | FK |

Relationships:

- ActivityLog.CreatedByAccountId → Account.AccountId

---

# MealLog

Student meal records.

| Column | Type | Constraint |
|---|---|---|
| MealLogId | int | PK |
| MealType | enum | |
| EatingStatus | enum | |
| ActivityLogId | int | FK, UQ |
| StudentId | int | FK |

Relationships:

- MealLog.ActivityLogId → ActivityLog.ActivityLogId
- MealLog.StudentId → Student.StudentId

---

# TemperatureCheck

Student temperature records.

| Column | Type | Constraint |
|---|---|---|
| TemperatureCheckId | int | PK |
| Value | decimal | |
| Note | nvarchar | |
| ActivityLogId | int | FK, UQ |
| StudentId | int | FK |

Relationships:

- TemperatureCheck.ActivityLogId → ActivityLog.ActivityLogId
- TemperatureCheck.StudentId → Student.StudentId

---

# ToiletLog

Student toilet records.

| Column | Type | Constraint |
|---|---|---|
| ToiletLogId | int | PK |
| VisitType | enum | |
| Note | nvarchar | |
| ActivityLogId | int | FK, UQ |
| StudentId | int | FK |

Relationships:

- ToiletLog.ActivityLogId → ActivityLog.ActivityLogId
- ToiletLog.StudentId → Student.StudentId

---

# Notification

System notifications.

| Column | Type | Constraint |
|---|---|---|
| NotificationId | int | PK |
| Title | nvarchar | |
| Message | nvarchar | |
| Type | enum | |
| CreatedAt | datetime | |
| CreatedByAccountId | int | FK, Nullable |

Relationships:

- Notification.CreatedByAccountId → Account.AccountId

---

# NotificationReceiver

Notification delivery tracking.

| Column | Type | Constraint |
|---|---|---|
| NotificationReceiverId | int | PK |
| IsRead | bit | |
| IsHandled | bit | |
| IsSent | bit | |
| NotificationId | int | FK |
| ReceiverAccountId | int | FK |

Relationships:

- NotificationReceiver.NotificationId → Notification.NotificationId
- NotificationReceiver.ReceiverAccountId → Account.AccountId