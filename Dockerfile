# Stage 1: Build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copy solution and project files
COPY vts.backend/*.sln ./
COPY vts.backend/*.csproj ./  

# Restore dependencies
RUN dotnet restore "*.sln"

# Copy the rest of the code and publish
COPY vts.backend/. ./
RUN dotnet publish "*.sln" -c Release -o out

# Stage 2: Run the app
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# Copy published app from build stage
COPY --from=build /app/out .

# Environment variables for Render
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=1
ENV DOTNET_LOG_LEVEL=Information
ENV ASPNETCORE_URLS=http://+:$PORT

# Expose port
EXPOSE $PORT

# Entry point (replace with your DLL name if different)
ENTRYPOINT ["dotnet", "VTS.Backend.dll"]
