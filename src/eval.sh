#!/bin/sh

# Evaluate on wikipedia-gold.txt and save the output to wikipedia-eval.txt
java -mx700m -cp "./stanford-ner-2020-11-17/*" edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier "./stanford-ner-2020-11-17/classifiers/english.all.3class.distsim.crf.ser.gz" -testFile "wikipedia-gold.txt" > "wikipedia-eval.txt"

# Evaluate on fanwiki-gold.txt and save the output to fanwiki-eval.txt
java -mx700m -cp "./stanford-ner-2020-11-17/*" edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier "./stanford-ner-2020-11-17/classifiers/english.all.3class.distsim.crf.ser.gz" -testFile "fanwiki-gold.txt" > "fanwiki-eval.txt"
