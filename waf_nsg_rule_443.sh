#!/bin/bash
#https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/datatypes/AddSecurityRuleDetails
echo "  {" >> waf_nsg_443.json
echo "        \"description\": null,">> waf_nsg_443.json
echo "        \"destination\": null,">> waf_nsg_443.json
echo "        \"destination-type\": null,">> waf_nsg_443.json
echo "        \"direction\": \"INGRESS\",">> waf_nsg_443.json
echo "        \"icmp-options\": null,">> waf_nsg_443.json
echo "        \"is-stateless\": false,">> waf_nsg_443.json 
echo "        \"protocol\": \"6\",">> waf_nsg_443.json
echo "        \"source\": $1,">> waf_nsg_443.json
echo "        \"source-type\": \"CIDR_BLOCK\",">> waf_nsg_443.json
echo "        \"tcp-options\": {">> waf_nsg_443.json
echo "          \"destination-port-range\": {">> waf_nsg_443.json
echo "            \"max\": 443,">> waf_nsg_443.json
echo "            \"min\": 443">> waf_nsg_443.json
echo "          },">> waf_nsg_443.json
echo "          \"source-port-range\": null">> waf_nsg_443.json
echo "        },">> waf_nsg_443.json
echo "        \"udp-options\": null">> waf_nsg_443.json
echo "      },">> waf_nsg_443.json
