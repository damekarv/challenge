FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base

WORKDIR /app
COPY app/ .

# Build project
RUN mkdir build
RUN dotnet build -c Release -o /app/build --no-restore

# Publish project
RUN mkdir publish
RUN dotnet publish -c Release -o /app/publish --no-restore

EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000

ENTRYPOINT [ "dotnet publish/MyWebApp.dll" ]