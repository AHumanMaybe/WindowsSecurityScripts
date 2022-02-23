############################################################################
                        #CyberCrustaceans
                    #Windows User Auditing
############################################################################
################Start Script and Clear Ugly Echoes##########################
cls;

#This is not part of user audits but is for small things i just decided to put in here
Set-MpPreference -DisableRealtimeMonitoring 0

############################Script Starts Here##############################
###########################Create new Password##############################

$Password = Read-Host "Enter the new password: " -AsSecureString;

############################################################################
#############Make adfin and stfin arrays with full user lists###############

$adfin = @();
$stfin = @();

$adlists = Get-LocalGroupMember -Group "Administrators" | select name;
$stlists = Get-LocalUser | select name;

$stlista = $stlists -Split([Environment]::NewLine);
$adlista = $adlists -Split([Environment]::NewLine);
##################################Create adfin#################################
$adCount = $adlista.Count;
$delhead = "$ENV:COMPUTERNAME\";
$delhcount = $delhead.Length;

if($adCount -gt 0){
    do{
        
        $adkeepsingle = $adlista[$adCount - 1];
        $adremove = $adkeepsingle.Substring($delhcount + 7);
        $adremove2 = $adremove.TrimEnd('}');
        #$adrem = $adlista[$adCount - 1];
        #$adrem2 = $adrem.Length;
        $adfin += $adremove2;

        $adCount -= 1;
    }while ($adCount -gt 0)
}
$adfin
################################Create stfin##################################
$stCount = $stlista.Count;
if($stCount -gt 0){
    do{
        
        $strem = $stlista[$stCount - 1];
        $strem2 = $strem.Length;
        $stfin += $strem.Substring(7,$strem2 - 8);

        $stCount -= 1;
    }while ($stCount -gt 0)
}

###################stfin and adfin created and organized#####################
############Compare Admins with adlist and manage############################

$admins = @();

echo $adfin;

$msg = 'Do you want to add a User to the admins list? [Y/N]'
do {
    $response = Read-Host -Prompt $msg
    if ($response -eq 'y') {
        $adto = Read-Host -Prompt 'Please enter the Username: ';
       do {
        $confirm = 'Is the name ' + $adto + ' correct? [Y/N]';
            $resp = Read-Host -Prompt $confirm;
            if ($resp -eq 'n')
            {
                
                $adto = Read-Host -Prompt 'Please enter the Username: ';

                } 
            }until ($resp -eq 'y')
            
            ##########set these users never expire to false and change passwords
                $adto | Set-LocalUser -PasswordNeverExpires:$false;
            $adto | Set-LocalUser -Password $Password;
            ##################################################################
        $admins += $adto;
    }
} until ($response -eq 'n')

$compad = $adfin | Where {$admins -NotContains $_};
' Users that are active but NOT on the provided adfin are: ' + $compad;

#demote all users on adfin that arent on admins
Remove-LocalGroupMember -Group "Administrators" -Member $compad;

#########################Adlist managed######################################
############Compare Stands with stlist and manage############################

$stands = @();

$msgy = 'Do you want to add a User to the standard user list? [Y/N]'
do {
    $respon = Read-Host -Prompt $msgy
    if ($respon -eq 'y') {
        $sto = Read-Host -Prompt 'Please enter the Username: ';
       do {
        $confi = 'Is the name ' + $sto + ' correct? [Y/N]';
            $respo = Read-Host -Prompt $confi;
            if ($respo -eq 'n')
            {
                
                $sto = Read-Host -Prompt 'Please enter the Username: ';

                } 
            }until ($respo -eq 'y')

            ##########set these users never expire to false and change passwords
                $sto | Set-LocalUser -PasswordNeverExpires:$false;
            $sto | Set-LocalUser -Password $Password;
            ##################################################################
        $stands += $sto;
    }
} until ($respon -eq 'n')

$compst = $stfin | Where {$stands -NotContains $_};
' Users that are active but NOT on the provided stfin are: ' + $compst;

echo 'Please ensure that the above list is ABSOLUTELY CORRECT before continuiting'
echo 'TAKE A PICTURE OF THIS LIST IN CASE ANY OF THEM ARE WRONG'
pause;
pause;
pause;
Remove-LocalUser -Name $compst;

############################Stlist managed###################################
##########################Create Users#######################################

$UserMake = @();

$mesag = 'Do you want to add a User to the Users to make list? [Y/N]'
do {
    $Makeresp = Read-Host -Prompt $mesag
    if ($Makeresp -eq 'y') {
        $usmto = Read-Host -Prompt 'Please enter the Username: ';
       do {
        $confirm = 'Is the name ' + $usmto + ' correct? [Y/N]';
            $respom = Read-Host -Prompt $confirm;
            if ($respom -eq 'n')
            {
                
                $Makeresp;

                } 
            }until ($respom -eq 'y')
        $UserMake += $usmto;
    }
} until ($Makeresp -eq 'n')


New-LocalUser -Name $UserMake -Password $Password -PasswordNeverExpires:$false;
echo $UserMake + ' was added to standard users list and given password was set to expire';

#################################Users Created###############################
###################################Script End################################

echo 'Users Removed: ' + $compst;
echo '#################################################################';
echo '#################################################################';
echo 'Users Demoted: ' + $compad;
echo 'Thats the end of the script, goodluck...';
pause;
