
#Download the OpenScap 1.3.0 version
$url = "https://github.com/OpenSCAP/openscap/releases/download/1.3.0/OpenSCAP-1.3.0-win32.msi"
$output = "C:\\OpenSCAP-1.3.0-win32.msi"
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
$webClient = new-object System.Net.WebClient
$webClient.DownloadFile($url,$output)
#Install the OpenScap tool
Start-Process $output -ArgumentList "/q" -Wait
#Generate report
$reportPath = "C:\\report.html"
oscap xccdf eval --profile WS2012R2_Member_Server_Security_Compliance --report $reportPath --cpe "C:\Program Files (x86)\OpenSCAP 1.3.0\ws2012-xccdf\WS2012R2 Member Server Security Compliance-cpe-dictionary.xml" "C:\Program Files (x86)\OpenSCAP 1.3.0\ws2012-xccdf\WS2012R2 Member Server Security Compliance-xccdf.xml"
