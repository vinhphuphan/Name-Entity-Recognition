#!/bin/bash

# Input files (Stanford NER outputs)
INPUT_FILE_WIKIPEDIA="stanford-wikipedia.txt"
INPUT_FILE_FANWIKI="stanford-fanwiki.txt"

# Output files for the list of NERs
OUTPUT_FILE_WIKIPEDIA="ner-list-wikipedia.txt"
OUTPUT_FILE_FANWIKI="ner-list-fanwiki.txt"

# Function to remove duplicates and save the result to a file
remove_duplicates_and_save() {
  local input_file="$1"
  local output_file="$2"

  # Extract and list unique NERs (names), one per line
  grep -oP '\w+\/(PERSON|LOCATION|ORGANIZATION)\s' "$input_file" | sed -E 's/\/(PERSON|LOCATION|ORGANIZATION)//g' | sort -u | sed G > "$output_file"
}

# Call the function for wikipedia.txt
remove_duplicates_and_save "$INPUT_FILE_WIKIPEDIA" "$OUTPUT_FILE_WIKIPEDIA"
echo "Unique NER names extracted and listed in $OUTPUT_FILE_WIKIPEDIA"

# Call the function for fanwiki.txt
remove_duplicates_and_save "$INPUT_FILE_FANWIKI" "$OUTPUT_FILE_FANWIKI"
echo "Unique NER names extracted and listed in $OUTPUT_FILE_FANWIKI"

