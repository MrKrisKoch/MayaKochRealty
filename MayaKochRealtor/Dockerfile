FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS app

ADD . .
WORKDIR /

RUN dotnet restore --configfile "./Nuget.config" ./MayaKochRealtor.sln
RUN dotnet build ./MayaKochRealtor.sln
RUN dotnet publish ./MayaKochRealtor.WebHost/MayaKochRealtor.WebHost.csproj -o /app -c Release --runtime debian.8-x64

#############################################################
#                      Runtime                              #
#############################################################
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

RUN apt-get update
RUN apt-get install -y nginx

WORKDIR /app

ENV ASPNETCORE_URLS http://+:5000

COPY --from=app /app /app
COPY startup.sh /app/startup.sh
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /app/startup.sh


ENTRYPOINT ["sh", "/app/startup.sh", "MayaKochRealtor.WebHost.dll"]