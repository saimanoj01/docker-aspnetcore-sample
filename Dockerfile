FROM microsoft/aspnetcore-build:1.0-1.1 AS builder
WORKDIR /source

COPY app/* ./
RUN dotnet restore
RUN dotnet publish -o /bin/ -c Release


FROM microsoft/aspnetcore:1.1
WORKDIR /app
EXPOSE 80
COPY --from=builder /bin .
ENTRYPOINT ["dotnet", "AspNetCoreSampleApp.dll"]