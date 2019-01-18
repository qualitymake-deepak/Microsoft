Function New-File(
    [Parameter(Mandatory=$true)]
    [string] $FileName
)
{
New-Item -Path C:\\ -Name $FileName  -ItemType file
}
