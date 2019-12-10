## Notes:

## 1. These are not OpenSesame files, but the preprocessing is the same.

## 2. Files were adapted from Seabrooke et al. (2019) Experiment 1. This has
## had the side effect that the 30 words presented are sampled from a larger
## pool of 45 words. This is not mentioned in the model answers based on these
## analyses.

## Load packages
library(tidyverse)
library(BayesFactor)

## Load raw data for Experiment 1
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

## Experiment 2

## Load raw data
fnams <- list.files("eg-data-2", "csv", full.names = TRUE)
data2 <- NULL
for(fnam in fnams) {
    tmp <- read_csv(fnam)
    tmp <- tmp %>% add_column(subj = substr(fnam, 16, 17), .before = TRUE)
    data2 <- bind_rows(data2, tmp)
}

## Select columns
tidydat2 <- data2 %>% select(-Experiment, -Age, -Group, -Gender)

## Filter to test phase
testdat2 <- tidydat2 %>% filter(Running == "Recall")

## Subject-level summary
testsum2 <- testdat2 %>% group_by(subj, Condition) %>% summarise(acc = mean(Acc))

## Overall means
testsum2 %>% group_by(Condition) %>% summarise(acc = mean(acc))

## Preprocessing for plot
testsum2.wide <- testsum2 %>% pivot_wider(names_from = Condition, values_from = acc)
testsum2.wide <- testsum2.wide %>% mutate(diff = Meaning - Study)

## Difference density plot
p <- testsum2.wide %>% ggplot(aes(diff)) +
    geom_density(aes(y=..scaled..)) +
    geom_vline(xintercept = 0, colour = 'red') +
    xlab("Accuracy difference P(meaning) - P(study)") +
    ylab("Density (scaled)") +
    theme_APA

ggsave(filename = "fig2.png", plot = p, width = 15, height = 10, units = "cm")

## Identify factors
testsum2$subj <- factor(testsum2$subj)
testsum2$Condition <- factor(testsum2$Condition)

## Bayesian ANOVA
anovaBF(formula = acc ~ Condition + subj,
        data = data.frame(testsum2),
        whichRandom = "subj")

## Effect size
tresult <- t.test(acc ~ Condition, data = testsum2, paired = TRUE)
t <- abs(tresult$statistic)
t
n <- 25
dz <- t / sqrt(n)
names(dz) <- "dz"
dz

## Power
library(pwr)
pwr.t.test(d = dz, power = .8, alternative = "greater", type = "paired")

## Combine data sets
testsum <- testsum %>% add_column(expt = 1, .before = TRUE)
testsum2 <- testsum2 %>% add_column(expt = 2, .before = TRUE)
alltest <- bind_rows(testsum, testsum2)

## (Re-)declare factors
alltest$expt <- factor(alltest$expt)
alltest$subj <- factor(alltest$subj)

## Factorial ANOVA
bf <- anovaBF(formula = acc ~ expt*Condition + subj,
        data = data.frame(alltest),
        whichRandom = "subj")
bf
## Interaction
bf[4]/bf[3]
