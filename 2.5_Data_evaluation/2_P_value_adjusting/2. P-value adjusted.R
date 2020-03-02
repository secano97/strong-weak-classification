PATH_DATASETS <- "../../2.5_Data_evaluation/0. Distribution study/output/"
PATH_OUTPUT <- "output/"
  
datasets <- list()
  
constant <- 'Estatistical-test_'
constant1 <- '_(p_adjust)'
  
features <- list('area', 'meancurv', 'thickness', 'volume')
  
for (feature in features) {
  path = paste(
    PATH_DATASETS, constant, feature, '.csv',sep = '' 
  )
  tstat <- read.csv(file = path,
                    header=TRUE, 
                    sep=",")
  
  print(head(tstat))
  print(nrow(tstat))
  
  print(row.names(tstat))
  
  print(tstat[['p-value']])
  tstat['p_adjust'] <- p.adjust(tstat[['p-value']], method = "bonferroni", n = nrow(tstat))
  
  pathO = paste(
    PATH_OUTPUT, constant, feature, constant1, '.csv',sep = '' 
  )
  
  write.csv(tstat, file= pathO,
            row.names = FALSE)
}








