# Get-ExchangeMailboxSizes
Gets mailbox sizing information for users from a CSV file, and outputs it into a formatted CSV.

### Usage:
```
Get-ExchangeMailboxSizes -UserCSV {CSV with User Info} -OutCSV {Output CSV}
```
Note that this command must be run from within the Exchange Management Shell.

The CSV File should be a list of usernames only, with the heading row "Users"
eg.

```
Users
ray.maher
vanessa.amorosi
darryl.somers
ray.martin
bert.newton
```
Note: User names can be either SamAccountName or UPN

### Requires:
* Microsoft Exchange Management Shell access

### Example 1:
This example will grab all users from Mailboxes.CSV and creates a CSV for those mailboxes with Size information
```
Get-ExchangeMailboxSizes -UserCSV C:\Temp\Mailboxes.CSV -OutCSV C:\Temp\MailboxSizes.CSV
```

### Notes
* N/a
