# Windows Development Environment

## Installation

### Prepare your Windows host ⏲

#### **This playbook was tested on Windows 10 2004 and Windows 11 21H2 (Pro, Ent). Other versions may work but have not tried.**

Copy and paste the code below into your PowerShell terminal to get your Windows machine ready to work with Ansible.

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/AlexNabokikh/windows-playbook/master/setup.ps1"
$file = "$env:temp\setup.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose
```

```powershell
winrm get winrm/config/ServiceWSManFault

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file
winrm get winrm/config/Service
winrm get winrm/config/Winrs

Enable-WSManCredSSP -Role Server -Force
```

### Ansible Control node 🕹

```shell
python3 -m pip install -r ./requirements.txt
ansible-galaxy install -r requirements.yml
```

```shell
echo -n "s3cret" > ~/vault_password.txt
ansible-playbook -v site.yaml --vault-password-file ~/vault_password.txt
```
