Param(
    [string]$UserCSV = $(throw "-UserCSV is required."),
    [string]$OutCSV = $(throw "-OutCSV is required.")
)

CLS

$Users = Import-CSV $UserCSV 
$SizingDump = @()

ForEach ($User in $Users) {
    $UserName = $User.User
    "Checking $Username"
    $UserSizing = Get-Mailbox -Identity $Username | Get-MailboxStatistics | Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount
    $SizingDump += $UserSizing
}

$SizingDump | Export-CSV $OutCSV
