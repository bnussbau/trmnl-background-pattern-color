#!/bin/zsh

# Color names and their hex codes
declare -A color_hex=(
  ["red"]="#FF0000"
  ["green"]="#00FF00"
  ["blue"]="#0000FF"
  ["yellow"]="#FFFF00"
  ["orange"]="#FFA500"
)

# Colors to process
colors=("red" "green" "blue" "yellow" "orange")

# Loop through all gray images in input folder
for gray_file in input/gray-*.png; do
  # Extract filename without path
  filename=$(basename "$gray_file")
  
  # Process each color
  for color in "${colors[@]}"; do
    # Get hex color code
    hex_color="${color_hex[$color]}"
    
    # Replace "gray-" with "{color}-" in filename
    output_filename="${filename/gray-/$color-}"
    output_path="output/${color}/${output_filename}"
    echo "Converting ${gray_file} to ${color} (${hex_color}) -> ${output_path}"
    magick "$gray_file" -fill "$hex_color" -opaque black "$output_path"
  done
done

# Convert black.png to all colors
if [ -f "input/black.png" ]; then
  for color in "${colors[@]}"; do
    # Get hex color code
    hex_color="${color_hex[$color]}"
    
    output_path="output/${color}/${color}.png"
    echo "Converting input/black.png to ${color} (${hex_color}) -> ${output_path}"
    magick "input/black.png" -fill "$hex_color" -opaque black "$output_path"
  done
else
  echo "Warning: input/black.png not found, skipping black.png conversion"
fi

echo "Conversion complete!"