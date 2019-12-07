# Statistical power

_AUTO MARKED_: For exercises 1-4, allow addition/removal of spaces, carriage returns, and zeros preceding decimal points. Exercise 5 is optional so allow any non-null entry.

## Exercise 1

Copy and paste the R command for estimating required sample size for a between-subjects design into the box below:

----

```
pwr.t.test(power = .8, d = .5, type = "two.sample", alternative = "two.sided", sig.level = .05)
```

----

## Exercise 2

Copy and paste the R command for estimating statistical power for a between-subjects design into the box below:

----

```
pwr.t.test(n = 20, d = .5, type = "two.sample", alternative = "two.sided", sig.level = .05)
```

----

## Exercise 3

Copy and paste the R command for estimating required sample size for a within-subjects design into the box below:

----

```
pwr.t.test(power = .8, d = .5, type = "paired", alternative = "two.sided", sig.level = .05)
```

----

## Exercise 4

Copy and paste the R command for estimating required effect size for a within-subjects design into the box below:

----

```
pwr.t.test(power = .8, n = 25, type = "paired",  alternative = "two.sided", sig.level = .05)
```

----

## Exercise 5

Copy and paste the R commands to recreate the graph in the worksheet. This part of the exercise is optional. If you chose not to complete it, write words to that effect in the box below instead.

----

For a model answer  see the [source code](https://github.com/ajwills72/rminr/blob/master/src/power.Rmd) for the worksheet. This particular approach is a bit advanced for this assessment, as they have not yet been taught functions, but something similar could be achieved without them.

----
