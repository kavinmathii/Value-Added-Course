# Importing Dataset
Student <- read.csv("student-mat.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(Student)

# Datatypes Check
str(Student)

# Datatype Conversion
Student$school <- as.factor(Student$school )
Student$sex <- as.factor(Student$sex )
Student$age <- as.factor(Student$age)
Student$address <- as.factor(Student$address)

# Datatypes Recheck
str(Student)

# Express Table for Student
prop.table(table(Student$school))

# Importing Library
library(ggplot2)

# Student Count Bar graph
ggplot(Student, aes(x = school)) + theme_classic() + 
  geom_bar() + 
  labs(y = "Student Count", title = "Student's School Count")

# Gender wise Student Plot
ggplot(Student, aes(x = sex, fill = school)) + theme_light() + 
  geom_bar() + 
  labs(y = "Student count", 
       title = "Student Count by Gender")

# Plot for Student based on Age
ggplot(Student, aes(x = age, fill = school)) + theme_light() + 
  geom_bar() + 
  labs(y = "Student count", 
       title = "Student Count by Age")

# Plot for Student based on Address
ggplot(Student, aes(x = address, fill = school)) + theme_light() + 
  geom_bar() + 
  labs(y = "Student count", 
       title = "Student Count by Address")

# Plot for gender based count from each class
ggplot(Student, aes(x = sex, fill = school)) + theme_light() + 
  facet_grid(~age) + geom_bar() + 
  labs(y = "Student count", 
       title = "Student Count by Age and Gender")

# Pie chart for student ratio in each class
ggplot(Student, aes(x = "", fill = school)) + 
  geom_bar(position = "fill") + 
  facet_grid(~age) + coord_polar(theta = "y")

# Density plot
ggplot(Student, aes(x = age, fill = school)) + theme_bw() + 
  facet_wrap(sex~address) + geom_density(alpha = 0.5) + 
  labs(y = "age", x = "survived", 
       title = "Student Count by Age, Address and Gender")
