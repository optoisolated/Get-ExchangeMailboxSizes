Param(
    [string]$UserCSV = $(throw "-UserCSV is required."),
    [string]$OutCSV = $(throw "-OutCSV is required.")
)

Import-CSV $UserCSV | `
Get-Mailbox -Identity $_.User | `
Get-MailboxStatistics | `
Select-Object DisplayName, @{name=”TotalItemSize (GB)”;expression={[math]::Round((($_.TotalItemSize.Value.ToString()).Split(“(“)[1].Split(” “)[0].Replace(“,”,””)/1GB),2)}},ItemCount | `
Sort “TotalItemSize (GB)” -Descending | `
Export-CSV $OutCSV
