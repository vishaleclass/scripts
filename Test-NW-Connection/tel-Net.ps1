# ⚠️ This is not reliable as telnet doesn’t provide consistent output or exit codes. #
# Make sure to enable Set-ExecutionPolicy
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Checking the network connectivity with multiple servers using Telnet

# List of IP addresses
# You can also load this from a file. Create a new file called ips.txt 
#$ipList = Get-Content -Path ".\ips.txt"

$ipList = @("192.168.1.1", "10.0.0.1", "172.16.0.1")
$port = 8080

foreach ($ip in $ipList) {
    $telnet = "telnet $ip $port"
    $process = Start-Process -FilePath "cmd.exe" -ArgumentList "/c", $telnet -NoNewWindow -Wait -PassThru
    if ($process.ExitCode -eq 0) {
        Write-Output "$ip is accessible on port $port"
    } else {
        Write-Output "$ip is NOT accessible on port $port"
    }
}
