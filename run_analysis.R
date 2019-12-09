# After calling the directory
# where the files are located

# reading in all the files one by one

t1<-read.table("body_acc_x_test.txt")
t2<-read.table("body_acc_y_test.txt")
t3<-read.table("body_acc_z_test.txt")
t4<-read.table("body_gyro_x_test.txt")
t4<-read.table("body_gyro_y_test.txt")
t5<-read.table("body_gyro_z_test.txt")
t6<-read.table("total_acc_x_test.txt")
t7<-read.table("total_acc_y_test.txt")
t8<-read.table("total_acc_z_test.txt")

# changing the working directory to the other destination if required
# and reading the rest of the files

t9<-read.table("body_acc_x_train.txt")
t10<-read.table("body_acc_y_train.txt")
t11<-read.table("body_acc_z_train.txt")
t12<-read.table("body_gyro_x_train.txt")
t13<-read.table("body_gyro_y_train.txt")
t14<-read.table("body_gyro_z_train.txt")
t15<-read.table("total_acc_x_train.txt")
t16<-read.table("total_acc_y_train.txt")
t17<-read.table("total_acc_z_train.txt")


# Combining all the tables into one


big_data<-rbind(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17)


# taking out required columns only

req_data<-big_data[,1:6]

# almost done

# Changing the Column names

colnames(req_data)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

# successfully changed

# finding the tidy results

library(dplyr)
tidy<-summarise_each(req_data,mean)

# end of program
