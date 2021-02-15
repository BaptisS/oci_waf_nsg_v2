#!/bin/bash
#https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/datatypes/AddSecurityRuleDetails
echo "  {" >> nsg-waf-TCP443.json
echo "        \"description\": null,">> nsg-waf-TCP443.json
echo "        \"destination\": null,">> nsg-waf-TCP443.json
echo "        \"destination-type\": null,">> nsg-waf-TCP443.json
echo "        \"direction\": \"INGRESS\",">> nsg-waf-TCP443.json
echo "        \"icmp-options\": null,">> nsg-waf-TCP443.json
echo "        \"is-stateless\": false,">> nsg-waf-TCP443.json 
echo "        \"protocol\": \"6\",">> nsg-waf-TCP443.json
echo "        \"source\": $1,">> nsg-waf-TCP443.json
echo "        \"source-type\": \"CIDR_BLOCK\",">> nsg-waf-TCP443.json
echo "        \"tcp-options\": {">> nsg-waf-TCP443.json
echo "          \"destination-port-range\": {">> nsg-waf-TCP443.json
echo "            \"max\": 443,">> nsg-waf-TCP443.json
echo "            \"min\": 443">> nsg-waf-TCP443.json
echo "          },">> nsg-waf-TCP443.json
echo "          \"source-port-range\": null">> nsg-waf-TCP443.json
echo "        },">> nsg-waf-TCP443.json
echo "        \"udp-options\": null">> nsg-waf-TCP443.json
echo "      },">> nsg-waf-TCP443.json
