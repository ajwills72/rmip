## Notes:

## 1. These are not OpenSesame files, but the preprocessing is the same.

## 2. Files were adapted from Seabrooke et al. (2019) Experiment 1. This has
## had the side effect that the 30 words presented are sampled from a larger
## pool of 45 words. This is not mentioned in the model answers based on these
## analyses.

## Load packages
library(tidyverse)
library(BayesFactor)

## Load raw data
fnams <- list.files("eg-data", "csv", full.names = TRUE)
data <- NULL
for(fnam in fnams) {
    tmp <- read_csv(fnam)
    tmp <- tmp %>% add_column(subj = substr(fnam, 14, 15), .before = TRUE)
    data <- bind_rows(data, tmp)
}

## Select columns
tidydat <- data %>% select(-Sex, -Age)

## Filter to test phase
testdat <- tidydat %>% filter(Running == "Recall")

## Subject-level summary
testsum <- testdat %>% group_by(subj, Condition) %>% summarise(acc = mean(Acc))

## Overall means
testsum %>% group_by(Condition) %>% summarise(acc = mean(acc))

## Preprocessing for plot
testsum.wide <- testsum %>% pivot_wider(names_from = Condition, values_from = acc)
testsum.wide <- testsum.wide %>% mutate(diff = Meaning - Study)

## Difference density plot
source("themeapa.R")
p <- testsum.wide %>% ggplot(aes(diff)) +
    geom_density(aes(y=..scaled..)) +
    geom_vline(xintercept = 0, colour = 'red') +
    xlab("Accuracy difference P(meaning) - P(study)") +
    ylab("Density (scaled)") +
    theme_APA

ggsave(filename = "fig1.png", plot = p, width = 15, height = 10, units = "cm")

## Identify factors
testsum$subj <- factor(testsum$subj)
testsum$Condition <- factor(testsum$Condition)

## Bayesian ANOVA
anovaBF(formula = acc ~ Condition + subj,
        data = data.frame(testsum),
        whichRandom = "subj")
