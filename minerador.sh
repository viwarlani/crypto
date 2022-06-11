#!/bin/bash

# minerador.sh
# Verifica o processo do ethminer.

# ----------------------------------------------------------------------------- #
# "THE BEER-WARE LICENSE" (Revision 42):                                        #
# <perlporter@GMAIL.COM> wrote this file. As long as you retain this notice you #
# can do whatever you want with this stuff. If we meet some day, and you think  #
# this stuff is worth it, you can buy me a beer in return Wendell Borges        #
# ----------------------------------------------------------------------------- #

#                                   Authority
#            +---------------------------------------------------------------------+
#  stratum://0x925966644EdEc86d0CC1C1cc6165A25A78b91Ba4.Worker:password@eu1.ethermine.org:4444
#  +------+  +----------------------------------------------+ +---------------+ +--+
#      |                         |                                  |             |
#      |                         |                                  |             + > Port
#      |                         |                                  + ------------- > Host
#      |                         + ------------------------------------------------ > User Info
#      + -------------------------------------------------------------------------- > Scheme
      
#    When using stratum mode ethminer tries to auto-detect the correct
#    flavour provided by the pool. Should be fine in 99% of the cases.
#    Nevertheless you might want to fine tune the stratum flavour by
#    any of of the following valid schemes :
#
#    stratum+ssl stratum+tcp stratum+tls stratum+tls12 stratum1+ssl stratum1+tcp stratum1+tls stratum1+tls12 stratum2+ssl stratum2+tcp 
#    stratum2tls stratum2+tls12 stratum3+ssl stratum3+tcp stratum3+tls stratum3+tls12
#
#    where a scheme is made up of two parts, the stratum variant + the tcp transport protocol

# Stratum variants :
#
#        stratum     Stratum
#        stratum1    Eth Proxy compatible
#        stratum2    EthereumStratum 1.0.0 (nicehash)
#        stratum3    EthereumStratum 2.0.0
#
#    Transport variants :
#
#        tcp         Unencrypted tcp connection
#        tls         Encrypted tcp connection (including deprecated TLS 1.1)
#        tls12       Encrypted tcp connection with TLS 1.2
#        ssl         Encrypted tcp connection with TLS 1.2

# Hostname
HOSTNAME=$(hostname -s)

# asia1.ethermine.org / us1.ethermine.org / us2.ethermine.org
SERVER="eu1.ethermine.org"

# Sratum Port 4444 / Alt Statum 14444 / SSL 5555
PORT="5555"

#
POOL="0x925966644EdEc86d0CC1C1cc6165A25A78b91Ba4.$HOSTNAME"

while [ 1 ]; do
	/usr/local/bin/et/bin/ethminer -U --HWMON 1 --farm-retries 4 -P stratum1+ssl://$POOL@$SERVER:$PORT &> /dev/null
done &
