#Peer Assignment Codebook

###Description of Data

the data used in this analysis is from:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
=====================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws



###Each record contains:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



###Cleaning data:
The following files were combined to produce a single data frame:

- X_test.txt
- y_test.txt
- subject_test.txt
- X_train.txt
- y_train.txt
- subject_train.txt

The combined data frame had no missing values and all values were between the normalized range of -1 and 1 described by the authors of the source files.

###Data manipulation:
The mean and standard deviation of each row was calculated



