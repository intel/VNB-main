#!/bin/bash

current_dir=`pwd`

# Fetch VNB SecMon EMS code from Github repo
function fetch_secmon_ems() {
  cd $current_dir
  repo init -u https://rajdroid@bitbucket.org/datasecuritygroup/vnb-main.git -m vnb_secmon_ems.xml
  repo sync --force-sync
  cp -r vnb-secmon-config/SecMon_EMS/ .
  cp -r vnb-common-utils/rbac ./SecMon_EMS
  rm -rf vnb-common-utils
  rm -rf vnb-secmon-config
}

# Install the fetched SecMon EMS
function install_run_secmonems() {
  cd $current_dir
  cd SecMon_EMS/installer/
  chmod +x ./install.sh
  ./install.sh
}

# Fetch VNB IPSec EMS code from Github repo
function fetch_ipsec_ems() {
  cd $current_dir
  repo init -u https://rajdroid@bitbucket.org/datasecuritygroup/vnb-main.git -m  vnb_ipsec_ems.xml
  repo sync --force-sync
  cp -r vnb-ipsec-config/IPSec_EMS .
  cp -r vnb-common-utils/rbac ./IPSec_EMS
  rm -rf vnb-common-utils
  rm -rf vnb-ipsec-config
}

# Install the fetched IPSec EMS
function install_run_ipsecems() {
  cd $current_dir
  cd IPSec_EMS/
  chmod +x install.sh
  ./install.sh
}

# Fetch IPSec Enforcer code from Github
function fetch_enforcer() {
  cd $current_dir
  repo init -u https://rajdroid@bitbucket.org/datasecuritygroup/vnb-main.git -m vnb_enforcer_peer.xml
  repo sync --force-sync
  
  mv vnb-ipsec-config/IPSec_Enforcer .
  rm -rf vnb-ipsec-config
}

# Install IPSec Enforcer 
function install_run_ipsecenforcer() {
  cd $current_dir
  echo "installing IPSec_Enforcer Components"
  cd IPSec_Enforcer/
  chmod +x install.sh
  ./install.sh
}

# Fetch SecMon Agent code from Github repo
function fetch_secmon() {
  cd $current_dir
  repo init -u https://rajdroid@bitbucket.org/datasecuritygroup/vnb-main.git -m vnb_secmon_agent.xml
  repo sync --force-sync

  cp -r vnb-secmon-config/SecMon_Agent .
  cp -r vnb-secmon-broker/SecMon_Broker/secmon_plugin SecMon_Agent/
  cp -r vnb-ipsec-config/IPSec_Enforcer .
  rm -rf vnb-secmon-config
  rm -rf vnb-secmon-broker
  rm -rf vnb-ipsec-config
}

# Install SecMon Agent code
function install_run_secmon() {
  cd $current_dir
  echo "installing SecMon Components"
  cd SecMon_Agent/installer/
  chmod +x install.sh
  ./install.sh

  echo "installing IPSec_Enforcer Components"
  cd ../../IPSec_Enforcer/
  chmod +x install.sh
  ./install.sh
}

if [ "$#" -ne 1 ]
then
  echo "Invalid first argument, please enter one of these option"
  echo "Usage: ./vnb_components_installer.sh [secmon_ems | ipsec_ems | ipsec_enforcer_peer | secmon_agent]"
  echo "Bye..."
  exit
fi

if [ $1 = "secmon_ems" ]
then
  echo "Fetching code..."
  fetch_secmon_ems
  echo "Fetching code...done"
  echo "Install SecMon EMS..."
  install_run_secmonems
  echo "Install SecMon EMS...done"
  echo "Bye..."
  exit
elif [ $1 = "ipsec_ems" ]
then
  echo "Fetching code..."
  fetch_ipsec_ems
  echo "Fetching code...done"
  echo "Install IPSec EMS..."
  install_run_ipsecems
  echo "Install IPSec EMS...done"
  echo "Bye..."
  exit
elif [ $1 = "ipsec_enforcer_peer" ]
then
  echo "Fetching code..."
  fetch_enforcer
  echo "Fetching code...done"
  echo "Install IPSec Enforcer..."
  install_run_ipsecenforcer
  echo "Install IPSec Enforcer...done"
  echo "Bye..."
  exit
elif [ $1 = "secmon_agent" ]
then
  echo "Fetching code..."
  fetch_secmon
  echo "Fetching code...done"
  echo "Install SecMon..."
  install_run_secmon
  echo "Install SecMon...done"
  echo "Bye..."
  exit
else
  echo "Invalid first argument, please enter one of these option"
  echo "Usage: ./vnb_components_installer.sh [secmon_ems | ipsec_ems | ipsec_enforcer_peer | secmon_agent]"
  echo "Bye..."

fi
