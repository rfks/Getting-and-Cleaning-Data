####Process the train set
#reads train set file
xt<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

#read vector labels
vl<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#rename train set labels
names(xt)<-vl$V2

####Additional columns to train set
#read train subjects
st<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

#add label to subject
names(st)<-"subject"

#read train activities
yt<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

#read activity labels
al<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

#add name to activityIDs
yt<-merge(yt,al,by.x = "V1",by.y = "V1")
names(yt)<-c("activityID","activityName")

#add activitynames to train set
xt$activityName<-yt$activityName

#add subject to train set
xt$subject<-st$subject


####Process the test set(same actions, but different source files)
#reads test set file
xt2<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

#read vector labels, no need again
#vl<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#rename test set labels
names(xt2)<-vl$V2

####Additional columns to test set
#read test subjects
st2<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

#add label to subject
names(st2)<-"subject"

#read test activities
yt2<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

#read activity labels, no need again
#al<-read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

#add name to activityIDs
yt2<-merge(yt2,al,by.x = "V1",by.y = "V1")
names(yt2)<-c("activityID","activityName")

#add activitynames to test set
xt2$activityName<-yt2$activityName

#add subject to test set
xt2$subject<-st2$subject



####Merge train and test data 
r<-rbind(xt,xt2)

