# Example of go-pdagent installation process from Github release on Ubuntu
FROM ubuntu:latest

# Install necessary packages
RUN apt update
RUN apt --assume-yes install wget
RUN apt --assume-yes install gpg

# Download the agent, the agent's signature, and PagerDuty's public key
WORKDIR /go-pdagent
RUN wget https://github.com/PagerDuty/go-pdagent/releases/download/v0.5.1/go-pdagent_0.5.1_Linux_x86_64.deb
RUN wget https://github.com/PagerDuty/go-pdagent/releases/download/v0.5.1/go-pdagent_0.5.1_Linux_x86_64.deb.sig
RUN wget https://packages.pagerduty.com/GPG-KEY-pagerduty

# Verify the agent's signature
RUN gpg --import GPG-KEY-pagerduty
RUN gpg --verify go-pdagent_0.5.1_Linux_x86_64.deb.sig go-pdagent_0.5.1_Linux_x86_64.deb

# Install the agent
ENTRYPOINT ["dpkg", "-i", "go-pdagent_0.5.1_Linux_x86_64.deb"]
