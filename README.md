# Autowin

> Under Construction 🚧

A PowerShell executable to automatically set up my development environment on a new Windows (10 or 11) desktop system.

## Usage

WARNING ⚠️: This script package is still under active development and NOT YET RELEASED for production use.

Proceed at your own risk.

Currently, privilege elevation needs to be done manually (working on it).

- From unprivileged PowerShell, for convenience, start a privileged one.

```powershell
Start-Process PowerShell -Verb runAs
```

- Then, execute the script

```powershell
PowerShell -ExecutionPolicy Bypass -File .\main.ps1
```
