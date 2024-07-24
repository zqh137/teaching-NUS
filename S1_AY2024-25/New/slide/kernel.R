
# Second try:
library(ggplot2)
# Kernel functions
uniform_kernel <- function(u) {
  ifelse(abs(u) <= 1, 0.5, 0)
}

triangular_kernel <- function(u) {
  ifelse(abs(u) <= 1, 1 - abs(u), 0)
}

epanechnikov_kernel <- function(u) {
  ifelse(abs(u) <= 1, 0.75 * (1 - u^2), 0)
}

quartic_kernel <- function(u) {
  ifelse(abs(u) <= 1, (15/16) * (1 - u^2)^2, 0)
}

triweight_kernel <- function(u) {
  ifelse(abs(u) <= 1, (35/32) * (1 - u^2)^3, 0)
}

gaussian_kernel <- function(u) {
  (1 / sqrt(2 * pi)) * exp(-0.5 * u^2)
}

cosine_kernel <- function(u) {
  ifelse(abs(u) <= 1, (pi / 4) * cos(pi * u / 2), 0)
}
# Generate data for plotting
u <- seq(-2, 2, length.out = 1000)
kernels <- data.frame(
  u = rep(u, 7),
  value = c(
    sapply(u, uniform_kernel),
    sapply(u, triangular_kernel),
    sapply(u, epanechnikov_kernel),
    sapply(u, quartic_kernel),
    sapply(u, triweight_kernel),
    sapply(u, gaussian_kernel),
    sapply(u, cosine_kernel)
  ),
  kernel = factor(rep(c("Uniform", "Triangular", "Epanechnikov", "Quartic", "Triweight", "Gaussian", "Cosine"), each = length(u)))
)
# Plot using ggplot2
p <- ggplot(kernels, aes(x = u, y = value, color = kernel)) +
  geom_line() +
  facet_wrap(~ kernel, scales = "free_y") +
  labs(title = "Comparison of Kernel Functions",
       x = "u",
       y = "Kernel Value") +
  theme_minimal() +
  theme(legend.position = "none")
# The facet_wrap function will create separate plots for each kernel type, and theme_minimal is used to give a clean look to the plots.
print(p)

# Plot using ggplot2
p1 <- ggplot(kernels, aes(x = u, y = value, color = kernel, linetype = kernel)) +
  geom_line(size = 1) +
  labs(title = "Comparison of Kernel Functions",
       x = "u",
       y = "Kernel Value",
       color = "Kernel",
       linetype = "Kernel") +
  theme_minimal() +
  theme(legend.position = "right")

# Save the plot as an EPS file
ggsave("kernel_comparison.eps", plot = p1, device = "eps", width = 8, height = 6)

