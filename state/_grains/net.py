#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
This file provides network related grains data.
'''

# Author:     Zhang Cheng <cheng.zhang@cloudacc-inc.com>
# Maintainer: Zhang Cheng <cheng.zhang@cloudacc-inc.com>

import salt
import re

PRIVATE_IP_PATTERN = re.compile(r'^(172\.(1[6-9]|2[0-9]|3[0-1])\.|192\.168\.|10\.)')

def _ip2net(server_ip, server_mask):
    n = 0   
    net = []
    ips   = server_ip.split('.')
    masks = server_mask.split('.')
    for i in range(4):
        net.append(int(ips[i]) & int(masks[i]))
        bin_mask = bin(int(masks[i]))    
        n += bin_mask.count("1")
    return str(net[0])+"."+str(net[1])+"."+str(net[2])+"."+str(net[3])+"/"+str(n)

def get_ipaddr_info():
    '''
    Provide a dict of ip addr info.
        wan_addrs: [ip1, ip2, ...]
        lan_addrs: [ip1, ip2, ...]
        wan_mask: [mask1, mask2, ...]
        lan_mask: [mask1, mask2, ...]
        wan_network: [net1, net2, ...]
        lan_network: [net1, net2, ...]
        wan_ifaces: [eth0, eth2, ...]
        lan_ifaces: [eth1, eth3, ...]
        up_ifaces: [eth0, eth1, ...]
        down_ifaces: [eth4, ...]
    '''
    grains = {}
    wan_addrs = []
    lan_addrs = []
    wan_masks = []
    lan_masks = []
    wan_net = []
    lan_net = []
    wan_ifaces = []
    lan_ifaces = []
    up_ifaces = []
    down_ifaces = []

    for iface, ifaceinfo in salt.utils.network.interfaces().items():
        if ifaceinfo.get("up", False):
            up_ifaces.append(iface)

            if iface == "lo":
                continue

            inet = ifaceinfo.get("inet", None)
            if not inet or len(inet) == 0:
                continue

            addr = inet[0].get("address", None)
            mask = inet[0].get("netmask",None)
            if not inet:
                continue
            
            if PRIVATE_IP_PATTERN.search(addr):
                if iface != 'tun0':
                    lan_addrs.append(addr)
                    lan_ifaces.append(iface)
                    lan_masks.append(mask)
                    lan_net.append(_ip2net(addr, mask))
            else:
                wan_addrs.append(addr)
                wan_ifaces.append(iface)
                wan_masks.append(mask)
                wan_net.append(_ip2net(addr, mask))
        else:
            down_ifaces.append(iface)

    grains = {
            "wan_addrs": wan_addrs,
            "lan_addrs": lan_addrs,
            "wan_masks": wan_masks, 
            "lan_masks": lan_masks, 
            "wan_nets": wan_net,
            "lan_nets": lan_net,
            "wan_ifaces": wan_ifaces,
            "lan_ifaces": lan_ifaces,
            "up_ifaces": up_ifaces,
            "down_ifaces": down_ifaces
            }
    print grains
    return grains

if __name__ =="__main__":
    get_ipaddr_info()
# vim:ai:et:sts=4:sw=4:
