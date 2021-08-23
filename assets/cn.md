### IP Address

- Internet Protocol
- A unique identifier assigned to each device in a computer network
- **Example for need - Postal Service for sending a letter.**
- 32 bit in length - 32 binary digits
- Octets are seperated by dots
- 0 - 255 each octet as 255 is the largest number which can be made from 8 bits having all ones.
- **Subnet mask is always paired with an IP address.**
- **Subnet mask is used to identify network and host section of an IP address.**
- <img src="C:\Users\GodFather\AppData\Roaming\Typora\typora-user-images\image-20210822114706675.png" alt="image-20210822114706675" style="zoom:33%;" />
- IP address is in **Network Layer** 
- **Example of same address number in different street is for network and host bit need.** 
- **Class D for multicast address and Class E for research purpose.**
- **Class A - 1.0.0.0 - 126.255.255.255** - Total Host of 16,777,214 - **16 million 7 hundred seventy seven thousand 2 hundred 14.** = 256 * 256 * 256 - 2
- 
- 
- 

### Embeded OS 

An OS designed for a specific task that is not computer. It runs the code which allows the device to do it's job.

Example - Satelite Navigation System, Smart Watch, Elevators.

### Switch

- Sends data packet in local network
- First floodthen learn the network 
- Switch has MAC Table sometimes also called as CAM Table - Content Addressable Memory
- The switch assigns a separate timer to each entry of the CAM table
- If switch finds entry in table again then it resets the timer.<img src="https://www.ciscopress.com/content/images/chap2_9781587206641/elementLinks/02fig12.jpg" alt="Types of Cisco Switches &gt; Implementing Cisco IP Switched Networks (SWITCH)  Foundation Learning Guide: Network Design Fundamentals | Cisco Press" style="zoom:150%;" />

- **Cisco Nexus 7000**, which is designed for mission-critical data center uses upto 2.8 Gbps bandwidth per slot.
- 

### ICMP - Network Layer Protocol

- **Internet Control Message Protocol**
- Companion/Extension for IP protocol.
- IP + ICMP(upper protocol)
- ICMP for single host.
- Messages first encapsulated inside IP datagram before going.
- Error reporting protocol to communicate error information to other router hosts or network devices
- Host and router sends IP datagram problem back to the sender.
- **Error Reporting Header Format** - 32 bits - Type(8 bit) + Code(8 bit)  + Checksum(16 bits) with variable data section.
- **Query Header Format** - 32 bits - Type(8 bit) + Code(8 bit)  + Checksum(16 bits) with Identifier and Sequence Number.
- **Error Reporting Messages** - 
  1. **Destination Unreachable** - ***A error message comes to source with reason code if error occurred ELSE the ICMP message will not get generated**.*
  2. **Source Quench** - network congestion(packet waiting long) and datagram dropped.
  3. **Redirection Message ** - if some router is faulty it tells the alternate path for the source to send packet.
  4. **Parameter Problem** - packet header problem
- **Query Messages -** 
  1. **Echo Request and Echo Reply** - used to tell if host/router is live or not
  2. **Timestamp Request and Reply** - 
     1. to find the round trip time between two devices.
     2. to check if clock of two devices are synchronized or not.
- Last host where packet got error will generate ICMP but while returning this message to source in path the other error message will get generate, this way **infinite** error messages will get generated. So rule is no ICMP will be generated for ICMP message already returning.
- No ICMP for multicast addressing - Boht sare generate ho jyege ese
- No ICMP for Loopback address 127.0.0.0 - khud ke liye no ICMP

> TTL - forever packet ghumta na reh jaye isliye TTL se time exceeded hota h.

### DHCP - **Dynamic Host Configuration Protocol**

- Every computer on the network needs IP Address for communication.

- **Two ways to assign IP to computer -**

  - **Static IP -** user assigns IP address manually in network configuration.
  - **Dynamic IP -** automatically gets assigned to the computer from DHCP Server,

- It can assign IP address, subnet mask, default gateway and DNS server.

- Computer broadcast request for IP address on the network, then DHCP assign from its pool and deliver it.

- to check information about DHCP server.

  ```markdown
  ipconfig /all
  ```

- DHCP server has scope of IP address to allocate and depend on network administrator.

- **Computer doesn't own the IP address but get in the lease, amount of time it is available to the PC. To make sure DHCP server does not run out of IP addresses so it gives in lease.**

- DHCP Format:

  - Op - operation code (request/reply) - 1byte
    - Discover/Request - **Request**
    - Offer/Acknowledgement - **Reply**
  - HType - Hardware Type - 1byte
  - HLen - Hardware address length(MAC Address) - 1 byte
  - Hopes - number of router between DHCP client and DHCP Server - 1 byte
  - XID - transaction id is 32 byte number
    - Same transaction id for sent and received message to check.

- Client creates discover message to find DHCP server if auto option is ticked.

- Discover Message is placed in **Application layer in UDP Segment**

- **Port Number**

  - DHCP Server - 67 UDP
  - DHCP Client - 68 UDP

- **Working -** 

  - Application layer form Discover packet in Client side.
  - Transport layer place it in UDP segment with source and destination port.
  - It pass this to Network layer to form IP Datagram source and destination IP Address.
  - Which the received by Data Link Layer where source and destination MAC address are added.
  - Frame by DLL is passed to switch by physical layer.

- **DHCP Release** - to release the IP if client left the network.

- **DHCP Inform** - Some settings configured but some needed.

- **Steps to configure DHCP in Cisco IOS** -

  - Exclude IP address

    ```markdown
    R1(config)# ip dhcp excluded-address 192.168.0.1 192.168.0.10
    R1(config)# ip dhcp excluded-address 192.168.0.1
    ```

  - Define a pool name

    ```markdown
    R1(config)# ip dhcp pool LAN-POOL-1
    ```

  - Configure DHCP pool

    ```markdown
    R1(dhcp-config)# network 192.168.0.1 255.255.255.0
    R1(dhcp-config)# default-router 192.168.0.1
    R1(dhcp-config)# dns-server 192.168.0.25
    R1(dhcp-config)# domain-name example.com
    ```

  - DHCP verification commands

    ```markdown
    show running-config
    show ip dhcp binding
    show ip dhcp server stastics
    ```

  - Disable Cisco IOS DHCP

    ```markdown
    R1(config)# no service shcp
    ```

  - Allow router to forward DHCP packet to external DHCP Server.

    ```markdown
    R1(config)# ip helper-address 192.168.11.6
    ```

  - Configure DHCP Client

    ```markdown
    S1(config)# interface G0/0/1
    S1(config)# ip address dhcp
    S1(config)# no shutdown
    ```

### TCP

- Transport layer protocol which perform segmentation (process of breaking data into segment of bytes) 
- **Transmission Control Protocol**
- **TCP Header** - 20 bytes to 60 Bytes
  - Source Port - 16 bit
  - Destination Port - 16 bit.
  - Sequence Number - 32 bit
  - Acknowledgement Number - 32 bit
  - Checksum - 16 bit
- TCP Header is added to data from Application Layer to Transport Layer.
- Functionality of TCP - 
  - **Byte Streaming** - Breaking continues data coming from application layer into segment of bytes.
  - **Connection Oriented** - For reliable connection TCP is used - for lost data - retransmit it.
  - **Full Duplex Protocol** - After connection established both ends can send and receive data.
  - **Piggy Backing** - Sending data along with acknowledgement (Thoda rukja data bhi lejana sath m)
  - **Error Control ** - Tells if error happened.
  - **Congestion Control** - Control congestion in path to destination.

### UDP

- Every computer on the network needs IP Address for communication.

### LAN

- Lan is a **single broadcast domain** that cosist of group of devices in that domain.

- **Broadcast Domain** - Group of devices which will receive a broadcast frame(destination MAC : FFFF.FFFF.FFFF) sent by any one of the member. 

- Broadcast Frame has destination MAC as FFFF.FFFFF.FFFF while unicast frames have specific address to it.

- **Two routers connected together are also broadcast domain between the two only.**

- **Why V-LAN ?** - 

  - Performance  - Lot of uncessary traffic in diff departments.
  - Security - who has access to what.

- ##### Types of Switches

  - Managed Switch - greate flexibilty and control
  - Un-Managed Switch - work plug and play
  - Cloud- Managed Switch - update switch and updates via cloud.

- Routers have MAC address.

- Switch is only aware upto L-2

- Switch flood all FFFF.FFFF.FFFF frames even if there exist a network of diff subnets with switch.

-  Although we seperate the network in 3 subnet they still in same broadcast domain.

- If devices seperate at Network Level (L3) of OSI they still are in same broadcast domain (L2).

- For this we use VLAN

- **Switch will not forward traffic between VLANs including boradcast/unicast traffic**.

- **Unicast traffic is the one-one traffic**

- **Switch does not perform inter-VLAN routing it must send traffic through router only.**

-  

### VLAN

- Logically configured on switch on per interface basis
- **logically seperate end host at layer 2**
- VLANs seperate broadcast domains
- **Switches do not forward traffic directly between hosts in different VLANs.**
- 

