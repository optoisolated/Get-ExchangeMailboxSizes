Param(
    [string]$UserCSV = $(throw "-UserCSV is required."),
    [string]$OutCSV = $(throw "-OutCSV is required.")
)

$Users = Import-CSV $UserCSV 
$SizingDump = @()

ForEach ($User in $Users) {
    $UserSizing = Get-Mailbox -Identity $($User.User) | Get-MailboxStatistics | `
    Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount
    $SizingDump += $UserSizing
}

$SizingDump | Out-File $OutCSV
