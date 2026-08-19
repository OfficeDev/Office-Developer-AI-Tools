# Pin online meeting add-ins to the ribbon

This script pins online meeting add-ins to the ribbon in Outlook on Mac to make them easier to find. It's intended for administrators who manage multiple Macs.

The script includes the Zoom and Cisco Webex add-ins as examples. It doesn't install, enable, or configure either add-in.

## Applies to

- Outlook on Mac
- Outlook online meeting add-ins

## Prerequisites

- For the most reliable results, Outlook should have been opened at least once for the target user. If it hasn't, the script still writes to the user preference file, but the setting should be verified after Outlook's first launch.
- The online meeting add-in must be installed on the target user's mailbox.
- A valid user must be signed in at the Mac console when the script runs.
- Outlook must be closed when the script runs to prevent it from overwriting the updated preferences when it exits.
- Your device management platform must run the script as `root`. The script uses `sudo -u` to write preferences as the signed-in user.

The script uses macOS utilities included with the operating system, including Zsh, `scutil`, `dscl`, and `PlistBuddy`. No additional packages are required.

## Configure the script

The script pins Zoom and Cisco Webex by adding their command identifiers to `ToolbarCustomization_CalendarEventEditorToolView_Preference`:

```zsh
AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "a7ca6c74-33fb-43a4-a3e4-781078f0eff5-msgReadGroup" "$OUTLOOK_PREFS" # Zoom
AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "7a91e319-a65d-4ceb-909b-12203561dbf5-apptOrganizerCommandGroup" "$OUTLOOK_PREFS" # Cisco Webex
```

Remove any entry that your organization doesn't use. To pin another online meeting add-in, get its identifier from the add-in manifest and add an `AddToolbar` call that uses the same preference name.

> [!TIP]
> Test the add-in identifiers with a representative account before broad deployment.

## Test the tool

Before deploying the script broadly, test it with an individual account.

1. Sign in to the Mac as the user whose Outlook ribbon will be updated.
1. Open Outlook at least once, and then close Outlook completely.
1. Download the script to your preferred directory on the Mac.
1. Open Terminal and change to the directory containing the script.
1. Run the script with administrator privileges.

   ```zsh
   sudo /bin/zsh pin-online-meeting-add-in-to-ribbon.zsh
   ```

1. Open Outlook, create a new calendar event, and verify that the expected online meeting add-in commands appear on the ribbon.

## Deploy the tool

Use the mobile device management (MDM) or remote monitoring and management (RMM) platform that already manages the Mac devices in your organization. The script has no dependency on a specific product.

An MDM or RMM agent can deliver and run the script over the internet as `root`. The recommended workflow is:

1. Upload the customized script to your management platform.
1. Assign the script to a smart group or device group containing the target Macs.
1. Run the script as `root` after user sign-in or during a recurring check-in.
1. Configure the platform to run the script again if it returns exit status `1`. This allows a run that occurs at the login window to be attempted again after a user signs in.
1. Use the platform's execution logs and device status for deployment reporting.

For examples of platform-specific instructions, see [Use Shell Scripts on macOS Devices in Microsoft Intune](https://learn.microsoft.com/intune/device-management/tools/run-shell-scripts-macos) and [Managing scripts in Jamf Pro](https://learn.jamf.com/r/jamf-pro-documentation-current/Scripts).

Remote execution doesn't remove the signed-in user requirement. The script identifies the current console user and modifies only that user's Outlook preferences. For unattended deployment, schedule the script to run after sign-in and before Outlook normally opens, or use a recurring policy so that it runs while Outlook is closed. The script doesn't display prompts or require user input.

## Validate the deployment

The management platform's deployment log should show which preference file the script used and which add-in command it added. For example:

```text
Outlook preferences file found in container
INFO: Adding <add-in-command-identifier> to toolbar ToolbarCustomization_CalendarEventEditorToolView_Preference in <preferences-file>
```

If Outlook hasn't created its container preference file, the log reports `Using Outlook preferences file in user object` instead. If the command is already configured, the script reports that it already exists and exits successfully.

For a functional check, open Outlook, create a new calendar event, and confirm that the expected online meeting add-in commands appear on the ribbon.

## Key parts of the script

- `GetLoggedInUser` identifies and validates the signed-in user.
- `SetHomeFolder` resolves that user's home directory without evaluating shell input.
- `CheckToolbarExistence` checks whether the New Event ribbon preference array exists.
- `AddToolbar` creates a missing array and adds the online meeting add-in command only when it isn't already present.
- The main section selects Outlook's container preference file when available and otherwise uses the preference file in the user's Library folder.

The script modifies only the New Event ribbon. If its preference array doesn't exist, the script initializes it with Outlook's standard event commands before adding the online meeting add-ins. If the array already exists, the script preserves its commands and adds only missing add-in entries. Existing entries aren't duplicated.

## Solution

| Tool                                         | Author(s) |
| -------------------------------------------- | --------- |
| Pin online meeting add-ins to the ribbon     | Microsoft |

## Version history

Version | Date | Comments
--------- | ----- | --------
1.0 | August 19, 2026 | Initial release

<img src="https://pnptelemetry.azurewebsites.net/pnp-officeaddins/non-ai-tools/outlook-pin-online-meeting-add-ins" />