$computers = Get-Content "C:\computer.txt"

foreach ($computer in $computers) {
    #The location of the file
    $Install = "\\$computer\C$\Software"

    #The Install string can have commands aswell
    $InstallString = "$Install\yourinstaller.exe"

    ([WMICLASS]"\\$computer\ROOT\CIMV2:Win32_Process").Create($InstallString)

    #Output the install result to your Local C Drive
    Out-File -FilePath c:\installed.txt -Append -InputObject "$computer"
}
