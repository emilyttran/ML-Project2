Welcome!

=================
TO RUN THE CODE
=================
- Go to Matlab/main and run 'main.m'
Note: uncomment line 11 if you desire to be bombarded with many, many graphs to test for collinearity. Otherwise, the Matlab/plot folder will contain graphs of what I thought were collinear features
=================
WHAT TO EXPECT
=================
- (2) residual plots of multiple regression on all 11 features and on the best 7 features
- multiple regression information on all subsets of best feature sets, as well as the 95% confidence interval for every coefficient produced in those regressions
- RSS Ridge Error as lambda increases (from left to right)
- RSS Lasso Error as lambda increases (from left to right)
- prediction of 100,000 trials using multiple regression on the best 7 feature subset with various seasons and days of week, displaying the average, the lowest, and the highest of the predicted values for each category.

===============
OTHER NOTES
===============
The best#FeatureFinder methods are comical, especially now that I have found through Stephanie Angulo that Matlab has a function called nchoosek. 
Also, I used winter and fall interchangeably since both seasons have similiar data.


