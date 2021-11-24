# Example of installation process from binary
FROM ubuntu:latest
WORKDIR /code
RUN apt update
RUN apt --assume-yes install wget
RUN apt --assume-yes install gpg
RUN wget https://github.com/PagerDuty/go-pdagent/releases/download/v0.5.1/go-pdagent_0.5.1_Linux_x86_64.deb
RUN wget https://github.com/PagerDuty/go-pdagent/releases/download/v0.5.1/go-pdagent_0.5.1_Linux_x86_64.deb.sig
RUN wget https://packages.pagerduty.com/GPG-KEY-pagerduty
RUN gpg --import GPG-KEY-pagerduty
RUN gpg --verify go-pdagent_0.5.1_Linux_x86_64.deb.sig go-pdagent_0.5.1_Linux_x86_64.deb
ENTRYPOINT ["dpkg", "-i", "go-pdagent_0.5.1_Linux_x86_64.deb"]
