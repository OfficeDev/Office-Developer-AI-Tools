# Office Developer AI Tools

This repo holds extended prompts, skills, agents, actions, and other tools that can be used in GitHub Copilot and other AI applications to aid in developing add-ins and other extensions of Office.

## Extended Prompts

**Note**: The prompts in this repo are substantial. For some helpful, brief prompts, see [Office Add-ins prompts for GitHub Copilot](https://learn.microsoft.com/office/dev/add-ins/resources/resources-github-copilot-prompt-library).

The prompts listed in the table below are tested with one or more of Copilot, Microsoft 365 Copilot, or GitHub Copilot, except where specified otherwise. They should work also in any AI tool that supports the required abilities listed.

Each prompt is in a folder that includes a file of instructions for the human user of the prompt, as well as one or more other files that are consumed by the AI tool.

| Prompt | Purpose | Required Abilities | Supported By | Not Supported By |
|--------|---------|-------------------|--------------|-----------------|
| [First-run Precheck](https://github.com/OfficeDev/Office-Developer-AI-Tools/tree/main/prompts/First-Run-Precheck) | Issues a report about whether an Office Add-in contains a first-run experience as required by Microsoft Marketplace. | <Ul><li>Open a zip file and read the files in it.</li><li>Obtain files from web URLs and read them.</li><li>Write a file and save it to the local computer.</li></ul> | GitHub Copilot chat and CLI | Windows Copilot and Microsoft 365 chat interfaces |



