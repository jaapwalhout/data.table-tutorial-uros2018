###################################
#  uRos 2018 data.table tutorial  #
#                                 #
#  Exercise 4                     #
###################################


#--------------------------
# get the data
#--------------------------

library(data.table)

air <- airquality

# convert 'air' to a data.table
setDT(air)

airmonths <- data.table(Month = 5:9,
                        Month_abb = month.abb[5:9],
                        Month_name = month.name[5:9])

#------------------------------------------------------------
# 4.1
# Use a join to add the month name from 'airmonths' to 'air'
#------------------------------------------------------------





#------------------------------------------------------------
# 4.2
# Use a join to add both the month name and the
# month abbreviation from 'airmonths' to 'air'
#------------------------------------------------------------






#------------------------------------------------------------
# 4.3
# Use a join to add the month name from 'airmonths' to 'air’;
# then use chaining to calculate the median Wind speed
# for each month name
#------------------------------------------------------------



