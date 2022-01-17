FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget apt-transport-https

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update && apt-get install -y dotnet-sdk-5.0

USER jenkins
