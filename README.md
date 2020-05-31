# K-Means Clustering Algorithm

K-means clustering algorithm implemented in Assembly.
For simpler understanding, the k-means algorithm was split into four parts.
Consecutive files contain the code for the previous file, with the kmeans.asm containing the code for the entire algorithm. 


## The Code

#### Part 1: Euclidean Distance (euclidean.asm)

This code asks the user for two points as input and then returns the Euclidean distance between the two points. The euclidean distance is found without computing the square root of the distance since the calculation is used purely for comparison.


#### Part 2: Comparing Euclidean Distance (comparison.asm)

This code contains 10 hardcoded data points. It asks the user for two initial centroid points and outputs two clusters based on one loop of comparing the distance between each point and both centroids.


#### Part 3: Centroid Calculation (centroid.asm)

Similar to the above, this code asks the user for two initial centroids and has 10 hardcoded data points. The euclidean didtance is compared between each point and the centroids. Afterwards, the average of each (x, y) points in the clusters are calculated and compared to the initally chosen centroids. The code outputs the clusters and the new centroids after running once (whether the new centroids changed or not).


#### Part 4: K-Means Solution (kmeans.asm)



## Running

These separate programs were designed to be run on QTSpim. Simply clone or download the zip, run each file in QTSpim and follow the instructions for user input.

Optionally, you may edit any file with hardcoded inputs (comparison.asm, centroid.asm, kmeans.asm) to include your own data points to test.


## Report

The report is included to show understanding of the algorithm and results from running the kmeans.asm program.

