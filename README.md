# oci_waf_nsg_v2
# Lockdown OCI WAF Origin using CloudShell (Network Security Groups) #
_An easy way to lockdown your OCI WAF Origin_ 


When using a Web Application Firewall, it is important to apply a set of security rules around your Web Application to block all requests which are not passing through the WAF service.

OCI WAF stand in front of your web application to detect and block unwanted/malicious access. In most cases, your Web Application itself sits behind a Load Balancer. Depending on your architecture and preferences, you may want to assign security rules to your Load Balancer or Web Application _subnets_ by using a _Security List_, or alternatively you may prefer to assign security rules to your Load Balancer or Web Application _Network Interfaces_ by using a _Network Security Group_.


The following document will guide you through the steps needed to create a ***Network Security Group*** , import Security Rules and assign the desired LBaaS/Compute Virtual Network Interface to it. If you prefer to use _Security Lists_ for this purpose please consult the following guide : https://github.com/BaptisS/oci_waf_seclist_v2



> ***Important Note:*** 
> If your Web Application sits behind a Load Balancer, Security rules must be applied to your Load Balancer subnet (Security Lists) or to your Load Balancer Network Interfaces (Security Groups).


***Prerequisites:***

- An OCI user account with enough permissions to create and assign Network Security Groups in the desired Compartment / VCN. 
- At least one Virtual Cloud Network, one Subnet and one Network Interface (LBaaS , Compute, etc.) already created. 
 
 
 
 
### 1- Create a New (empty) Network Security Group.    

 1.1-	Sign-in to the OCI web console with your OCI user account. 

1.2-	Open the OCI Menu (top left), expand the ***‘Networking’*** section and click on ***‘Virtual Cloud Networks’***.  

1.3-	Click on your VCN then select the ***‘Network Security Groups’*** Resources type. 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/01.JPG)


1.4-	Click on the ***‘Create Network Security Group’*** button. 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/02.JPG)


1.5-	Provide a meaningful name for this new Network Security Group. (Ie. ‘OCIWAF-NSG’)

1.6-	Select proper compartment, then click on ***‘Next’*** button. 

1.7-  Click ***‘Create’*** button to create an empty NSG. 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/03.JPG)


1.7-	In the 'Network Security Group Information' section copy the NSG OCID (click the 'Copy' link in front of 'OCID')  


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/04.JPG)
 
 
### 2-    Import Security Rules using Cloud Shell commands.

2.1-	Start your OCI Cloud Shell session. In the OCI Console top right section, click on the Cloud Shell icon:  


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/05.JPG)


2.2-	Wait few seconds for your Cloud Shell instance to be started and ready to use.


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/06.JPG)


2.3-	Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session.

```
export wafnsgid=ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx
```
(Replace ‘ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaxxxxx’ by your NSG OCID copied in the previous step.)


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/07.JPG)


2.4-	Allow inbound **HTTPS (TCP443) only**

2.4.1- Copy and Paste (_CTRL+SHIFT+V_) the commands below in your Cloud Shell session.

```
rm -f waf_nsg_rule_build.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_nsg_v2/main/waf_nsg_rule_443_build.sh
chmod +x waf_nsg_rule_443_build.sh
./waf_nsg_rule_443_build.sh
```


### 3-    Review the Network Security Group content. 

3.1-	Ensure the new NSG has been populated successfully with security rules.


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/08.JPG)



### 4-   [Option 1] Assign NSG to your Load Balancer Virtual Network Interfaces.
4.1-	Go to your Load Balancer dashboard, (OCI Menu -> Networking -> Load Balancers) and then select the Network Security Groups ***‘Edit’*** link . 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/09.JPG)


4.2-	Select the new NSG (ie. OCIWAF-NSG). 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/10.JPG)


4.3-	Click on ***‘Save Changes’*** button.  

### 4-   [Option 2] Assign NSG to your Web Application (Compute Instance).
4.1-	Go to your Compute VM instance dashboard, (OCI Menu -> Compute -> Instances) and then select the desired Compute VM.

4.2- Click on the Network Security Groups ***‘Edit’*** link . 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/11.JPG)


4.2-	Select the new NSG (ie. OCIWAF-NSG). 


![PMScreens](https://github.com/BaptisS/oci_waf_nsg/blob/master/img/12.JPG)


4.3-	Click on ***‘Save Changes’*** button.  



### 5-   Remove any permissive rules 
5.1-	Once you've assigned the new NSG which contains the required security rules to allow inbound traffic from OCI WAF endpoints, you can remove any other ( more permissive ) pre-existing rules to lockdown your WAF Origin and allow only inbound traffic from the OCI WAF services.






### Links and References :


OCI WAF documentation and Public IPS list : https://docs.cloud.oracle.com/en-us/iaas/Content/WAF/Concepts/gettingstarted.htm


OCI CloudShell : https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm


OCI WAF CLI References : https://docs.cloud.oracle.com/en-us/iaas/api/#/en/waas/latest/

