#!/bin/bash

# Set the path to the Stanford NER directory (replace with your actual path)
STANFORD_NER_DIR="stanford-ner-2020-11-17"

# Set the path to the input files
WIKIPEDIA_FILE="wikipedia.txt"
FANWIKI_FILE="fanwiki.txt"

# Set the path to the output files
OUTPUT_WIKIPEDIA="stanford-wikipedia.txt"
OUTPUT_FANWIKI="stanford-fanwiki.txt"

# Run Stanford NER on wikipedia.txt
java -cp "$STANFORD_NER_DIR/*" edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier "$STANFORD_NER_DIR/classifiers/english.all.3class.distsim.crf.ser.gz" -textFile "$WIKIPEDIA_FILE" > "$OUTPUT_WIKIPEDIA"

# Run Stanford NER on fanwiki.txt
java -cp "$STANFORD_NER_DIR/*" edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier "$STANFORD_NER_DIR/classifiers/english.all.3class.distsim.crf.ser.gz" -textFile "$FANWIKI_FILE" > "$OUTPUT_FANWIKI"

echo "NER processing completed for wikipedia.txt and fanwiki.txt."
