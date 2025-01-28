library(ggplot2)
library(gganimate)

set.seed(12345)

# flip a fair coin
# if the coin lands heads, then we call it a success
# flip again and count the number of consecutive heads
# do it 5000 times
# at each step compute the share of heads

mu <- c()
sample <- c()
for (n in 1:5000) { 
  consecutive_heads <- c()  
  while (rbinom(1, 1, 0.5) == 1) {  
      consecutive_heads <- c(consecutive_heads, 1)
  }
  consecutive_heads <- c(consecutive_heads,0)
  sample <- c(sample, consecutive_heads)
  mu <- c(mu, mean(sample))  
}

df <- data.frame(
  sample_size = 1:5000,
  mu = mu
)

df$frame <- 1:nrow(df)  

animated_plot <- ggplot(df, aes(x = sample_size, y = mu)) +
  geom_line(color = "red", size = 0.5) + 
  geom_hline(yintercept = 0.5, color = "blue", linetype = "dashed", size = 0.5) + 
  geom_hline(yintercept = 0.525, color = "blue", linetype = "dashed", size = 0.5) + 
  geom_hline(yintercept = 0.475, color = "blue", linetype = "dashed", size = 0.5) + 
  scale_x_continuous(
    breaks = c(1, 1000, 2000, 3000, 4000, 5000),  
    limits = c(1, 5000)  
  ) +
  scale_y_continuous(
    breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1),  
    limits = c(0, 1)  
  ) +
  labs(
    x = "Sample Size",
    y = "Proportion of Heads"
  ) + 
  theme_minimal(base_size = 10) + 
  theme(
    panel.grid = element_blank(),  
    panel.background = element_blank(),  
    axis.line = element_line(color = "black", size = 0.5)  
  ) +
  transition_reveal(frame)  
animate(animated_plot, fps = 20, width = 800, height = 400, renderer = av_renderer("mu_animation.mp4"))

