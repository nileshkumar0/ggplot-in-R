install.packages("tidyverse")
library(tidyverse)

mpg

#Notes: displ is the car's engine size in liters hwy is the car's fuel efficiency on the highway in miles per gallon
#(mpg)
#Create the graph using ggplot

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy))
ggplot(data=mpg) #creates an empty plot using the mpg dataset geom_point adds scatter point graph using
#displ on the x axis and hwy on the y axis
#The template is: ggplot(data =) + (mapping =aes())
#Exercises:

ggplot(data=mpg)

#Answer: we see an empty plot
#How many rows in mtcars? How many columns?

dim(mtcars)

#Answer: 32 rows, and 11 columns

summary(mtcars)
#Shows eleven fields.
#To find out what drv variables describes, use the help function
#?mpg
#Pops up the help that shows up on the help screen:
#drv f = front-wheel drive, r = rear wheel drive, 4 = 4wd
#Exercise Make a scatterplot of hwy versus cyl

ggplot(data=mpg) + geom_point(mapping = aes(x=cyl, y=hwy))

#What happens when we make a scatterplot of class versus drv?
 
 ggplot(data=mpg) + geom_point(mapping = aes(x=class, y=drv))

#Why is this plot not useful?
#(no pattern??)
#Looking at the first scatterplot

 ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy))

#You wont easily be able to identify the outliers. Why dont we apply colors to this plot?
 
ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color=class))

#This now quickly helps readers to find that 2seaters are more fuel efficient.
#Other ways will be to use size, alpha(transparency) and shape.

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, size=class))

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy,alpha=class))

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, shape=class))

#Note that for the shape , SUV is gone! Ggplot will only use 6 shapes at a time.
#You can also manually set properties

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy), color="red")

#Note: for manually setting objects, do it outside the AES

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy), shape=24)

#Why is the graph below not blue?
  
ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color="blue"))

#What happens when we map the same variable to different aesthetics? (size, shape, color)

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color=class, shape=class, size=class))
?geom_point

#What is the stroke aesthetic do?
#Use the stroke aesthetic to modify the width of the border

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, shape=class,stroke=1))

#What happens when you map an aesthetic to something other than a variable name like aes(color =displ <5)

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color= displ<5))

#How to make small multiple graphs (facets in R ggplot convention)
ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color= displ <5)) +
  facet_wrap(~ class, nrow=2)

#To face on a combination of two variables, add facet_grid to your plot call.

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color= displ <5)) +
  facet_grid(drv ~ cyl)

#Use [.] to avoid facet on either row or column. Like this below:
 
 ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color= displ <5)) +
  facet_grid(. ~ cyl)

#What happes if we facet on a continuous variable?
#first find which variable is continuous.

 summary(mpg)
ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy, color= displ <5)) +
  facet_grid(drv ~ cty)

#A geom is the geometrical object that a plot uss to represent data.
#Using geom_point

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy))

#Using geom_smooth with no arguments

ggplot(data=mpg) + geom_smooth(mapping = aes(x=displ, y=hwy))

#Using geom_smooth with linetype argument

ggplot(data=mpg) + geom_smooth(mapping = aes(x=displ, y=hwy, linetype =drv))

#The above geom_smooth separates the cars into 3 lines based on their drv value which describes a car's
#drivetrain.
#We can overly geom_point on geom_smooth

ggplot(data=mpg) + geom_smooth(mapping = aes(x=displ, y=hwy, linetype =drv)) +
  geom_point(mapping = aes(x=displ, y=hwy, color=drv))

#To avoid having to set the mappings in each geom, you can place a set of mapping in the main ggplot().
#Then they become 'global'

ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) + geom_point() + geom_smooth()

#If you place argument inside the geom function, it will be treated as local.
ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth()

#using this technic we can use it to specify a different data for each layer.
ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(data = filter(mpg, class =='subcompact'),se=FALSE)

#Exercises:
#How to draw a line chart, a boxplot, a histogram, an area chart?
 
 ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_line()
ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_boxplot()
ggplot(data=mpg, mapping=aes(x=displ)) +
  geom_histogram()
ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_area()
#Exercise:
  ggplot(data=mpg, mapping=aes(x=displ,y=hwy, color=drv)) +
  geom_point() +
  geom_smooth(se =FALSE)
#Q:What does show_legend do? What happens when it is removed?

ggplot(data=mpg, mapping=aes(x=displ,y=hwy, color=drv)) +
  geom_point() +
  geom_smooth(se =FALSE,show.legend = FALSE)

#The legend on the DRV for the line doesnt showup.
#Recreating the lines in the exercises

ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_point(size=4)+
  geom_smooth(se =FALSE)
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_point(size=4)+
  geom_line(mapping = aes(linetype =drv))

#To learn about ggplot: http://www.ggplot2-exts.org/ (http://www.ggplot2-exts.org/) Cheat sheet:
#https://www.rstudio.com/resources/cheatsheets/ (https://www.rstudio.com/resources/cheatsheets/)

#Bar Charts

ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=cut))

#Stat_count() can be interchanged with geom_bar since geom_bar also uses stat_count to statistically
#transform the data into counts.

ggplot(data=diamonds) +
  stat_count(mapping = aes(x=cut))

#This works because every geom has a default stat, and every stat has a default geom.
#Three reasons to use a stat explicitly:
#1. you want to overrid the default stat.
#2. you want to to use aesthetics instead of transformed variables
#3. you want to draw attention to the statistical transformation in the code.

demo <- tribble(
  ~a, ~b,
  "Bar_1",20,
  "Bar_2",30,
  "Bar_3", 40)
ggplot(data = demo)+
  geom_bar(
    mapping=aes(x=a, y=b), stat="identity"
  )

#using aesthetics instead of transformed variables

ggplot(data = diamonds)+
  geom_bar(
    mapping=aes(x=cut, y=..prop.., group=1)
  )
#Case 3 demo
ggplot(data = diamonds)+
  stat_summary(
    mapping=aes(x=cut, y=depth),
    fun.ymin=min,
    fun.ymax=max,
    fun.y=median
  )

#How is geom_col() different from geom_bar ?
#answer: geom_bar uses only one variable, geom_col uses two variables and displays the count that applies to
#both conditions.

ggplot(data = diamonds)+
  geom_col(
    mapping=aes(x=cut,y=carat)
  )
ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut,fill=color, y=..prop..))

#Position Adjustments for bar charts using either aesthetic
ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut,color=cut))
#Position Adjustments for bar charts using fill

ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut,fill=cut))

#What happens when we fill using another variable like clarity

ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut,fill=clarity))

#If we don't want a stacked bar chart.
#the alpha option enables transparentcy so the overlaps can be seen.

ggplot(data=diamonds,mapping=aes(x=cut,fill=clarity)) +
  geom_bar(aplha=1/5, position="identity"
  )
#using fill with NA values
ggplot(data=diamonds,mapping=aes(x=cut,color=clarity)) +
  geom_bar(fill=NA, position="identity")

#To make it easier to compare proportions across groups, use position="fill"

ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut,fill=clarity), position="fill")

#Use position="dodge" to place the bars beside each other
ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut,fill=clarity), position="dodge")

#Using Jitter to show all the data in a scatter plot
ggplot(data=mpg) +
  geom_point( mapping=aes(x=displ, y=hwy), position="jitter")

#Adding randomness may be a strange way to improve the plot, but while it makes the graph less accurate, it
#makes your graph MORE revealing at large scales.
#Coordinate System
#The default coordinate is the cartesian coordinate system where the x and y position act independently to find
#the location of each point. some other coordinate systems:
#coord_flip() switches the x and y axes. Useful when you want horizontal box plots.
#coord_quickmap() sets the aspect ratio correctly for maps. Important for plotting spatial data
#coord_polar() uses polar coordinates. It reveals an interesting connection between a bar chart and a coxcomb
#chart.

# example of coord_flip

ggplot(data =mpg, mapping=aes(x=class, y=hwy))+
  geom_boxplot()
ggplot(data =mpg, mapping=aes(x=class, y=hwy))+
  geom_boxplot()+
  coord_flip()
# exaple of quickmap()
library(ggplot2)
ph <- map_data("nz")
ggplot(ph, aes(long,lat, group=group))+
  geom_polygon(fill="white", color="black")
ggplot(ph, aes(long,lat, group=group))+
  geom_polygon(fill="white", color="black")+
  coord_quickmap()
# example of polar coordinates
bar <- ggplot(data=diamonds)+
  geom_bar(mapping =aes(x=cut,fill=cut),show.legend=FALSE, width =1) +
  theme(aspect.ratio=1)+
  labs(x=NULL, y=NULL)
bar + coord_flip()
bar + coord_polar()

#Layered grammar of graphics
#The seven parameters template:
#ggplot(data=datafile) + geom_function( mapping=aes(mappingsettings) stat=statsettings, position=positionsetting)+ coordinate_function+ facet_function )

#++++++++++++++++++ PIE CHART ++++++++++++++++++ 
#1. Create titanic passengers count dataset:
  count.data <- data.frame(
    class = c("1st", "2nd", "3rd", "Crew"),
    n = c(325, 285, 706, 885),
    prop = c(14.8, 12.9, 32.1, 40.2)
  )
  count.data
  
#2. Compute the position of the text labels as the cumulative sum of the proportion:
#a. Arrange the grouping variable (class) in descending order. This is important to compute the y
#coordinates of labels. b). To put the labels in the center of pies, we'll use cumsum(prop) - 0.5*prop as

# Add label position
count.data <- count.data %>%
  arrange(desc(class)) %>%
  mutate(lab.ypos = cumsum(prop) - 0.5*prop)
count.data

#Pie chart +++++++++++++++++++++ Simple pie charts

df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)
head(df)

#Use a barplot to visualize the data :
  library(ggplot2)
# Barplot
bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp

#+++++++++++++++++++++++ Create a pie chart ++++++++++++++++++
  pie <- bp + coord_polar("y", start=0)
pie

#+++++++++++++++++ Change the pie chart fill colors It is possible to change manually the pie chart fill colors
#using the functions :
#scale_fill_manual() : to use custom colors scale_fill_brewer() : to use color palettes from RColorBrewer
#package scale_fill_grey() : to use grey color palettes
# Use custom color palettes

pie + scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))

# use brewer color palettes

pie + scale_fill_brewer(palette="Dark2")

pie + scale_fill_brewer(palette="Blues")+
  theme_minimal()

# Use grey scale
pie + scale_fill_grey() + theme_minimal()

#Create the pie charts using ggplot2 verbs. Key function: geom_bar() + coord_polar(). Add text labels:
#geom_text() Change fill color manually: scale_color_manual() Apply theme_void() to remove axes,
#background, etc

mycols <- c("#0073C2FF", "#EFC000FF", "#868686FF", "#CD534CFF")
ggplot(count.data, aes(x = "", y = prop, fill = class)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  geom_text(aes(y = lab.ypos, label = prop), color = "white")+
  scale_fill_manual(values = mycols) +
  theme_void()

#++++++++++++++++++++++++++ Donut chart ++++++++++++++++++++++++++
#Donut chart chart is just a simple pie chart with a hole inside.
#The only difference between the pie chart code is that we set: x = 2 and xlim = c(0.5, 2.5) to create the hole
#inside the pie chart. Additionally, the argument width in the function geom_bar() is no longer needed.

ggplot(count.data, aes(x = 2, y = prop, fill = class)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+
  geom_text(aes(y = lab.ypos, label = prop), color = "white")+
  scale_fill_manual(values = mycols) +
  theme_void()+
  xlim(0.5, 2.5)
ggplot(data = babies, aes(x = bwt)) +
  geom_histogram()
