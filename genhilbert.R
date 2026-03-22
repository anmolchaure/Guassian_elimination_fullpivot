getwd()
setwd("/home/robin/Documents/numerical_methods/seminar3")
data <- read.table("genhilbert_error.dat", header=FALSE, skip=1, col.names=c("n", "error_inf"))
print(data)
plot(data$n, log10(data$error_inf),
     type = "b",
     pch  = 19,
     xlab = "matrix size n",
     ylab = "log10(error)",
     main = "Hilbert matrix error growth")

abline(h = 0, col = "red", lty = 2)

