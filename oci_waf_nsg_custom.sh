#!/bin/bash
#https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/datatypes/AddSecurityRuleDetails
echo "  {" >> waf_nsg_$1.json
echo "        \"description\": null,">> waf_nsg_$2.json
echo "        \"destination\": null,">> waf_nsg_$2.json
echo "        \"destination-type\": null,">> waf_nsg_$2.json
echo "        \"direction\": \"INGRESS\",">> waf_nsg_$2.json
echo "        \"icmp-options\": null,">> waf_nsg_$2.json
echo "        \"is-stateless\": false,">> waf_nsg_$2.json 
echo "        \"protocol\": \"6\",">> waf_nsg_$2.json
echo "        \"source\": $1,">> waf_nsg_$2.json
echo "        \"source-type\": \"CIDR_BLOCK\",">> waf_nsg_$2.json
echo "        \"tcp-options\": {">> waf_nsg_$2.json
echo "          \"destination-port-range\": {">> waf_nsg_$2.json
echo "            \"max\": $2,">> waf_nsg_$2.json
echo "            \"min\": $2">> waf_nsg_$2.json
echo "          },">> waf_nsg_$2.json
echo "          \"source-port-range\": null">> waf_nsg_$2.json
echo "        },">> waf_nsg_$2.json
echo "        \"udp-options\": null">> waf_nsg_$2.json
echo "      },">> waf_nsg_$2.json
