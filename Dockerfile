FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
COPY . ./app
WORKDIR /app
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
EXPOSE 80
EXPOSE 443
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "SimpleWebApp.dll"]
