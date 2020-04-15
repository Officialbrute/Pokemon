#POKEMON 

#READING THE DATA AND MAKING IT EASIER TO READ/UNDERSTAND 
read.csv("Pokemon.csv")->pokemon
library(dplyr)
View(pokemon)
pokemon %>% select(-1)->pokemon
colnames(pokemon)[2]<-"Primary_Type"
colnames(pokemon)[5]<-"Health_Points"
colnames(pokemon)[3]<-"Secondary_Type"
colnames(pokemon)[8]<-"Special_Attack"
colnames(pokemon)[9]<-"Special_Defence"

#FINDING ALL TYPES OF POKEMON
table(pokemon$Primary_Type)

#SELECTING GRASS & POISON TYPE POKEMON WITH MAX SPEED
pokemon %>% filter(Primary_Type=="Grass")->Grass_Pokemon
Grass_Pokemon %>% filter(Secondary_Type=="Poison")->Grass_Poison_Pokemon
Grass_Poison_Pokemon$Speed
Grass_Poison_Pokemon %>% filter(Speed==90)->My_grass_pokemon
View(My_grass_pokemon)

#SELECTING WATER & FLYING TYPE POKEMON WITH MAX DEFENSE
pokemon %>% filter(Primary_Type=="Water")->Water_Pokemon
Water_Pokemon %>% filter(Secondary_Type=="Flying")->Water_Flying_Pokemon
Water_Flying_Pokemon$Defense
Water_Flying_Pokemon %>% filter(Defense=="100")->My_Water_Pokemon
View(My_Water_Pokemon)

#SELECTING FIRE & FIGHTING TYPE POKEMON WITH MAX ATTACK
pokemon %>% filter(Primary_Type=="Fire")->Fire_Pokemon
Fire_Pokemon %>% filter(Secondary_Type=="Fighting")->Fire_Fighting_Pokemon
range(Fire_Fighting_Pokemon$Attack)
Fire_Fighting_Pokemon %>% filter(Attack=="160")->My_Fire_Pokemon

#VIEWING ARE THE CHOSEN POKEMON
rbind(My_grass_pokemon,My_Water_Pokemon,My_Fire_Pokemon)->My_Pokemons
View(My_Pokemons)
----------------------
#CREATING A LINEAR REGRESSION MODEL TO SEE HOW ATTACK VARIES WITH DEFENSE FOR EACH POKEMON  
library(caTools)
sample.split(pokemon$Attack,SplitRatio = 0.65)->split_tag
subset(pokemon,split_tag==T)->train
subset(pokemon,split_tag==F)->test
lm(Attack~Defense,data = train)-> mod1
predict(mod1,newdata = test)->result1
cbind(Actual=test$Attack,Predicted=result1)->Final_Data
View(Final_Data)
as.data.frame(Final_Data)->Final_Data

#FINDING ERROR AND SUBSEQUENTLY RMS ERROR
Final_Data$Actual-Final_Data$Predicted->Error
cbind(Final_Data,Error)->Final_Data
sqrt(mean(Final_Data$Error^2))

-----------------------------------
  
#USING DECISON TREE TO FIND WHETHER A GIVEN POKEMON IS LEGENDARY OR NOT
sample.split(pokemon$Legendary,SplitRatio = 0.65)->split_tag2
subset(pokemon,split_tag2==T)->Train
subset(pokemon,split_tag2==F)->Test
library(rpart)
rpart(Legendary~.,data = Train)->mod_2
predict(mod_2,newdata = Test,type="class")->result2

#BUILDING A CONFUSION MATRIX AND FINDINFG THE ACCURACY
table(Test$Legendary,result2)
#THESE VALUES ARE TENTATIVE AND ARE SUBJECT TO CHANGE WITH EACH RUN,HOWEVER THE CHANGE IS VERY LESS, THE REND REMAINS THE SAME
(255+8)/(255+2+8+15)->accuracy2

#FINDING THE VARIATION OF ACCURACY WITH DIFFERENT SPLIT RATIOS
sample.split(pokemon$Legendary,SplitRatio = 0.85)->split_tag3
subset(pokemon,split_tag3==T)->train2
subset(pokemon,split_tag3==F)->test2
rpart(Legendary~.,data = train2)->mod3
predict(mod3,newdata = test2,type = "class")->result3

table(test2$Legendary,result3)
#THESE VALUES ARE TENTATIVE AND ARE SUBJECT TO CHANGE WITH EACH RUN,HOWEVER THE CHANGE IS VERY LESS, THE REND REMAINS THE SAME
(109+5)/(109+5+5+1)->accuracy3

sample.split(pokemon$Legendary,SplitRatio = 0.55)->split_tag4
subset(pokemon,split_tag4==T)->train3
subset(pokemon,split_tag4==F)->test3
rpart(Legendary~.,data = train3)->mod_4
predict(mod_4,newdata = test3,type = "class")->result4
table(test3$Legendary,result4)
#THESE VALUES ARE TENTATIVE AND ARE SUBJECT TO CHANGE WITH EACH RUN,HOWEVER THE CHANGE IS VERY LESS, THE REND REMAINS THE SAME
(305+29)/(305+29+26)<-accuracy4

#PLOTTING THE VALUES 
split_ratio1<-0.55
split_ratio2<-0.65
split_ratio3<-0.85
rbind(split_ratio1,split_ratio2,split_ratio3)->split_ratio1
rbind(accuracy4,accuracy2,accuracy3)->accuracy1
cbind(split_ratio1,accuracy1)->data
class(data)
as.data.frame(data)->data
library(ggplot2)
ggplot(data,aes(x=V1,y=V2))+geom_line(color="black")








