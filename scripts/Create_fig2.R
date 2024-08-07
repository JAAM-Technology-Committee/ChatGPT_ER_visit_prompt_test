library(tidyverse)

output_dir = './output/'

# Sample data
data.red <- data.frame(
  Category = rep(c("Laypersons", "Emergency specialists"), each = 2),
  Subcategory = rep(c("Incorrect", "Correct"), 2),
  Value = c(72+107, 77+58, 314-303, 303)
)

data.red$Category <- data.red$Category %>% as.factor
data.red$Category <- relevel(data.red$Category, ref = 'Laypersons')

data.red$Subcategory <- data.red$Subcategory %>% as.factor
data.red$Subcategory <- relevel(data.red$Subcategory, ref = 'Incorrect')


data.green <- data.frame(
  Category = rep(c("Laypersons", "Emergency specialists"), each = 2),
  Subcategory = rep(c("Incorrect", "Correct"), 2),
  Value = c(38+65, 12+37, 152-135, 135)
)

data.green$Category <- data.green$Category %>% as.factor
data.green$Category <- relevel(data.green$Category, ref = 'Laypersons')

data.green$Subcategory <- data.green$Subcategory %>% as.factor
data.green$Subcategory <- relevel(data.green$Subcategory, ref = 'Incorrect')

# Normalize values to sum up to 100% within each category
data.red <- data.red %>%
  group_by(Category) %>%
  mutate(Percentage = Value / sum(Value) * 100)

data.green <- data.green %>%
  group_by(Category) %>%
  mutate(Percentage = Value / sum(Value) * 100)

# Plot
fig2_1 <- ggplot(data.red, aes(x = Percentage, y = Category, fill = Subcategory)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_manual(values = c("#D0312D", "#E68F8C"),
                    breaks = c("Correct", "Incorrect")) +
  labs(x = "Percentage", y = "", title = "Reviewers Interpreting Red-Tag Outputs as Emergency Visits") +
  scale_x_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white", color = NA),
        plot.background = element_rect(fill = "white", color = NA),
        plot.title = element_text(size = 12, hjust = 0.5),
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        legend.text = element_text(size = 8),
        legend.title = element_text(size = 10)) +
  guides(fill = guide_legend(title = NULL))

fig2_1
ggsave(paste0(output_dir, 'fig2-1.png'), fig2_1, 
       width = 6, height = 2.5, dpi=300)

ggsave(paste0(output_dir, 'fig2-1.tiff'), fig2_1, 
       width = 6, height = 2.5, dpi=300)

fig2_2 <- ggplot(data.green, aes(x = Percentage, y = Category, fill = Subcategory)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_manual(values = c("#5D9C59", "#C7E8CA"),
                    breaks = c("Correct", "Incorrect")) +
  labs(x = "Percentage", y = "", title = "Reviewers Interpreting Green-Tag Outputs as Non-Urgent") +
  scale_x_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white", color = NA),
        plot.background = element_rect(fill = "white", color = NA),
        plot.title = element_text(size = 12, hjust = 0.5),
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        legend.text = element_text(size = 8),
        legend.title = element_text(size = 10)) +
  guides(fill = guide_legend(title = NULL))

fig2_2
ggsave(paste0(output_dir, 'fig2-2.png'), fig2_2,
       width = 6, height = 2.5, dpi=300)
ggsave(paste0(output_dir, 'fig2-2.tiff'), fig2_2,
       width = 6, height = 2.5, dpi=300)
