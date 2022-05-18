# Automatic Medical Transcription Labeling Proof Of Concept

<strong>Project Summary</strong>

A client had a manual time intensive process that entailed a manager reviewing the unstructured notes from lab technicians. The manager then had to manually classify the record based on the notes written by the lab tech.

I proposed that natural language processing be employed to automatically classify the records thereby freeing the manager to perform other task.

The file “text-classification-poc.ipynb” represents the proof of concept I built to demonstrate what is possible.  

<strong>Description</strong>

This process imports a file that consist of medical transcriptions. That file is cleansed and used to create a predictive model to automatically label the specialty of the medical case.

<strong>Dataset</strong>

Results records consist of two columns. 

<table>
  <tr>
    <th>Column Name</th>
    <th>Definition</th>
  </tr>
  <tr>
    <td>Reason</td>
    <td>Medical transcriptions.</td>
  </tr>
  <tr>
    <td>Classification</td>
    <td>Specialty classification of transcription.</td>
  </tr>
</table>

Due to the sensitive nature of this project, the actual data file used in this code was constructed from a publicly available dataset and the results do not reflect the results from the production data. 

The original results are noted in the analysis. 

<strong>Code Dependencies</strong>
<p>Process requires the "wiki-news-300d-1M.vec" file which can be found by googling for the file name.</p>