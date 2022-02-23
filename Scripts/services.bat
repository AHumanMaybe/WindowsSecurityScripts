::####################################################################################
::Windows Serivce Managment Script for CyberCrustaceans CyberPatriot Team
::####################################################################################

echo CHECK README FOR CRITICAL SERVICES BEFORE CONTINUING WITH SCRIPT
echo I WILL DISABLE THINGS CRITICAL FOR RDP, FILE SHARING, PRINTER SERVICES, FAX, AND MORE
pause
pause

REM Manual Services
color 01

echo SrvcSurg
sc config "SrvcSurg" start= demand

echo dmserver
sc config "dmserver" start= demand

REM Automatic Services
color 02

echo Dhcp 
sc start "Dhcp"
sc config "Dhcp" start=automatic

echo Dnscache 
sc start "Dnscache"
sc config "Dnscache" start=automatic

echo NtLmSsp
sc start "NtLmSsp"
sc config "NtLmSsp" start=automatic

echo EventLog
sc start "eventlog"
sc config "eventlog" start=automatic

echo Auto Update Service 
sc start "wuauserv"
sc config "wuauserv" start=automatic

echo Windows Security Service 
sc start "SecurityHealthService"
sc config "SecurityHealthService" start=automatic

echo Windows Management Instrumentation
sc start "Winmgmt"
sc config "Winmgmt" start=automatic

echo Windows Defender Firewall
sc start "mpssvc"
sc config "mpssvc" start=automatic

echo Windows Defender Advanced Threat Protection Service 
sc start "Sense"
sc config "Sense" start=automatic

echo Microsoft Defender Antivirus Service 
sc start "WinDefend"
sc config "WinDefend" start=automatic

echo Microsoft Defender Antivirus Netowrk Inspection Service 
sc start "WdNisSvc"
sc config "WdNisSvc" start=automatic

echo Group Policy Client
sc start "gpsvc"
sc config "gpsvc" start=automatic

echo Cryptographic Services
sc start "CryptSvc"
sc config "CryptSvc" start=automatic

echo Power
sc start "Power"
sc config "Power" start=automatic

echo Remote Procedure Call
sc start "RpcSa"
sc config "RpcSa" start=automatic 

echo Software Protection
sc start "sppsvc"
sc config "sppsvc" start=automatic

echo System Event Notification Service 
sc start "SENS"
sc config "SENS" start=automatic

REM Disable Services
color 05

::################################DISM FEATURES

Dism /online /Disable-Feature /FeatureName:TFTP
Dism /online /Disable-Feature /FeatureName:TelnetClient
Dism /online /Disable-Feature /FeatureName:SNMP
Dism /online /Disable-Feature /FeatureName:TelnetServer
Dism /online /Disable-Feature /FeatureName:XPSServices
Dism /online /Disable-Feature /FeatureName:XPSViewer

::#############################################

echo MSSQLServerADHelper
	sc stop "MSSQLServerADHelper"
	sc config "MSSQLServerADHelper" start=disabled

echo nfsclnt
	sc stop "nfsclnt"
	sc config "nfsclnt" start=disabled

echo nfssvc
	sc stop "nfssvc"
	sc config "nfssvc" start=disabled

echo Themes
	sc stop "Themes"
	sc config "Themes" start=disabled

echo SharedAccess
	sc stop "SharedAccess"
	sc config "SharedAccess" start=disabled

echo SCPolicySvc
	sc stop "SCPolicySvc"
	sc config "SCPolicySvc" start=disabled

echo PolicyAgent
	sc stop "PolicyAgent"
	sc config "PolicyAgent" start=disabled

echo IPBusEnum
	sc stop "IPBusEnum"
	sc config "IPBusEnum" start=disabled

echo CscService
	sc stop "CscService"
	sc config "CscService" start=disabled

echo SZCSVC
	sc stop "SZCSVC"
	sc config "SZCSVC" start=disabled

echo WINS
	sc stop "WINS"
	sc config "WINS" start=disabled

echo VDS
	sc stop "VDS"
	sc config "VDS" start=disabled

echo Uploadmgr
	sc stop "Uploadmgr"
	sc config "Uploadmgr" start=disabled

echo Sacsvr
	sc stop "Sacsvr"
	sc config "Sacsvr" start=disabled

echo ScardSvr
	sc stop "ScardSvr"
	sc config "ScardSvr" start=disabled

echo ShellHWDetection
	sc stop "ShellHWDetection"
	sc config "ShellHWDetection" start=disabled

echo RsoPProv
	sc stop "RsoPProv"
	sc config "RsoPProv" start=disabled

echo RPCLocator
	sc stop "RPCLocator"
	sc config "RPCLocator" start=disabled

echo RDSessMgr
	sc stop "RDSessMgr"
	sc config "RDSessMgr"

echo WmdmPmSN
	sc stop "WmdmPmSN"
	sc config "WmdmPmSN" start=disabled

echo IsmServ
	sc stop "IsmServ"
	sc config "IsmServ" start=disabled

echo IISADMIN
	sc stop "IISADMIN"
	sc config "IISADMIN" start=disabled

echo HTTPFilter
	sc stop "HTTPFilter"
	sc stop "HTTPFilter" start=disabled

echo helpsvc
	sc stop "helpsvc"
	sc config "helpsvc"

::echo DNS
::	sc stop "DNS"
::	sc config "DNS" start=disabled

echo NtFrs
	sc stop "NtFrs"	
	sc config "NtFrs" start=disabled

echo TrkWks
	sc stop "TrkWks"
	sc config "TrkWks" start=disabled

echo MSDTC
	sc stop "MSDTC"
	sc config "MSDTC" start=disabled

echo ERSVC
	sc stop "ERSVC"
	sc config "ERSVC" start=disabled

echo DFS 
	sc stop "Dfs"
	sc config "Dfs" start=disabled

echo SMTP Service
	sc stop "SMTPSVC"
	sc config "SMTPSVC" start=disabled

echo SimpTcp
	sc stop "simptcp"
	sc config "simptcp" start=disabled

echo W3SVC
	sc stop "W3SVC"
	sc config "W3SVC"

echo MSFTP Service
	sc stop "msftpsvc"
	sc config "msftpsvc" start=disabled

echo FTP Serivce
	sc stop "ftpsvc"
	sc config "ftpsvc" start=disabled

echo AxInstSV Active x
	sc stop "AxInstSV"
	sc config "AxInstSV" start= disabled

echo ALG app layer gateway
	sc stop "ALG"
	sc config "ALG" start= disabled

echo wbengine block level backup engine services
	sc stop "wbengine"
	sc config "wbengine" start= disabled

echo bthserv bluetooth support services
	sc stop "bthserv"
	sc config "bthserv start= disabled

echo CertPropSvc certificate propagation
	sc stop "CertPropSvc"
	sc config "CertPropSvc" start= disabled

echo fax fax
	sc stop "fax"
	sc config "fax" start= disabled

echo hidserv human interface device services
	sc stop "hidserv"
	sc config "hidserv" start= disabled

echo IKEEXT IKE and AuthIP IPsec Keying Modules
	sc stop "IKEEXT"
	sc config "IKEEXT" start= disabled

echo iphlpsvc ip iphelper - manual
	sc stop "iphlpsvc"
	sc config "iphlpsvc" start= disabled

echo KtmRm KtmRm for distributed transaction coordinator
	sc stop "KtmRm"
	sc config "KtmRm" start= disabled

echo MSiSCSI microsoft iSCSI Initiator services
	sc stop "MSiSCSI"
	sc config "MSiSCSI" start= disabled

echo swprv Microsoft software shadow copy provider
	sc stop "swprv"
	sc config "swprv" start= disabled

echo NetTcpPortSharing Net.Tcp Port Sharing services
	sc stop "NetTcpPortSharing"
	sc config "NetTcpPortSharing" start= disabled

echo Netlogon netlogon
	sc stop "Netlogon"
	sc config "Netlogon" start= disabled

echo WpcMonSvc Parental Controls
	sc stop "WpcMonSvc"
	sc config "WpcMonSvc" start= disabled

echo PNRPsvc Peer Name resolution Protocol
	sc stop "PNRPsvc"
	sc config "PNRPsvc" start= disabled

echo p2psvc Peer Networking Grouping
	sc stop "p2psvc"
	sc config "p2psvc" start= disabled

echo p2pimsvc Peer Networking Identity Manager
	sc stop "p2pimsvc"
	sc config "p2pimsvc" start= disabled

echo PlugPlay Plug and Play
	sc stop "PlugPlay"
	sc config "PlugPlay" start= disabled

echo PNRPAutoReg PNRP Machine Name Publication service
	sc stop "PNRPAutoReg"
	sc config "PNRPAutoReg" start= disabled

echo WPDBusEnum PnP-X IP Bus Enumerator
	sc stop "WPDBusEnum"
	sc config "WPDBusEnum" start= disabled


echo QWAVE Quality Windows Audio Video Experience
	sc stop "QWAVE"
	sc config "QWAVE" start= disabled
::########################################################Remote Access and Desktop
echo RasAuto Remote Access Auto Connection Manager
	sc stop "RasAuto"
	sc config "RasAuto" start= disabled

echo RasMan Remote Access Connection Manager
	sc stop "RasMan"
	sc config "RasMan" start= disabled

echo SessionEnv RemoteDesktop Configuration
	sc stop "SessionEnv"
	sc config "SessionEnv" start= disabled

echo TermService RemoteDesktop Service
	sc stop "TermService"
	sc config "TermService" start= disabled

echo RemoteRegistry Remote registry 
	sc stop "RemoteRegistry"
	sc config "RemoteRegistry" start= disabled

echo RemoteAccess Routing and Remote Access - offers routing services to businesses in local area and wide area network environments
	sc stop "RemoteAccess"
	sc config "RemoteAccess" start= disabled
::#######################################################Not known to cause issues when RDP critical service but just in case	
echo seclogon Secondary Logon 
	sc stop "seclogon"
	sc config "seclogon" start= disabled

echo SstpSvc Secure Socket Tunneling Protocol Service
	sc stop "SstpSvc"
	sc config "SstpSvc" start= disabled 

echo SNMPTRAP SNMP Trap 
	sc stop "SNMPTRAP"
	sc config "SNMPTRAP" start= disabled

echo SSDPSRV SSDP Discovery
	sc stop "SSDPSRV"
	sc config "SSDPSRV" start= disabled

echo lmhosts TCP/IP NetBIOS Helper 
	sc stop "lmhosts"
	sc config "lmhosts" start= disabled

echo TapiSrv Telephony
	sc stop "TapiSrv"
	sc config "TapiSrv" start= disabled

echo telnet telnet
	sc stop "telnet"
	sc config "telnet" start= disabled

echo tlntsvr telnet
	sc stop "tlntsvr"
	sc config "tlntsvr" start= disabled

echo upnphost UPnP Device Host
	sc stop "upnphost"
	sc config "upnphost" start= disabled

echo VSS Volume Shadow Copy
	sc stop "VSS"
	sc config "VSS" start= disabled

echo wcncsvc Windows Connect Now - Config Registrar
	sc stop "wcncsvc"
	sc config "wcncsvc" start= disabled

echo WMPNetworkSvc Windows Media Player Network Sharing Service
	sc stop "WMPNetworkSvc"
	sc config "WMPNetworkSvc" start= disabled 

echo WinRM Windows Remote Management WS-Management CHECKREADME
	sc stop "WinRM"
	sc config "WinRM" start= disabled

ehco WinHttpAutoProxySvc WinHTTP Web Proxy Auto-Discovery services
	sc stop "WinHttpAutoProxySvc"
	sc config "WinHttpAutoProxySvc" start= disabled

echo iprip RIP Listner 
	sc stop "iprip"
	sc config "iprip" start= disabled

echo #######################################################################################
echo check these with README especially if on Server
pause

echo Spooler Print Spooler (handles print jobs - allows pc to print)
	sc stop "Spooler"
	sc config "Spooler" start= disabled

echo WebClient WebClient CHECKREADME
	sc stop "WebClient"
	sc config "WebClient" start= disabled

echo NEXT IS DISABLE SERVER REMOVE THIS FROM THE SCRIPT IF YOU ARE NOT ON WINDOWS 10
pause
echo PLEASE BE CAREFUL I AM ABOUT TO DISABLE SERVER SERVICE!
pause 

::Check if RDP is set to enabled as Critical Service or disabled and not needed
REM RDP
color 03
set /p rdpChk="Enable remote desktop (y/n)"
if %rdpChk%==y (
	echo Enabling remote desktop...
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 1 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 1 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 1 /f
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
	netsh advfirewall firewall set rule group="remote desktop" new enable=yes
	echo Please select "Allow connections only from computers running Remote Desktop with Network Level Authentication (more secure)"
	start SystemPropertiesRemote.exe /wait
	echo Enabled remote desktop
)
if %rdpChk%==n (
	echo Disabling remote desktop...
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 0 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
	netsh advfirewall firewall set rule group="remote desktop" new enable=no
	echo Disabled remote desktop
)

