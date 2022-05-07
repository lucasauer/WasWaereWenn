## Simulationsstudie

library(lmtest)

## Fragen: 
##  Soll Fehlerfunktion die Std.abw. oder die Varianz sein?
##  standardized/studentized residuals?

## Erste Ideen fuer Simulation
sim <- function(p = 1, beta = rep(1, p), err_fun = function(X, beta) 1) {
  ## Sollte Dimension von beta nicht gleich p sein, werde Fehler
  if(length(beta) != p) stop("length of beta must correspond to amount of parameters")
  
  ## Erstelle Designmatrix, Fehler und tatsaechliches y
  X <- matrix(rnorm(p * 1000), ncol = p)
  err <- rnorm(1000, 0, (err_fun(X, beta))^2)
  y <- X %*% beta + err
  
  ## Fitte lineares Modell, berechne Residuen
  limo <- lm(y ~ X)
  pred <- predict(limo)
  res <- y - pred
  
  ## Plotte y gegen angepasste Werte und Residuen gegen angepasste Werte
  par(mfrow = c(1, 2))
  plot(pred, y, main = "y vs. fitted values", 
       xlab = "Fitted values", ylab = "y")
  plot(pred, res, main = "Residuals vs. fitted values", 
       xlab = "Fitted values", ylab = "Residuals")
  par(mfrow = c(1, 1))
  
  ## Ausgabe des RMSE als Guetemass fuer das Modell, des Mittelwerts der
  ##  Residuen (sollte 0 sein), der Varianz der Residuen und des p-Wertes
  ##  des Breusch-Pagan-Tests zur Identifikation von Heteroskedastizitaet
  list("RMSE" = sqrt(sum((y - limo$fitted.values)^2)),
       "Mean of residuals" = mean(res),
       "Variance of residuals" = drop(var(res)),
       "p-value BP-Test" = unname(bptest(limo, studentize = FALSE)$p.value))
}

sim()

## p = 1, Fehlerfunktion quadratisch
err1 <- function(X, beta) (X %*% beta)^2
sim(err_fun = err1)

## p = 3, Fehlerfunktion quadratisch
sim(p = 3, err_fun = err1)

## p = 10, Fehlerfunktion quadratisch
sim(p = 10, err_fun = err1)


## p = 1, Fehlerfunktion die Wurzel des quadr. Zsmh. von X und beta
err2 <- function(X, beta) sqrt(err1(X, beta))
sim(err_fun = err2)

## p = 3, Fehlerfunktion quadratisch
sim(p = 3, err_fun = err2)

## p = 10, Fehlerfunktion quadratisch
sim(p = 10, err_fun = err2)


## Fehlerfunktion sinus
# BP-Test erkennt hier keine Heteroskedastizitaet (zumindest nicht konsistent)
err3 <- function(X, beta) sin(X %*% beta)
sim(err_fun = err3)

## p = 3, Fehlerfunktion quadratisch
sim(p = 3, err_fun = err3)

## p = 10, Fehlerfunktion quadratisch
sim(p = 10, err_fun = err3)


## Fehlerfunktion X %*% beta
err4 <- function(X, beta) X %*% beta
sim(err_fun = err4)

## p = 3, Fehlerfunktion quadratisch
sim(p = 3, err_fun = err4)

## p = 10, Fehlerfunktion quadratisch
sim(p = 10, err_fun = err4)


## Fehlerfunktion X %*% beta
err5 <- function(X, beta) 3 * X
sim(err_fun = err5)

## p = 3, Fehlerfunktion quadratisch
sim(p = 3, err_fun = err5)

## p = 10, Fehlerfunktion quadratisch
sim(p = 10, err_fun = err5)



