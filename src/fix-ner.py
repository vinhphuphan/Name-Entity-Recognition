import re

def replace_punctuation_ner(text):
    # Split the text into words
    words = text.split()  

    modified_words = []
    for word in words:
        parts = word.split('/')
        if len(parts) == 2:
            word_text, ner_tag = parts
            # Check if the word is punctuation
            if re.match(r'[^\w\s]', word_text):  
                # Replace the NER tag with "/O"
                modified_word = f"{word_text}/O"  
            else:
                # Keep the word as is (not punctuation)
                modified_word = word  
        else:
            # If not in the expected format, keep it unchanged
            modified_word = word  
        
        modified_words.append(modified_word)
    # Reconstruct the text
    modified_text = ' '.join(modified_words)  
    return modified_text

if __name__ == "__main__":
    # Read and preprocess the text from wikipedia.txt
    with open("wikipedia.txt", "r") as wikipedia_file:
        wikipedia_text = wikipedia_file.read()

    # Read and preprocess the text from fanwiki.txt
    with open("fanwiki.txt", "r") as fanwiki_file:
        fanwiki_text = fanwiki_file.read()

    # Apply the fix-ner.py script to fix NER tags
    fixed_wikipedia_text = replace_punctuation_ner(wikipedia_text)
    fixed_fanwiki_text = replace_punctuation_ner(fanwiki_text)

    # Save the fixed texts back to the files
    with open("wikipedia.txt", "w") as wikipedia_file:
        wikipedia_file.write(fixed_wikipedia_text)

    with open("fanwiki.txt", "w") as fanwiki_file:
        fanwiki_file.write(fixed_fanwiki_text)

    print("NER tags for punctuation have been fixed and saved to wikipedia.txt and fanwiki.txt.")
