-- Close a file currently opened in Preview
on run argv
	tell application "Preview"
		set windowCount to number of windows
		repeat with x from 1 to windowCount
			set docName to (name of document of front window)
			if (docName starts with item 1 of argv) then
				close window x
			end if
		end repeat
	end tell
end run

