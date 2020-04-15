# Pokemon
Analysis of pokemon database consisting of 800 entries.
Tasks accomplished:-

Task1->
Select a pokemon whose primary type is “Grass”, secondary type is “Poison” with the maximum Speed.
Select a pokemon whose primary type is “Water”, secondary type is “Flying” with the maximum Defense.
Select a pokemon whose primary type is “Fire”, secondary type is “Fighting” with the maximum Attack.

Task2->
Attack vs Defence
1. Divide the data-set into train & test sets.
2. Build a linear model on train set wherein-dependent variable is ‘Defence’& Dependentvariable is ‘Attack’.
3. Predict the values on the ‘test’ set.
4. Find the root mean square error.

Task3->
Legendary or not
1.Divide the data-set into train & test sets
2.Build a decision tree on train set where the dependent variable is ‘Legendary’ & all other columns are independent variables
3.Predict the values on the ‘test’ set
4. Find the accuracy by making a confusion matrix

Task4->
Using different split ratios 3 models are built and their accuracies are compared. Split ratios used (To divide into training and testing 
sets are 0.55,0.65,0.85.

Conclusion
Respective confusion matrices were made and accuracies found. A graph was plotted using these ratios and accuracies and a straight line 
with a positive slope indicating that as the split ratios were increased the accuracy of prediction increased, that is the more amount of data that is given to the machine to train the more accurate the prediction will be. 
