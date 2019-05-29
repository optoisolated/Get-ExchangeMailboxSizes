# Get-ExchangeMailboxSizes
Gets mailbox sizing information for users from a CSV file, and outputs it into a formatted CSV.

### Usage:
```
Get-ExchangeMailboxSizes
```
Note that this command must be run from within the Exchange Management Shell.

### Requires:
* Microsoft Exchange Management Shell access

### Example 1:
This example will grab all users from Mailboxes.CSV and creates a CSV for those mailboxes with Size information
```
Get-ExchangeMailboxSizes -UserCSV C:\Temp\Mailboxes.CSV -OutCSV C:\Temp\MailboxSizes.CSV
```

### Notes
* N/a
