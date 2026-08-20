# First-run Precheck prompt

This prompt issues a report about whether an Office Add-in contains a first-run experience as required by Micrososft Marketplace. 

## Applies to

- Office add-ins

## Prerequisites

Either GitHub Copilot or another AI environment/interface that can do the following:

- Open a zip file and read the files in it.
- Get a file from an HTTP(S) URL and read it.
- Write a file and save it to the local computer.

To install GitHub Copilot enter the following in a Command Prompt, terminal, or bash shell.

```bash
npm install -g @github/copilot
```

## Use the tool

1.	Clone or download the Office-Developer-Tools repo, or download just the prompt file, `FirstRunPrecheck.md`.
2.	Start the add-in's web application. It can be hosted on localhost or remotely. If you start it with the F5 key in Microsoft 365 Agent Toolkit, or by running `npm start` in an ATK terminal, a command prompt, a bash shell, or Mac Terminial, then the next step is done for you.
3.	Use a ZIP utility to zip up the manifest and other app package files into an app package file. 
4.	Start your AI environment or interface. For GitHub Copilot chat, open **View** -> **Chat** in Visual Studio Code. For GitHub Copilot CLI, open a Command Prompt, terminal, or bash shell, and run `copilot`.
5.	When GitHub Copilot (or preferred AI environment) has finished starting up, prompt it to use the `FirstRunPrecheck.md` to examine the add-in for compliance. You’ll need to provide the paths to both the instruction file and the app package zip file.

    > NOTE: If you’re sideloading an add-in created with Microsoft 365 Agent Toolkit or with Yo Office on a Windows computer, the app package file will be at `C:\Users\{YOUR-ID}\AppData\Local\Temp\manifest.zip`. 

    The following is an example:

    ```text
    Using the instructions in the file C:\Office-Developer-Tools\prompts\First-Run-Precheck\FirstRunPrecheck.md, evaluate whether the Office add-in in the package file C:\Users\{YOUR-ID}\AppData\Local\Temp\manifest.zip complies with the requirement that it have a first-run experience.
    ```

7.	Your AI environment may prompt you to grant it permissions. GitHub Copilot prompts you several times to approve its actions. Select `Yes\Allow` for all of them.
8.	GitHub Copilot will present its report to the screen and ask you to approve saving it. If you select `Yes\Allow`, then the report file `FirstRunReport.md` is saved in the current folder, unless you specified a different path in the prompt.

## Solution

Tool | Author(s)
---------|----------
First-run Precheck prompt | Microsoft

## Version history

Version  | Date | Comments
---------| -----| --------
1.0  | July 29th 2026 | Initial release

<img src="https://pnptelemetry.azurewebsites.net/pnp-officeaddins/prompts/First-Run-Precheck" />
