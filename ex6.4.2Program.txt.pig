1.Count_data = load '/user/acadgild/Desktop/titanicdata' using PigStorage(',') as(pid:int, sid:int, pclass:int, name:chararray, sex:chararray, age:int, sibsp:int, parch:int, ticket:chararray, fare:chararray, cabin:chararray, embarked:chararray);



//line 1 will load the dataset into the pigstorage.



2.Filter_dead = filter Count_data by sid == 1;



//line 2 will filter the records containing only the data of people who died.



3.Filter_survived = filter Count_data by sid == 0;

 

//line 3 will filter the records containing only the data of people who survived.



4.group_dead = group Filter_dead by pclass;



//line 4 will group the filtered data of dead by all columns.



5.group_survived = group Filter_survived by pclass;



//line 5 will group the filtered data of survived by all columns.



6.Count_dead = foreach group_dead generate COUNT(Filter_dead);



//line 6 will iterate through the grouped records to count the number of dead.



7.Count_survived = foreach group_survived generate COUNT(Filter_survived);



//line 7 will iterate through the grouped records to count the number of survived.



8.dump Count_dead;



//line 8 will display the count of number of people died.



9.dump Count_survived;



//line 9 will display the count of number of people survived.


