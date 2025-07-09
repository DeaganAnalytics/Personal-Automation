# A function that takes R code and aligns the piping formatting

def format_piped_code(text):
    lines = text.split('\n')

    if len(lines) > 1:
        # Find the position of the variable before the assignment
        assignment_pos = lines[0].find('<-')
        if assignment_pos != -1:
            # Calculate the length of the variable before <-
            variable_length = len(lines[0][:assignment_pos].strip())
            # Calculate the spaces required
            spaces_needed = variable_length + 4

            # Process lines after the first one
            for i in range(1, len(lines)):
                line = lines[i]
                # Add spaces based on the calculated length
                lines[i] = ' ' * spaces_needed + line.lstrip()

    return '\n'.join(lines)

# Example R code
r_code = '''\
chart <- c2_data %>% 
         ggplot(aes(x = performance_date, y = `1Year`)) +
         geom_col(colour = "dark blue", fill = "dark blue", width = 0.8) +
         scale_y_continuous(labels = scales::percent, limits = c(min(c2_data$labels) - 0.05, max(c2_data$labels) + 0.05)) +
         geom_hline(yintercept = c2_incep_return / 100, colour = "#3DB5E6", linewidth = 1.3, alpha = 0.75) +
         annotate("text", x = nrow(c2_data) + 1, y = c2_incep_return / 100, 
                  label = paste0("Since\ninception\nreturn\nis ", sprintf("%.1f", c2_incep_return), "%"), 
                     hjust = 0, family = font_fsa, size = 2.8) +
            geom_text(aes(label = paste0(sprintf("%.1f", 100 * `1Year`), "%"), y = labels), family = font_fsa, size = 2.8) +
            scale_x_discrete() +
            theme(panel.background = element_rect(fill = "white"),
                  panel.grid.major.x = element_blank(),
                  panel.grid.major.y = element_line(colour = "grey"),
                  axis.line.x = element_line(colour = "grey50"),
                  axis.text = element_text(family = font_fsa, colour = "black", size = 8),
                  axis.text.x = element_text(angle = 45, hjust = 1),
                  axis.title = element_blank(),
                  axis.ticks.y = element_blank(),
                  plot.margin = margin(0.3, 2, 0, 0, "cm")) +
            coord_cartesian(xlim = c(1, nrow(c2_data)), clip = "off") # This focuses the x-axis on the range of interest
'''

aligned_code = format_piped_code(r_code)
print(aligned_code)
