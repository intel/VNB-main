## FREQUENTLY ASKED QUESTIONS (FAQ)
====================================

-   Problem: Minimum number of network interfaces required to
    run Secmon.

    Secmon require at least two interfaces to run. One interface is
    required by DPDK through which secmon will receive packets and
    another Interface is required by secmon to transmit the packets
    to collector. Interface binded to DPDK is not visible to kernel so
    we can’t use it to transmit packets to collector.

-   Problem: How should I check that packets are received by Secmon.

    Temporarily unbind interface bound to DPDK and  send UDP packets to interface which you want to bind to DPDK. Now run ***tcpdump*** command and check that you are receiving packets or not. If you are not receiving packets than ***ping*** the interface to check that if it’s reachable from the machine from which we you are sending UDP packets. If ping is not working than check your network configurations. If you able to receive packets using **tcpdump** command then bind that interface to DPDK again and now run SecMon, this time packet will be reaching SecMon's ingress port.

-   Problem: How I can check that Secmon is receiving configurations
    from EMS.

    When you run Secmon and if it’s not able to receive configurations
    from EMS than it will show Error message stating ***“Error to
    fetch url”.*** You need to check if EMS machine is reachable from
    your Secmon machine through ***ping*** command. If its reachable you
    have to check if EMS is running or not.

-   Problem: EMS is reachable but Secmon is not receiving configurations
    from EMS.

    Check if any proxy is set. Run this command ***echo $http\_proxy***
    and ***echo $https\_proxy***. If this is set than unset it by
    running command **export http\_proxy=** and
    **export https\_proxy=.**

-   Problem: Not receiving any ACK packets from interface which is
    binded to DPDK.

    You will not receive any ACK packets from the interface which is
    used by DPDK.

-   Problem: ARP is not getting resolved to interface which is binded
    to DPDK.

    You can add static ARP entry to dpdk interface. First unbind the
    interface which is binded to DPDK and run **ifconfig** command and
    note down the mac address of the interface which you want to bind to
    DPDK and then go to other machine which is sending packets to DPDK
    interface and then type **arp –s &lt;ip address&gt; &lt;mac
    address&gt;**(ip address is of DPDK interface).

-   Problem: How I can verify that Secmon is running correctly.

    While traffic is running you can check that it if you are receiving
    packets on collector machine. After that you can make some changes
    in EMS GUI and press flush and then check that these configurations
    changes are seen on collector machine.

-   Problem: In environment where you are behind proxy. Follow this procedure for installation of components.

    Use installer present in each of the components for installation. First install dependencies for specific components using proxy, as without those you won't be able to access Internet. After that unset proxy and follow all the remaining steps. Follow this procedure for all the components.

-   Problem: Permissions required to run components.

    Each of the components installation required some basic permissions. For SecMon EMS, IPsec EMS and IPsec Enforcer you need **root** permissions for installing dependencies only. For running the these services you don't need **root** permissions. If you run SecMon EMS and IPsec EMS with **root** you won't be able to see webpages in web browser due to permission issues. So run SecMon EMS, IPsec EMS and IPsec Enforcer without **root** permissions.
    In case of SecMon component you need **root** permissions for installing dependencies as well as for running the application.

-   Problem: Are there any extra bytes added/removed by SecMon ?.

    **OpenStack**: In OpenStack environment if you are using TaaS for receiving mirrored traffic between client and server in ingress port of SecMon. Let suppose x bytes packet is going from client to server, this will be mirrored on to ingress port of SecMon, mirroring add 4 bytes for VLAN tag in this so total packet become x+4 bytes long. Size of packet in Analyzer machine would be x+4+14+20+8 bytes because we are encapsulating final packet in UDP packet.
    **Contrail Vrouter**: In case of mirroring is done through **contrail vrouter** the mirrored packet is same as that of packet between client and server. So in this case suppose packet between client-server is x bytes, the mirrored packet also of x bytes which is receive on SecMon ingress port. So packet size which we receive on Analyzer machine would be x+14+20+8 bytes.
    **GTP-U traffic**: In case GTP-U traffic mirrored towards SecMon then in that case GTP-U header is stripped in final packet. So let suppose x bytes of packet is going from client to server and it is mirrored to ingress port of SecMon. Size of packet received on Analyzer machine would be x-40+42 bytes. If GTP-U header is of 12 bytes. if GTP-U header is of 8 bytes the size of packet would be x-36+42 bytes.