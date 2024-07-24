# radian 
library()
library(MASS)
library(npreg) #load 'npreg' for spline using ss
y=mcycle$accel
x=mcycle$times
rsfit.ss <- ss(x, y, nknots = 10)
rsfit.smsp <- smooth.spline(x,y, nknot = 10)
# % print the raw data and save as a eps figure
# setEPS()
# postscript("MotocycleData.eps")
# plot(x,y, col = "blue", main = "Motocycle Data", sub = "crashed effects after a stimulated impact", xlab = "Time", ylab = "acceleration")
# dev.off()
#regression spline fit
# linear_fit <- lm(y ~ x)
# summary(linear_fit)
# abline(linear_fit)
# setEPS()
# postscript("splinefit.eps")
png(file = "splinefit.png")
plot(rsfit.ss, ylim=range(y), xlim = range(x), lty = 2, col = "red", main = "Regression Spline Fit (m=3)")
points(x,y, col = "blue", sub = "crashed effects after a stimulated impact", xlab = "Time", ylab = "acceleration")
lines(rsfit.smsp, lty = 4, col = "green")
# legend("topright", legend = c("Raw Data","RS Fit","95 CI"))
dev.off()
