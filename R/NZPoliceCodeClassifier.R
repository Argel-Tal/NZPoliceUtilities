#' Function which returns all the code groupings of CARD (calls for service) event codes
#' Requires having a path object: `PATH_IN_OrgData_CARDClassification`
#'  Which points to the file "NATIONAL DEMAND DASHBOARD EVENT CATEGORIES AND CODES.csv"
#' Utilises filepath concatenation functions from this package `NZPoliceUtilities` in the intial file read
#' @return codesAll - list of all codes, named
#' 
makeCodes <- function() {
    # reads in file, assumes a known file path in Environment, and the specified reference file
    nationalCodes <- read.csv(
        NZPoliceUtilities::filePathedToRead(
            PATH_IN_OrgData_CARDClassification, "NATIONAL DEMAND DASHBOARD EVENT CATEGORIES AND CODES.csv"
        ) # end filePathing
    ) # end CSV read

    nationalCodes[3,1] <- "Fleeing Driver"
    # remove redundant columns
    nationalCodes <- nationalCodes[ ,-which(colnames(nationalCodes) == "Event_Description")]
    nationalCodes$EVENT_TYPE_CODE <- as.factor(nationalCodes$EVENT_TYPE_CODE)
    nationalCodes$Demand_Category <- as.factor(nationalCodes$Demand_Category)

    # 3Y exists twice, this removes the first of the two occurances
    nationalCodes <- nationalCodes[-which(nationalCodes$EVENT_TYPE_CODE == "3Y")[1], ]

    codes_fleeingDriver <- t(nationalCodes[which(nationalCodes$Demand_Category == "Fleeing Driver"), ][2])
    codes_admin         <- t(nationalCodes[which(nationalCodes$Demand_Category == "Administrative"), ][2])
    codes_alcoholDis    <- t(nationalCodes[which(nationalCodes$Demand_Category == "Alcohol and Disorder"), ][2])
    codes_dishon        <- t(nationalCodes[which(nationalCodes$Demand_Category == "Dishonesty"), ][2])
    codes_drugs         <- t(nationalCodes[which(nationalCodes$Demand_Category == "Drugs"), ][2])
    codes_familyHarm    <- t(nationalCodes[which(nationalCodes$Demand_Category == "Family Harm"), ][2])
    codes_health        <- t(nationalCodes[which(nationalCodes$Demand_Category == "Health/CDEM Act Breac"), ][2])
    codes_justice       <- t(nationalCodes[which(nationalCodes$Demand_Category == "Justice Offences"), ][2])
    codes_mentalHealth  <- t(nationalCodes[which(nationalCodes$Demand_Category == "Mental Health"), ][2])
    codes_otherDuty     <- t(nationalCodes[which(nationalCodes$Demand_Category == "Other Duties"), ][2])
    codes_otherEvent    <- t(nationalCodes[which(nationalCodes$Demand_Category == "Other Event Types"), ][2])
    codes_otherIncident <- t(nationalCodes[which(nationalCodes$Demand_Category == "Other Incident"), ][2])
    codes_pandemic      <- t(nationalCodes[which(nationalCodes$Demand_Category == "Pandemic Response"), ][2])
    codes_prevention    <- t(nationalCodes[which(nationalCodes$Demand_Category == "Prevention Activities"), ][2])
    codes_propertyAbuse <- t(nationalCodes[which(nationalCodes$Demand_Category == "Property Abuse"), ][2])
    codes_propertyDam   <- t(nationalCodes[which(nationalCodes$Demand_Category == "Property Damage"), ][2])
    codes_roadPolicing  <- t(nationalCodes[which(nationalCodes$Demand_Category == "Road Policing"), ][2])
    codes_services      <- t(nationalCodes[which(nationalCodes$Demand_Category == "Services"), ][2])
    codes_sexual        <- t(nationalCodes[which(nationalCodes$Demand_Category == "Sexual"), ][2])
    codes_threats       <- t(nationalCodes[which(nationalCodes$Demand_Category == "Threats"), ][2])
    codes_unknown       <- t(nationalCodes[which(nationalCodes$Demand_Category == "Unknown"), ][2])
    codes_violence      <- t(nationalCodes[which(nationalCodes$Demand_Category == "Violence"), ][2])

    # appends all items into a singular list
    codesAll <- list(codes_fleeingDriver, codes_admin, codes_alcoholDis, codes_dishon, codes_drugs, codes_familyHarm, 
                    codes_health, codes_justice, codes_mentalHealth, codes_otherDuty, codes_otherEvent, codes_otherIncident, 
                    codes_pandemic, codes_prevention, codes_propertyAbuse, codes_propertyDam, codes_roadPolicing, 
                    codes_services, codes_sexual, codes_threats, codes_unknown, codes_violence
                    )
    # named list items, dual support. Naming items gives more intuitive interactions when using a set of CARD codes
    names(codesAll) <- c("Fleeing Driver", "Administrative", "Alcohol and Disorder", "Dishonesty", "Drugs", "Family Harm",
                        "Health/CDEM Act Breac", "Justice Offences", "Mental Health", "Other Duties", "Other Event Types", 
                        "Other Incident", "Pandemic Response", "Prevention Activities", "Property Abuse", 
                        "Property Damage", "Road Policing", "Services", "Sexual", "Threats", "Unknown", "Violence"
                        ) # end codes dictionary

    return(codesAll)
} # end function

