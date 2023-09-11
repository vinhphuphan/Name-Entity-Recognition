# Named Entity Recognition
Application of Stanford Named Entity Recognition: https://nlp.stanford.edu/software/CRF-NER.shtml

---------

Stanford NER - v4.2.0 - 2020-11-17
----------------------------------------------

This package provides a high-performance machine learning based named entity recognition system, including facilities to train models from supervised training data and pre-trained models for English.

The original CRF code is by Jenny Finkel. The feature extractors are by Dan Klein, Christopher Manning, and Jenny Finkel. Much of the documentation and usability is due to Anna Rafferty. More recent code development has been done by various Stanford NLP Group members.

Named Entity Recognition (NER) labels sequences of words in a text which are the names of things, such as person and company names, or gene and protein names. It comes with well-engineered feature extractors for Named Entity Recognition, and many options for defining feature extractors. Included with the download are good named entity recognizers for English, particularly for the 3 classes (PERSON, ORGANIZATION, LOCATION).

### LICENSE
----------------------------------------------

The software is licensed under the full GPL v2+.

For more information, bug reports, and fixes, contact:
    Christopher Manning
    Dept of Computer Science, Gates 2A
    Stanford CA 94305-9020
    USA
    java-nlp-support@lists.stanford.edu
    http://www-nlp.stanford.edu/software/CRF-NER.shtml

### Set up
----------------------------------------------
#### Stanford NER
You’ll need to download the Stanford NER package, and unpack it somewhere. I put it directly in my home directory, so the full path is:

`wget https://nlp.stanford.edu/software/stanford-ner-4.2.0.zip`

#### Java JDK
For Stanford’s NER tool to work, you’ll need to have the Java Development Kit installed. You can get the latest version from [this page](https://www.oracle.com/java/technologies/downloads/#java8).

#### One text at a time
The simplest use-case for the Stanford NER is to tag a single text file. I scraped the text from the Wikipedia entry for actor Andrew Lincoln, and saved it as wikipedia.txt in my home directory.

Here’s a sampling from the text:
> Andrew James Clutterbuck (born 14 September 1973), better known by his stage name Andrew Lincoln, is an English actor. His first major role was as the character Egg in the BBC drama This Life (1996–1997). Lincoln later portrayed Simon Casey in the Channel 4 sitcom Teachers (2001–2003), Mark in the Christmas-themed romantic comedy film Love Actually (2003) and Dr. Robert Bridge in the ITV television series Afterlife (2005–2006).

We can tag this text file using:

`~/stanford-ner-2020-11-17/ner.sh ~/wikipedia.txt > stanford-wikipedia.txt`

The > operator directs the output to a new file, stanford-wikipedia.txt. Here’s the chunk from this file that corresponds to the passage that I pulled out, above:
> Andrew/PERSON James/PERSON Clutterbuck/PERSON (/O born/O 14/O September/O 1973/O )/O ,/O better/O known/O by/O his/O stage/O name/O Andrew/PERSON Lincoln/PERSON ,/O is/O an/O English/O actor/O ./O 
His/O first/O major/O role/O was/O as/O the/O character/O Egg/O in/O the/O BBC/ORGANIZATION drama/O This/O Life/O (/O 1996/O -/O 1997/O )/O ./O 
Lincoln/PERSON later/O portrayed/O Simon/PERSON Casey/PERSON in/O the/O Channel/O 4/O sitcom/O Teachers/O (/O 2001/O -/O 2003/O )/O ,/O Mark/PERSON in/O the/O Christmas/O -/O themed/O romantic/O comedy/O film/O Love/O Actually/O (/O 2003/O )/O and/O Dr./O Robert/PERSON Bridge/PERSON in/O the/O ITV/O television/O series/O Afterlife/O (/O 2005/O -/O 2006/O )/O ./O

Note that this is the same text, with two notable differences:

1. Each word has a tag after it, e.g. /O or /PERSON, which indicates the class to which that token (word) belongs.
2. Some special characters have been converted to string representations.

Just looking at this passage, it looks like the Stanford NER did a fairly good job of recognizing instances of the PERSON and LOCATION class.

#### Extract the named entity
After extracting the words which are tagged person, organization, location. The list of ner is like this :
```
AMC

Andrew James Clutterbuck

Andrew Lincoln

BBC

Beechen Cliff School

New York Times

Pascal Chaumeil

Richard Armitage

Rick Grimes
```

#### Accuracy

For the small dataset, the NER tagger can achieve comparatively high accuracy.

| Entity       | Precision | Recall | F1 Score | True Positives | False Positives | False Negatives |
|--------------|-----------|--------|----------|-----------------|------------------|------------------|
| LOCATION     | 1.0000    | 0.8000 | 0.8889   | 4               | 0                | 1                |
| ORGANIZATION | 1.0000    | 0.6471 | 0.7857   | 11              | 0                | 6                |
| PERSON       | 0.9211    | 0.8974 | 0.9091   | 35              | 3                | 4                |
| Totals       | 0.9434    | 0.8197 | 0.8772   | 50              | 3                | 11               |

CRFClassifier tagged 865 words in 31 documents at 656.30 words per second.

#### Discussion

- In the evaluation of NER performance for both Wikipedia and FanWiki texts, program have calculated precision (P), recall (R), and F1-score (F1) for three entity types: LOCATION, ORGANIZATION, and PERSON. These metrics are standard measures used to assess the quality of NER systems.

- According to the results, on Wikipedia text, the NER system demonstrated precision in identifying entities of all types. However it had low recall for ORGANIZATION entities, which means that it accurately recognized most entities but might have missed a few ORGANIZATION ones. Overall, the F1 score indicates that the system maintains a balanced approach, between precision and recall.

- By consistently tagging punctuation as /O, signifying that they are not part of any named entity, the NER system improves precision and reduces false positives.


