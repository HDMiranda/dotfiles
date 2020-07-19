#!/bin/bash
sudo openvpn --config /etc/openvpn/client/vpn-exame.ovpn --cert /etc/openvpn/client/openvpn-client.crt --key /etc/openvpn/client/openvpn-client.key --ca /etc/openvpn/client/ca.crt --auth-user-pass /etc/openvpn/client/pass.txt
