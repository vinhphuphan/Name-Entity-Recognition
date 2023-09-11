import wikipedia

# Set the Wikipedia language (e.g., 'en' for English)
wikipedia.set_lang("en")

# Specify the title of the Wikipedia page you want to extract
page_title = "Andrew Lincoln"

# Get the Wikipedia page content
page_content = wikipedia.page(page_title).content

# Define the file name
file_name = "wikipedia.txt"

# Write the page content to the text file
with open(file_name, "w", encoding="utf-8") as file:
    file.write(page_content)

print("Extraction finished.")