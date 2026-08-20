# Contribute

This project welcomes contributions and suggestions. Most contributions require you to
agree to a Contributor License Agreement (CLA) declaring that you have the right to,
and actually do, grant us the rights to use your contribution. For details, visit
https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need
to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the
instructions provided by the bot. You will only need to do this once across all repositories using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Typos, issues, bugs and contributions

When you submit changes to this repository, please follow these recommendations.

* Always fork the repository to your own account for applying modifications.
* Don't combine multiple changes in one pull request. Please submit separate PRs for each fix, update, or new sample.
* If you are submitting a typo or documentation fix, you can combine modifications in a single PR where suitable.

## Submission guidelines

When you are submitting a new prompt, skill, or other tool, use the following guidelines.

### Check for existing tools
If you find a similar tool that already exists in the repository, we would prefer that you extend the existing one, rather than submit a new similar tool.

### Name the solution
When you are submitting a new tool, please name the tool folder accordingly.

* The tool folder should be under the appropriate folder of this repository, given the type of tool, such as the **/prompts** folder.
* Folder name should brief and descriptive. 
* Do not use a period in the folder name of the provided tool.

### Create a README.md file
Create a README file for your tool with instructions to humans for how to use the tool. Put it in the tool's folder. It must be named README.md, with upper case letters for the main filename. Use the template at \repo-templates\readme-template.md.

### Update tracking image
The README template contains specific tracking image as a final entry in the page with img tag by default to https://pnptelemetry.azurewebsites.net/pnp-officeaddins//{tool-type-folder}/{name-of-tool}. This is transparent image, which is used to track anonymous view counts of individual samples in GitHub. Update the image `src` attribute according to correct folder information. For example, if your sample is **/prompts** folder and named as "my-ai-tool", the `src` attribute should be updated as https://pnptelemetry.azurewebsites.net/pnp-officeaddins/prompts/my-ai-tool.

### Update the main README
Update this repo's main README.md file to list your tool in the appropriate section and table. 

## Add your tool to a pull request

Use the following steps to submit a pull request for your new code sample.

1. Fork this repository [OfficeDev/Office-Developer-Tools](https://github.com/OfficeDev/Office-Developer-Tools) to your GitHub account.
2. Create a new branch off the `main` branch for your fork for the contribution.
3. In the new branch, create the folder for your new tool using the previous naming guidelines.
4. Add your tool files and README.md to the folder.
5. Commit the new code using descriptive commit message. Commit messages are used to track changes on the repositories for monthly communications.
6. Push the changes up to your fork.
7. Create a pull request in your own fork and target the `main` branch on OfficeDev org.
8. Provide a full description of the tool to help reviewers evaluate it.

> **Note:** If you haven't signed a contributor license agreement (CLA), then you will automatically be asked to sign a CLA as part of submitting the PR.

When you submit your pull request, our team will review it. You will receive notifications about your pull request from GitHub; you may also be notified by someone from our team if we need more information. We reserve the right to edit your submission for legal, style, clarity, or other issues.

If you need help keeping your fork in sync with the original repository, see [GitHub Help: Syncing a Fork](https://help.github.com/articles/syncing-a-fork/).

## Additional guidelines

Before you submit your pull request, consider the following guidelines.

* Search [GitHub](https://github.com/OfficeDev/Office-Developer-Tools/pulls) for an open or closed pull request
  that relates to your submission. You don't want to duplicate effort.

* Make sure you have a link in your local cloned fork to the [OfficeDev/Office-Developer-Tools](https://github.com/OfficeDev/Office-Developer-Tools) repository.

  ```shell
  # check if you have a remote pointing to the Microsoft repository
  git remote -v

  # if you see a pair of remotes (fetch & pull) that point to https://github.com/OfficeDev/Office-Developer-Tools, you're ok... otherwise you need to add one

  # add a new remote named "upstream" and point to the Microsoft repository
  git remote add upstream https://github.com/OfficeDev/Office-Developer-Tools.git
  ```

* Make your changes in a new git branch.

  ```shell
  git checkout -b my-ai-tool main
  ```

* Ensure your fork is updated and not behind the upstream **Office-Developer-Tools** repository. Refer to these resources for more information on syncing your repository:
  * [GitHub Help: Syncing a Fork](https://help.github.com/articles/syncing-a-fork/)
  * [Keep Your Forked Git Repo Updated with Changes from the Original Upstream Repo](http://www.andrewconnell.com/blog/keep-your-forked-git-repo-updated-with-changes-from-the-original-upstream-repo)
  * For a quick cheat sheet:

    ```shell
    # assuming you are in the folder of your locally cloned fork....
    git checkout main

    # assuming you have a remote named `upstream` pointing to the official Office-Developer-Tools repository
    git fetch upstream

    # update your local main to be a mirror of what's in the main repository
    git pull --rebase upstream main

    # switch to your branch where you are working, say "my-ai-tool"
    git checkout my-ai-tool

    # update your branch to update it's fork point to the current tip of main & put your changes on top of it
    git rebase main
    ```

* Push your branch to GitHub.

  ```shell
  git push origin my-ai-tool
  ```

## Merging your existing Github projects with this repository

If the tool you wish to contribute is stored in your own Github repository, you can use the following steps to merge it with the this repository.

1. Fork the **Office-Developer-Tools** repository from GitHub.

1. Create a local git repository.

    ```shell
    md Office-Developer-Tools
    cd Office-Developer-Tools
    git init
    ```

1. Pull your forked copy of **Office-Developer-Tools** into your local repository.

    ```shell
    git remote add origin https://github.com/yourgitaccount/Office-Developer-Tools.git
    git pull origin main
    ```

1. Pull your other project from Github into the samples folder of your local copy of the Office-Developer-Tools repository.

    ```shell
    git subtree add --prefix=samples/projectname https://github.com/yourgitaccount/projectname.git main
    ```

1. Push the changes up to your forked repository

    ```shell
    git push origin main
    ```

Thank you for your contribution!
