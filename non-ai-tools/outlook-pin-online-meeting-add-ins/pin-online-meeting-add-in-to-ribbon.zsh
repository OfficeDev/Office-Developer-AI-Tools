#!/bin/zsh
# set -x

## Copyright (c) 2026 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.

GetLoggedInUser() {
    LOGGEDIN=$(/bin/echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/&&!/loginwindow/{print $3}')
    if [[ -z "$LOGGEDIN" || "$LOGGEDIN" == "root" || "$LOGGEDIN" == "loginwindow" ]]; then
        echo "ERROR: No valid logged-in user was found" >&2
        return 1
    fi
    if ! /usr/bin/id "$LOGGEDIN" >/dev/null 2>&1; then
        echo "ERROR: Logged-in user '$LOGGEDIN' does not exist" >&2
        return 1
    fi
    echo "$LOGGEDIN"
}

SetHomeFolder() {
    HOME=$(/usr/bin/dscl . -read "/Users/$1" NFSHomeDirectory 2>/dev/null | /usr/bin/awk -F ': ' '/NFSHomeDirectory/ { print $2; exit }')
    if [[ -z "$HOME" || ! -d "$HOME" ]]; then
        echo "ERROR: Could not resolve a valid home folder for '$1'" >&2
        return 1
    fi
}

CheckToolbarExistence() {
    VIEW="$1"
    FILE="$2"
    /usr/bin/sudo -u "$LoggedInUser" -- /usr/libexec/PlistBuddy -c "print $VIEW" "$FILE" | /usr/bin/grep -q "Array"
    echo "$?"
}

AddToolbar() {
    VIEW="$1"
    VALUE="$2"
    FILE="$3"
    # Check to see if the toolbar preference exists
    /usr/bin/sudo -u "$LoggedInUser" -- /usr/libexec/PlistBuddy -c "print $VIEW" "$FILE" | /usr/bin/grep -q "Array"
    if [ $? = 1 ]; then
        # The toolbar preference doesn't exist, so let's create it
        /usr/bin/sudo -u "$LoggedInUser" -- /usr/libexec/PlistBuddy -c "add $VIEW array" "$FILE"
    fi
    # Check to see if the specified value already exists in the toolbar
    /usr/bin/sudo -u "$LoggedInUser" -- /usr/libexec/PlistBuddy -c "print $VIEW" "$FILE" | /usr/bin/grep -q "$VALUE"
    if [ $? = 1 ]; then
        # The value doesn't already exist, so let's add it
        echo "INFO: Adding $VALUE to toolbar $VIEW in $FILE"
        /usr/bin/sudo -u "$LoggedInUser" -- /usr/libexec/PlistBuddy -c "add :$VIEW: string $VALUE" "$FILE"
    else
        echo "INFO: $VALUE already exists in toolbar $VIEW"
    fi
}

## Main
if ! LoggedInUser=$(GetLoggedInUser); then
    exit 1
fi
if ! SetHomeFolder "$LoggedInUser"; then
    exit 1
fi

## Constants
OUTLOOK_CONTAINER_PREFS="$HOME/Library/Containers/com.microsoft.Outlook/Data/Library/Preferences/com.microsoft.Outlook.plist"
OUTLOOK_USER_PREFS="$HOME/Library/Preferences/com.microsoft.Outlook.plist"

# Check to make sure Outlooks preferences have been created in the container (that is, Outlook has been run at least once).
if [ -f "$OUTLOOK_CONTAINER_PREFS" ]; then
    echo "Outlook preferences file found in container"
    OUTLOOK_PREFS="$OUTLOOK_CONTAINER_PREFS"
else
    echo "Using Outlook preferences file in user object"
    OUTLOOK_PREFS="$OUTLOOK_USER_PREFS"
fi

# CalendarEventEditorToolView refers to the ribbon shown while in event compose mode.
CalendarEventEditorToolViewExists=$(CheckToolbarExistence "ToolbarCustomization_CalendarEventEditorToolView_Preference" "$OUTLOOK_PREFS")
if [ "$CalendarEventEditorToolViewExists" = 1 ]; then
    echo "New Event ribbon preferences do not exist. Creating"
    AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "freeBusy" "$OUTLOOK_PREFS"
    AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "togglePrivateEvent" "$OUTLOOK_PREFS"
    AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "attendeeOptions" "$OUTLOOK_PREFS"
    AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "showScheduleAssistant" "$OUTLOOK_PREFS"
    AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "attach" "$OUTLOOK_PREFS"
fi

# Custom entries for online meeting add-ins using their unique identifiers. Add your preferred online meeting add-ins in this section.
AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "a7ca6c74-33fb-43a4-a3e4-781078f0eff5-msgReadGroup" "$OUTLOOK_PREFS" # Zoom
AddToolbar "ToolbarCustomization_CalendarEventEditorToolView_Preference" "7a91e319-a65d-4ceb-909b-12203561dbf5-apptOrganizerCommandGroup" "$OUTLOOK_PREFS" # Cisco Webex

exit 0