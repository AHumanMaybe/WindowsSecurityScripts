# WindowsSecurityScripts
This Project has Scripts aimed at making Windows 10 and Windows Server systems more secure

These were all created for the CyberCrustaceans team

Test all scripts before use!

# LittleBoy.ps1

Requires run as Administrator

Powershell script designed to provide quick and easy user auditing for Windows systems

LittleBoy uses user input combined with lists of current system users to create a list of users who are allowed to be on the Windows system

LittleBoy will manage all users through their user types, deleting/creating users, passwords, and setting passwords do not expire to FALSE

Follow all instructions through script and complete tests prior to serious use to fully understand script's ability

# FatMan.bat

Requires run as Administrator

Batch script designed to provide complete Windows security

FatMan is over 1200 lines long with optional commented out settings for further security

FatMan configures settings for the Windows Registry, SecPol, GPEdit, Windows Auto Updates, BitLocker, Password Policies, Account Policies, User Rights Assignments, and much more

FatMan will have multiple prompts for Y/N as well as many instructions and in-script reminders to check specific settings prior to running

# Services.bat

Requires run as Administrator

Batch script designed to manage Windows Services

Services script is deisnged to configure most default windows services and sets them to either Disabled, Manual, or Automatic based on AFA guidelines found to be used in their CyberPatriot competition

# ChocoChip.ps1

Requires run as Administrator

Powershell script designed to manage unwanted and wanted programs

Choco is not ideal but works 70% of the time

Best paired with a Ninite Pro client
