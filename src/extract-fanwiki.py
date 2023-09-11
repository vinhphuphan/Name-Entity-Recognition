import fandom

# Define the URL of the fan wiki
anime_name = "jojo"

# Set the wiki to be just plain "Jojo"
fandom.set_wiki(anime_name)

# Search for Koichi Hirose
search_results = fandom.search("Koichi Hirose")

# Check if search results were found
if search_results:
    # Get the page ID of the first search result (assuming it's the correct page)
    page_id = search_results[0][1]

    # Get the page content
    page = fandom.page(pageid=page_id)

    def extract_content(data):
        content_list = []

        if isinstance(data, dict):
            if "content" in data:
                content_list.append(data["content"])
            
            for key, value in data.items():
                content_list.extend(extract_content(value))
        elif isinstance(data, list):
            for item in data:
                content_list.extend(extract_content(item))
        return content_list

    

    # Define the file name
    file_name = "fanwiki.txt"

    # Write the formatted content to the text file
    with open(file_name, "w", encoding="utf-8") as file:
        for i in extract_content(page.content):
            file.write(i)
            file.write("\n\n")
            file.write(f"===={page.sections[extract_content(page.content).index(i)]}=====\n")
    print("Extraction finished!")
