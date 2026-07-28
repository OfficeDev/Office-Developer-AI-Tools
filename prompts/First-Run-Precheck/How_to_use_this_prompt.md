# How to use the FirstRunPrecheck.md prompt

This prompt issues a report about whether an Office Add-in contains a first-run experience as required by Micrososft Marketplace. 

1.	Clone or download the Office-Add-in-Samples repo, or download just the prompt file, `FirstRunPrecheck.md`.
2.	Start the add-in's web application. It can be hosted on localhost or remotely. It is not necessary to install or sideload the add-in, but doing so is a good way to verify that the web application is running.
3.	Open a Command Prompt, terminal, or bash shell, and run `copilot`. 
4.	When Copilot CLI has finished starting up, prompt it to use the `FirstRunPrecheck.md` to examine the add-in for compliance. You’ll need to provide the paths to both the instruction file and the app package zip file. (If you’re sideloading an add-in created with Microsoft 365 Agent Toolkit or with Yo Office, the app package file will be at `C:\Users\{YOUR-ID}\AppData\Local\Temp\manifest.zip`.)

    The following is an example:

    ```text
    Using the instructions in the file C:\Office-Add-in-Samples\\Office-Dev-AI-Tools\prompts\First-Run-Precheck\FirstRunPrecheck.md, evaluate whether the Office add-in in the package file C:\Users\{YOUR-ID}\\AppData\Local\Temp\manifest.zip complies with the requirement that it have a first-run experience.
    ```

5.	Copilot CLI will prompt you several times to approve its actions. Select `Yes` for all of them.
6.	It will present its report to the screen and ask you to approve saving it. If you select `Yes`, then the report file `FirstRunReport.md` is saved in the same folder where the app package is (e.g. C:\Users\{YOUR-ID}\\AppData\Local\Temp).

AI tools can 2