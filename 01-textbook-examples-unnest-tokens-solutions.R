# Text Mining with R
# Chapter 1.2 The unnest_tokens function
# https://www.tidytextmining.com/tidytext.html#the-unnest_tokens-function

library(tidyverse)
library(tidytext)
library(dplyr)

# example from Emily Dickinson
text <- c("Because I could not stop for Death -",
          "He kindly stopped for me -",
          "The Carriage held but just Ourselves -",
          "and Immortality")
text

# to turn this text into tidy text data, first we put it into a data frame (tibble here)
text_df <- tibble(line = 1:4, text = text)
text_df

# not quite done, We can’t filter out words or count which occur most frequently, 
# since each row is made up of multiple combined words. 
# We need to convert this so that it has one-token-per-document-per-row
text_df %>%
  unnest_tokens(word, text) %>% 
  count(word, sort = TRUE) # next step is analysis but it makes less sense here



# Example two:
## Try with a new example: https://poets.org/poem/just-say 

text <- c("I have eaten",
          "the plums",
          "that were in",
          "the icebox",
          "and which",
          "you were probably",
          "saving",
          "for breakfast",
          "Forgive me",
          "they were delicious",
          "so sweet",
          "and so cold")

text

##
# to turn this text into tidy text data, first we put it into a data frame (tibble here)
text_df <- tibble(line = 1:12, text = text)
text_df

# not quite done, We can’t filter out words or count which occur most frequently, 
# since each row is made up of multiple combined words. 
# We need to convert this so that it has one-token-per-document-per-row
text_df %>%
  unnest_tokens(word, text) %>% 
  count(word, sort = TRUE)  %>%# next step is analysis but it makes slightly more sense here
  ggplot(aes(x = reorder(word, -n), y = n)) +
  geom_bar(stat = "identity") + 
  theme(axis.text.x=element_text(angle=45, hjust=1))


# BONUS: how to visually display this? 
