#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["MayaKochRealtor.WebHost/MayaKochRealtor.WebHost.csproj", "MayaKochRealtor.WebHost/"]
RUN dotnet restore "MayaKochRealtor.WebHost/MayaKochRealtor.WebHost.csproj"
COPY . .
WORKDIR "/src/MayaKochRealtor.WebHost"
RUN dotnet build "MayaKochRealtor.WebHost.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MayaKochRealtor.WebHost.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MayaKochRealtor.WebHost.dll"]