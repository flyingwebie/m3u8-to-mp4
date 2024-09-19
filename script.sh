#!/bin/bash

# Function to sanitize filename
sanitize_filename() {
    echo "$1" | sed -e 's/[^A-Za-z0-9._-]/_/g'
}

# Function to convert m3u8 to mp4
convert_m3u8_to_mp4() {
    input_url="$1"
    output_filename="$2"

    ffmpeg -i "$input_url" -c copy -bsf:a aac_adtstoasc "$output_filename"

    if [ $? -eq 0 ]; then
        echo "Successfully converted $input_url to $output_filename"
    else
        echo "Error converting $input_url"
    fi
}

# Array of videos with their titles and full URLs (including tokens)
videos=(
    # Add your videos here in the format:
    "1. Title 1|https://example.com/file.m3u8"
    "2. Title 2|https://example.com/file2.m3u8"
)

# Create output directory if it doesn't exist
mkdir -p output

# Convert each video
for video in "${videos[@]}"; do
    IFS='|' read -r title url <<< "$video"
    output_filename="output/$(sanitize_filename "$title").mp4"
    convert_m3u8_to_mp4 "$url" "$output_filename"
done

echo "All conversions completed."