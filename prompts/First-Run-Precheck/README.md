# First-run Precheck prompt

This prompt issues a report about whether an Office Add-in contains a first-run experience as required by Micrososft Marketplace. 

## Applies to

- Office add-ins

## Prerequisites

Either GitHub Copilot CLI or another AI environment/interface that can do the following:

- Open a zip file and read the files in it.
- Get a file from an HTTP(S) URL and read it.
- Write a file and save it to the local computer.

To install GitHub Copilot (including the CLI) enter the following in a Command Prompt, terminal, or bash shell.

```bash
npm install -g @github/copilot
```

## Use the tool

1.	Clone or download the Office-Developer-AI-Tools repo, or download just the prompt file, `FirstRunPrecheck.md`.
2.	Start the add-in's web application. It can be hosted on localhost or remotely. It is not necessary to install or sideload the add-in, but doing so is a good way to verify that the web application is running.
3.	Start your AI environment or interface. For GitHub Copilot CLI, open a Command Prompt, terminal, or bash shell, and run `copilot`. 
4.	When GitHub Copilot CLI (or preferred AI environment) has finished starting up, prompt it to use the `FirstRunPrecheck.md` to examine the add-in for compliance. You’ll need to provide the paths to both the instruction file and the app package zip file. (If you’re sideloading an add-in created with Microsoft 365 Agent Toolkit or with Yo Office, the app package file will be at `C:\Users\{YOUR-ID}\AppData\Local\Temp\manifest.zip`.)

    The following is an example:

    ```text
    Using the instructions in the file C:\Office-Dev-AI-Tools\prompts\First-Run-Precheck\FirstRunPrecheck.md, evaluate whether the Office add-in in the package file C:\Users\{YOUR-ID}\\AppData\Local\Temp\manifest.zip complies with the requirement that it have a first-run experience.
    ```

5.	Your AI environment may prompt you to grant it permissions. GitHub Copilot CLI will prompt you several times to approve its actions. Select `Yes` for all of them.
6.	GitHub Copilot will present its report to the screen and ask you to approve saving it. If you select `Yes`, then the report file `FirstRunReport.md` is saved in the same folder where the app package is (e.g. C:\Users\{YOUR-ID}\\AppData\Local\Temp).

## Solution

Tool | Author(s)
---------|----------
First-run Precheck prompt | Microsoft

## Version history

Version  | Date | Comments
---------| -----| --------
1.0  | July 29th 2026 | Initial release

<img src="https://pnptelemetry.azurewebsites.net/pnp-officeaddins/prompts/First-Run-Precheck" />