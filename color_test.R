
library(tidyverse)
library(glue)


tibble(sentence = sentences) %>%
  extract(sentence, c("article", "noun"), "(a|the) ([^ ]+)", remove = FALSE)
#extract the color and the word after the color.
color_matches <- tibble(sentence = sentences) %>%
  extract(sentence, c("color", "noun"), 
          "(red|orange|yellow|green|blue|purple) ([^ ]+)",
          remove =    FALSE)
#drop all the empty rows.  You can see we pulled out words like "shimmered" and "scared", too!
color_matches <- color_matches %>% drop_na()
color_matches


library(tidyverse)
library(glue)
library(purrr)

extract_color <- function(color) {
  tibble(sentence = sentences) %>%
    extract(sentence,
            c("color", "noun"),
            glue::glue("({color}) ([^ ]+)"),
            remove =    FALSE) %>%
    drop_na(color)
}

all_color_out <-
  purrr::map_df(c("red", "orange", "yellow", "green", "blue", "purple"),
                ~ extract_color(.))

View(all_color_out)
