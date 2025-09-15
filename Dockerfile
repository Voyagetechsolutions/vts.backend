# Stage 1: Build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copy solution and project files
COPY *.sln ./
COPY */*.csproj ./

# Restore dependencies
RUN dotnet restore

# Copy the rest of the code and publish
COPY . ./
RUN dotnet publish -c Release -o out

# Stage 2: Run the app
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# Copy published app from build stage
COPY --from=build /app/out .

# Set environment variables
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=1
ENV DOTNET_LOG_LEVEL=Information
ENV ASPNETCORE_URLS=http://+:$PORT

# Expose port for Render
EXPOSE $PORT

# Entry point to run the app
ENTRYPOINT ["dotnet", "VTS.Backend.dll"]
