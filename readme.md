# Peer Assignment Script

The run_analysis.R script is a set of data cleaning and transformation steps wrapped in a function so that the user can simply call runPeerAnalysis() after loading the file –  source("run_analysis.R").

This will produce the tidy data output of means for each subject by activity that was required in the assignment.

runPeerAnalysis() calls 2 other functions:

* loadCombineData() loads the different training and test data sets
* extractMeanSd() gets the mean and standard deviation for each of the participants' activities

All of the steps in these functions can be run line by line – if they are run in the order that the functions are called in runPeerAssignment() – to produce the intermediate outputs.

runPeerAnalysis completes by outputting the means for each subject by activity as a .txt file (tab-separated).