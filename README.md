# Bus Management System - Backend API

A .NET 8 Web API backend for the Bus Management System, providing RESTful APIs, SignalR real-time communication, and integration with Supabase.

## Technologies

- **.NET 8** - Web API framework
- **Entity Framework Core 8** - ORM with PostgreSQL
- **SignalR** - Real-time communication hub
- **JWT Authentication** - Bearer token authentication
- **Swagger/OpenAPI** - API documentation
- **Stripe & PayGate** - Payment processing
- **Application Insights** - Monitoring and logging

## Features

- Multi-tenant bus company management
- Real-time bus tracking via SignalR
- User authentication and authorization
- Booking management
- Payment processing
- Audit logging
- Document management
- Incident reporting

## Setup

1. **Prerequisites**
   - .NET 8 SDK
   - PostgreSQL database
   - Supabase project

2. **Configuration**
   - Copy `appsettings.Development.json` and update with your values:
     - Database connection string
     - Supabase URL and service role key
     - JWT secret key
     - Payment provider keys (Stripe/PayGate)

3. **Database Setup**
   ```bash
   dotnet ef database update
   ```

4. **Run the application**
   ```bash
   dotnet run
   ```

## API Documentation

Once running, visit `/swagger` for interactive API documentation.

## Environment Variables

The application uses `appsettings.json` for configuration. For production, use environment variables or Azure Key Vault.

## Project Structure

- `Controllers/` - API controllers
- `Models/` - Data models
- `Data/` - Entity Framework context and configurations
- `Services/` - Business logic services
- `SignalR/` - Real-time communication hubs
- `Auth/` - Authentication and authorization
- `Payments/` - Payment processing services
- `Logging/` - Application logging and monitoring
