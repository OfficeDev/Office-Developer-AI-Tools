# Pin online meeting add-ins to the ribbon

This script pins online meeting add-ins to the ribbon in Outlook on Mac to make them easier to discover.

The script includes the Zoom and Cisco Webex add-ins as examples. It doesn't install, enable, or configure either add-in.

## Applies to

- Outlook on Mac
- Outlook online meeting add-ins

## Prerequisites

- Outlook on Mac
- Online meeting add-in must be installed on the target user's mailbox
- If you're using an account or management agent to run the script, ensure that the agent can use `sudo` to run commands as the signed-in user.

The script uses macOS utilities included with the operating system, including Zsh, `scutil`, `dscl`, and `PlistBuddy`. No additional packages are required.

## Configure the script

The script pins Zoom and Cisco Webex by adding their command identifiers to `ToolbarCustomization_CalendarEventEditorToolView_Preference`:

```zsh
AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "a7ca6c74-33fb-43a4-a3e4-781078f0eff5-msgReadGroup" "$OUTLOOK_PREFS" # Zoom
AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "7a91e319-a65d-4ceb-909b-12203561dbf5-apptOrganizerCommandGroup" "$OUTLOOK_PREFS" # Cisco Webex
```

Remove any entry that your organization doesn't use. To pin another online meeting add-in, obtain its identifier from the add-in manifest and add another `AddToolbar` call using the same preference name.

> [!TIP]
> Test the add-in identifiers with a representative account before broad deployment.

## Use the tool

1. Sign in to the Mac as the user whose Outlook ribbon will be updated.
1. Open Outlook at least once, and then close Outlook completely.
1. Download the script to your preferred directory on the computer.
1. Open Terminal and change to the directory containing the script.
1. Run the script with administrator privileges.

   ```zsh
   sudo /bin/zsh pin-online-meeting-add-in-to-ribbon.zsh
   ```

1. Open Outlook, create a new calendar event, and verify that the expected online meeting add-in commands appear on the ribbon.

Run the script once on each Mac where you want to configure the ribbon. For managed deployment, run it as a device script while the target user is signed in and Outlook is closed. The script detects the signed-in user and updates that user's Outlook preferences.

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