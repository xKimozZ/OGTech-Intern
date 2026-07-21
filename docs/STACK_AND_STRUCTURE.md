# Stack and Structure

## Backend
- ASP.NET Core Web API
- Entity Framework Core
- SQL Server
- JWT Authentication

## Frontend
- React

## Backend structure

API
- Controllers
- Authentication configuration

Application
- Services
- DTOs
- Business rules

Domain
- Entities
- Enums

Infrastructure
- Database context
- Repository implementations

Rules:
- Controllers handle HTTP only.
- Services contain business logic.
- Repositories handle database access.
- Do not return database entities directly from APIs.