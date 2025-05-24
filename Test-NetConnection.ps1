#Checking the network connectivity with multiple servers using powershell script

# List of IP addresses
# You can also load this from a file. Create a new file called ips.txt 
#$ipList = Get-Content -Path ".\ips.txt"

$ipList = @(
    "192.168.1.1",
    "10.0.0.1",
    "172.16.0.1"
)

#Enter the port number
$port = 8080

foreach ($ip in $ipList) {
    $result = Test-NetConnection -ComputerName $ip -Port $port
    if ($result.TcpTestSucceeded) {
        Write-Output "$ip is accessible on port $port"
    } else {
        Write-Output "$ip is NOT accessible on port $port"
    }
}
