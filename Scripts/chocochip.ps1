############################################################################################
                                #Chocolatey Script
                                #Made for Cybercrustaceans
                                #Made for Windows systems
############################################################################################
cls;

Set-ExecutionPolicy AllSigned

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

#TeamViewer teamviewer - handle with Ninite
$install = @('everything');
$uninstall = @('osquery', 'dosbox', 'runescape', 'steam-client', 'advanced-port-scanner', 'nmap', 'angryip', 'anydesk', 'anydesk.install', 'anydesk.portable', 'bitcomet', 'qbittorrent', 'epicgameslauncher', 'itunes', 'k-litecodecpackfull', 'k-litecodecpackmega', 'k-litecodecpack-standard', 'k-litecodecpackbasic', 'kodi', 'plexmediaserver', 'radmin-server', 'tetris-java', 'tonido-server', 'utorrent', 'wireshark', 'zap');
$update = @('firefox');

#foreach individual value in uninstall set to uninstsingle and send each value of the array into this
foreach($unintSingle in $uninstall)
{
    choco uninstall $unintSingle -y;
    echo 'uninstalled' + $unintSingle;
}
#Same but install
foreach($instSingle in $install)
{
    choco install $instSingle -y;
} 
#Same but update
foreach($updSingle in $update)
{
    choco upgrade $updSingle -y;
}
echo 'program managment script complete...';
pause;
