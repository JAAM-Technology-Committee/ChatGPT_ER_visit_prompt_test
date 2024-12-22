library(tidyverse)

output_dir = './output/'

df <- read.csv(paste0(output_dir, 'income_distribution.csv'))
df$cleaned_income_range <- factor(df$cleaned_income_range, levels = df$cleaned_income_range[order(df$numbers)])

df2 <- tidyr::pivot_longer(df, cols=c('proportion', 'income_distribution'), names_to='variable', 
                           values_to="value")

income_hist_plot <- ggplot(df2, aes(x=cleaned_income_range, y=value, fill=variable)) +
  geom_bar(stat='identity', position='dodge') +
  scale_fill_manual(
    values = c('proportion' = '#0E4180', 'income_distribution' = '#00B4CE'),
    labels = c('proportion' = 'Study Participants', 
               'income_distribution' = 'Japanese National Standard')
    )+
  labs(title="Income Distribution of Study Participants and Japanese National Standard Population",
       x="Income Brackets (in 10,000 JPY)",
       y="Proportion of Population", fill=NULL) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = -0.4, size = 12),
    axis.title.x = element_text(size = 10),
    axis.title.y = element_text(size = 10),
    axis.text.x = element_text(size = 8),
    legend.text = element_text(size = 8)
  )

income_hist_plot

ggsave(paste0(output_dir, 'fig_sup_1.png'), income_hist_plot, 
       width = 8, height = 4, dpi=300)
