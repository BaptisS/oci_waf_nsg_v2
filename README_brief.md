1.1-	Allow inbound **HTTPS (TCP443) only**

1.1.1- Create an enpty Network Security Group. (Copy its OCID)

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx’ by your NSG OCID copied in the previous step.)


```
wafnsgid=ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx

rm -f waf_nsg_rule_build.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_nsg_v2/main/waf_nsg_rule_443_build.sh
chmod +x waf_nsg_rule_443_build.sh
./waf_nsg_rule_443_build.sh
```


1.2-	Allow inbound **HTTP (TCP80) only**

1.2.1- Create an enpty Network Security Group. (Copy its OCID)

1.2.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx’ by your NSG OCID copied in the previous step.)


```
wafnsgid=ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx

rm -f waf_nsg_rule_80_build.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_nsg_v2/main/waf_nsg_rule_80_build.sh
chmod +x waf_nsg_rule_80_build.sh
./waf_nsg_rule_80_build.sh
```



1.3-	Allow inbound **HTTP (TCP80) and HTTPS (TCP443) in a single Network Security Group**  ('Security Rules per NSG' service limits needs to be increased first.)

1.3.1- Create an enpty Network Security Group. (Copy its OCID)

1.3.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx’ by your NSG OCID copied in the previous step.)



```
wafnsgid=ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx

rm -f waf_nsg_rule_80_443_build.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_nsg_v2/main/waf_nsg_rule_80_443_build.sh
chmod +x waf_nsg_rule_80_443_build.sh
./waf_nsg_rule_80_443_build.sh
```


1.4-	Allow inbound **Custom Port**

1.4.1- Create an enpty Network Security Group. (Copy its OCID)

1.4.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx’ by your NSG OCID copied in the previous step.)

(Replace ‘8080’ by desired TCP port number.)

```
wafnsgid=ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx
TCPport=8080

rm -f waf_nsg_rule_custom_build.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_nsg_v2/main/waf_nsg_rule_custom_build.sh
chmod +x waf_nsg_rule_custom_build.sh
./waf_nsg_rule_custom_build.sh $TCPport
```

