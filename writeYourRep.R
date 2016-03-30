#Write Your Representative
##Or more accurately, grab a list of all representatives and senators with addresses.
##and save it for easy access for mailmerge or whatever other thing you need.

##Senate addresses are kept in a xml list on the senate website.
senateurl <- "http://www.senate.gov/general/contact_information/senators_cfm.xml"
library(XML)
senatexml <- xmlTreeParse(senateurl)
senateroot <- xmlRoot(senatexml)
test1 <- xmlToList(test)
senators <- data.frame()
for (m in seq_along(senateroot)){
  if((TRUE==TRUE)){
    senator <- xmlToList(senateroot[[m]])
    row<- cbind.data.frame(senator$first_name,senator$last_name,senator$address)
    print(row)
    senators <- rbind(senators,row)
  }
}
write.csv(senators,"senators.csv")

tables <- readHTMLTable("http://www.house.gov/representatives/",row.names = NULL)

reps<- dataframe(row.names = NULL)
for (t in seq_along(tables)) {
  reps <- rbind(reps, tables[t])
}

#Convert Room Number to Full address
roomToAddress <- function(room){
        addresses <- list(CHOB = "Cannon House Office Building
                                1st & C St SE,
                                Washington DC 20003",
                          LHOB = "Longworth House Office Building
                        240 S Capitol St SE
                        Washington DC 20003",
                          RHOB = "Rayburn House Office Building
                          45 Independence Ave SW,
                          Washington DC 20515")
        #lookup room from addresses.
}

write.csv(reps, "reps.csv")
