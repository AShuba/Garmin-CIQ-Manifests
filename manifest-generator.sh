#!/bin/bash

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --min-api-level)
            min_api_level="$2"
            shift
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
    shift
done

# Check if the minimum connectIQVersion is provided
if [ -z "$min_api_level" ]; then
    echo "Usage: $0 --min-api-level <min_api_level>"
    exit 1
fi

# Start building the output manifest.xml
output="<?xml version=\"1.0\"?>
<!-- This manifest was generated by project https://github.com/AShuba/Garmin-CIQ-Manifests -->
<iq:manifest version=\"3\" xmlns:iq=\"http://www.garmin.com/xml/connectiq\">
    <iq:application id=\"\" type=\"\" name=\"\" entry=\"\" launcherIcon=\"\" minApiLevel=\"$min_api_level\">
        <iq:products>"

# Counter for the number of productIds found
count=0

# Loop through the folders and add product entries to the output
for folder in */; do
    # Check if it is a directory
    if [ -d "$folder" ]; then
        # Check if compiler.json exists in the folder
        compiler_json="$folder/compiler.json"
        if [ -e "$compiler_json" ]; then
            # Extract connectIQVersion from compiler.json
            connectIQVersion=$(jq -r '.partNumbers[0].connectIQVersion' "$compiler_json" 2>/dev/null)

            # Compare each section of connectIQVersion
            if [ -n "$connectIQVersion" ] && [ "$connectIQVersion" != "null" ]; then
                current_version=$(echo "$connectIQVersion" | awk -F'.' '{ printf "%d%02d%02d", $1, $2, $3 }')
                min_version=$(echo "$min_api_level" | awk -F'.' '{ printf "%d%02d%02d", $1, $2, $3 }')
                if [ "$current_version" -ge "$min_version" ]; then
                    # Refactor variable name from output_folder to productId
                    productId=$(echo "$folder" | sed 's:/$::')
                    output+="\n            <iq:product id=\"$productId\"/>"
                    ((count++))
                fi
            fi
        fi
    fi
done

# Print the total number of productIds found
echo "Total $count devices found for the min API Level v.$min_api_level"

# Complete the output with the remaining parts of the template
output+="
        </iq:products>
        <iq:permissions>
        </iq:permissions>
        <iq:languages>
        </iq:languages>
        <iq:barrels>
        </iq:barrels>
    </iq:application>
</iq:manifest>"

# Print the generated manifest
echo -e "$output" > manifest.xml
