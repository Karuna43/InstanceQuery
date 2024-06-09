param(
    [Parameter(Mandatory=$true)]
    [string]$data_key
)
 
try {
    $metadata = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "http://169.254.169.254/metadata/instance/$($data_key)?api-version=2021-01-01" | ConvertTo-Json -Depth 64
    Write-Output $metadata
} catch {
    Write-Error "Error retrieving metadata: $_"
}