# After calling the directory
# where the files are located

# reading in all the files one by one

t1<-read.table("X_test.txt")
t2<-read.table("Y_test.txt")
c1<-read.table("subject_test.txt")
table1<-cbind(c1,t2,t1)

# changing the working directory to the other destination if required
# and reading the rest of the files

t3<-read.table("X_train.txt")
t4<-read.table("Y_train.txt")
c2<-read.table("subject_train.txt")
table2<-cbind(c2,t4,t3)


# Combining all the tables into one


big_data<-rbind(table1,table2)


# taking out required columns only

names<-read.table("features.txt")
col_names<-big_data[,c(1,2,grep("mean|std", names$V2)+2)]

# preparing for the activity names

library(dplyr)
labels<-read.table("activity_labels.txt")
label<-mutate(col_names, V1.1=labels[V1.1,2])

# combining the data set with labels

colnames(label)<-(sub("[Vv]","",colnames(label)))

colnames(label)[1:3]<-c("Subjects","Activities",1)

colnames(label)[3:81]<-as.character(names[as.integer(colnames(label)[3:81]),2])

# combining the variable names

names(label)<-gsub("^t","Time",names(label))
names(label)<-gsub("^f","Frequency",names(label))
names(label)<-gsub("Acc","Accelerometer",names(label))
names(label)<-gsub("Gyro","Gyroscope",names(label))
names(label)<-gsub("Mag","Magnitude",names(label))
names(label)<-gsub("[()]","",names(label))

# summarising the tidied data set

data1<-group_by(label,Subjects,Activities)
data1<- summarise_each(data1,mean)

# saving a copy of the final version

write.table( data1,file = "tidy_data.txt" ,row.names = FALSE)

### End of Program


