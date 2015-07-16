FROM ubuntu:14.04

MAINTAINER Matheus Candido <matheus@mcassiano.com>

RUN apt-get update
RUN apt-get install -y wget iptables
RUN wget https://raw.github.com/philplckthun/setup-simple-ipsec-l2tp-vpn/master/setup.sh
RUN mkdir /root/ipsec

ENV VPN_USERNAME vpn
ENV VPN_PASSWORD 1234
ENV VPN_CONNECTION_TYPE 4
ENV VPN_VPN_ON_EC2 n

EXPOSE 500/udp 4500/udp 1701/udp

WORKDIR /root/ipsec
CMD ["./run_vpn.sh"]

COPY run_vpn.sh ./
COPY setup.sh ./

RUN chmod a+x run_vpn.sh
RUN chmod a+x setup.sh