#!/bin/zsh

# Create input directory if it doesn't exist
mkdir -p input

# Download gray-1.png through gray-6.png
for i in {1..6}; do
  url="https://usetrmnl.com/images/grayscale/gray-${i}.png"
  output="input/gray-${i}.png"
  echo "Downloading ${url}..."
  curl -L -o "${output}" "${url}"
done

echo "Download complete!"

