# Path to the folder containing images and videos
folder="/Users/learning/Desktop/store-frontend/src/assets/images"

# Loop through all files in the folder
for file in "$folder"/*; do
    # Check if the file is an image
    if [[ -f "$file" && $(file --mime-type -b "$file") =~ image/* ]]; then
        # Resize the image
        ffmpeg -i "$file" -vf scale=20:-1 "${file%.*}-small.${file##*.}"
    elif [[ -f "$file" && $(file --mime-type -b "$file") =~ video/* ]]; then
        # Resize the video (optional, you can remove this block if you don't need to resize videos)
        # ffmpeg -i "$file" -vf scale=20:-1 "${file%.*}-small.${file##*.}"
        echo "Skipping video: $file"
    else
        echo "Skipping unsupported file: $file"
    fi
done