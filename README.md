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