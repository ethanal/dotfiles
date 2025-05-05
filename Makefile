.PHONY: format
format:
	jq -S . terminal/iTerm2.json > terminal/iTerm2.fmt.json
	mv terminal/iTerm2.fmt.json terminal/iTerm2.json


