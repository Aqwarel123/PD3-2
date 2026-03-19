$log  = "$env:USERPROFILE\Documents\Servisi.log"
$time = Get-Date

$services = "Spooler", "wuauserv"
foreach($s in $services) {
	$status = (Get-Service $s).Status
	"$time Service $s ir $status" | Out-file $log  -Append}