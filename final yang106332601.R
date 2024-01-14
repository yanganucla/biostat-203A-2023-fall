#Q2
library(dplyr)
library(sas7bdat)
library(ggplot2)
library(scales)
hcmst <-read.sas7bdat("hcmst.sas7bdat")
casesubset<-read.csv("CaseSubset.csv")
my_case<-casesubset %>%
        filter(SUBSETNUMBER ==2)
my_hcmst<-merge(hcmst,
                my_case,
                by = "CASEID_NEW")


hc <-data.frame(prop.table(table(my_hcmst$Q31_2,
      my_hcmst$RELATIONSHIP_QUALITY),1))

hc <- hc %>%
  arrange(Var1, desc(Var2)) %>%
  group_by(Var1) %>%
  mutate(perclabs = cumsum(Freq))

hc
P1 <- ggplot(hc, aes(x=Var1, y=Freq, fill=Var2))+
  geom_bar(stat = "identity",width=0.7) +
  geom_text(aes(y=perclabs, 
                label=ifelse(perclabs > 0.97, "", percent(perclabs))), vjust=2)+
  scale_x_discrete(limits = c("0","1"),
                   labels = c("NO","YES"))+
  labs(y = "Percentage of Resondents",
       x = "Met at School",
       title="Relationship Quality",
       subtitle="Among those who met at school")

ggsave("stacked bar graph Step 2.png",
       plot=P1,
       width = 5,
       height = 4.5,
       units = c("in"))


#Q3
simulate_chi_square <- function(n1, n2, p1, p2, M, G) {
  results <- vector("numeric", G)
  
  for (i in 1:G) {
    significant_count <- 0
    
    for (j in 1:M) {
      group1 <- rbinom(n1, 1, p1)
      group2 <- rbinom(n2, 1, p2)
      
      table <- matrix(c(sum(group1), n1 - sum(group1), sum(group2), n2 - sum(group2)), nrow = 2)
      
      chi_square <- chisq.test(table)
      
      if (chi_square$p.value < 0.05) {
        significant_count <- significant_count + 1
      }
    }
    
    results[i] <- significant_count
  }
  
  return(results)
}



n1 <- n2 <- 100
p1 <- p2 <- 0.20
M <- 20
G <- 1000

output <- simulate_chi_square(n1, n2, p1, p2, M, G)

proportion <- sum(output > 0) / G

print(proportion)

M_values <- 1:30
proportions <- numeric(length(M_values))

for (i in 1:length(M_values)) {
  a <- simulate_chi_square(n1, n2, p1, p2, M_values[i], G)
  proportions[i]  <- sum(a > 0) / G
}
print(proportions)

plot(M_values, proportions, type = "l", xlab = "M", ylab = "Proportion Significant",main = "The Proportion by the M")


