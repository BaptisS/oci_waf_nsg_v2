#!/bin/bash

rm -f waf_nsg_rule_custom.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_nsg_v2/main/waf_nsg_rule_custom.sh
chmod +x waf_nsg_rule_custom.sh

wafips=$(oci waas edge-subnet list --all)
wafcidrs=$(echo $wafips | jq '.data[] | .cidr')

rm -f waf_nsg_$TCPport.json
rm -f waf_nsg_$TCPport_fixed.json

echo "["  >> waf_nsg_$TCPport.json
for cidr in $wafcidrs; do ./waf_nsg_rule_custom.sh $cidr $TCPport; done
echo "]" >> waf_nsg_$TCPport.json
sed -i 's+66.254.103.241+66.254.103.241/32+g' waf_nsg_$TCPport.json                                            
sed -zr 's/,([^,]*$)/\1/' waf_nsg_$TCPport.json > waf_nsg_$TCPport_fixed.json

rm -f waf_nsg_$TCPport_fixed_lines_splitted*
rm -f waf_nsg_$TCPport_fixed_lines.json

jq -c '.[]' waf_nsg_$TCPport_fixed.json >> waf_nsg_$TCPport_fixed_lines.json
split -l 20 waf_nsg_$TCPport_fixed_lines.json waf_nsg_$TCPport_fixed_lines_splitted
wafnsgrulelists=$(find waf_nsg_$TCPport_fixed_lines_splitted*)
for nsgrulesfile in $wafnsgrulelists; do sed -i '$!s/$/,/' $nsgrulesfile ; done
for nsgrulesfile in $wafnsgrulelists; do sed -i '1s/^/[\n/' $nsgrulesfile ; done
for nsgrulesfile in $wafnsgrulelists; do echo "]" >> $nsgrulesfile ; done
for nsgrulesfile in $wafnsgrulelists; do oci network nsg rules add --nsg-id $wafnsgid --security-rules file://$nsgrulesfile ; done

rm -f waf_nsg_$TCPport_fixed_lines_splitted*
rm -f waf_nsg_$TCPport.json
rm -f waf_nsg_$TCPport_fixed.json
rm -f waf_nsg_rule_custom.sh
