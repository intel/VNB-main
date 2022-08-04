DISCONTINUATION OF PROJECT.

This project will no longer be maintained by Intel.

Intel has ceased development and contributions including, but not limited to, maintenance, bug fixes, new releases, or updates, to this project. 

Intel no longer accepts patches to this project.

If you have an ongoing need to use this project, are interested in independently developing it, or would like to maintain patches for the open source software community, please create your own fork of this project. 
# README

## Introduction
This contains **manifests** files for fetching various components using **repo tool** automatically. **default.xml** will fetch this repo. And various other manifests file will fetch specific components.

Documentation for whole Architecture is also present inside this repo. Each document purpose is listed below:

+ **SecMon Usage guide.pdf**
	Provide usage guide and installation steps using `vnb_components_installer.sh` for each of components.
+ **SecMon_EMS_Rest_API_Documentation.pdf**
	Provide Rest API documentation for SecMon EMS.
+ **Virtual_Network_Broker_Brief.pdf**
	This document briefly explains the SecMon whole Architecture and each components.
+ **Virtual_Network_Broker_Function_specification.pdf**
	This is a functional specification of SecMon. SecMon whole Architecture is thoroughly discussed in this document.

A installation script is `vnb_components_installer.sh` present in this repo which fetch and install each components. 
It takes single argument asking which components to install [secmon_ems | ipsec_ems | ipsec_enforcer_peer | secmon_agent].

Project is divided among following repositories which are listed below:

+ **https://github.com/intel/vnb-main**
	Contains documentation and project components install script.
+ **https://github.com/intel/vnb-secmon-config**
	Contains VNB SecMon EMS and VNB SecMon Agent source code and installation script.
+ **https://github.com/intel/vnb-secmon-broker**
	Contains VNB SecMon Plugins(Rawforward and Netflow) source code. 
+ **https://github.com/intel/vnb-common-utils**
	Contains RBAC (Role based Access control) source code which is used by VNB IPSec EMS.
+ **https://github.com/intel/vnb-ipsec-config**
	Contains VNB IPSec EMS and VNB IPSec Enforcer source code which handle IPsec tunnel configurations between Machines.
	
