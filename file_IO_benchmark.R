DTn  <- function(N) data.table(
  str1=sample(sprintf("%010d",sample(N,1e5,replace=TRUE)), N, replace=TRUE),
  str2=sample(sprintf("%09d",sample(N,1e5,replace=TRUE)), N, replace=TRUE),
  str3=sample(sapply(sample(2:30, 100, TRUE), function(n) paste0(sample(LETTERS, n, TRUE), collapse="")), N, TRUE),
  str4=sprintf("%05d",sample(sample(1e5,50),N,TRUE)),
  num1=sample(round(rnorm(1e6,mean=6.5,sd=15),2), N, replace=TRUE),
  num2=sample(round(rnorm(1e6,mean=6.5,sd=15),10), N, replace=TRUE),
  str5=sample(c("Y","N"),N,TRUE),
  str6=sample(c("M","F"),N,TRUE),
  int1=sample(ceiling(rexp(1e6)), N, replace=TRUE),
  int2=sample(N,N,replace=TRUE)-N/2
)
set.seed(21)
DT <- DTn(5e7)

fwrite(DT,"datafile.csv")

mb.read <- microbenchmark(data.table_fread = fread("datafile.csv"),
                          base_read.csv = read.csv("datafile.csv"),
                          readr_read_csv = read_csv("datafile.csv"),
                          times = 1)

mb.write <- microbenchmark(data.table_fwite = fwrite(DT,"datafile.csv"),
                          base_write.csv = write.csv(DT,"datafile.csv", row.names = FALSE),
                          readr_write_csv = write_csv(DT,"datafile.csv"),
                          times = 1)

print(mb.read, order = "min")
print(mb.write, order = "min")

