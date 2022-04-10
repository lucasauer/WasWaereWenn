Was wäre, wenn die Residuen in einem Regressionsmodell heteroskedastisch sind?
* Was passiert mit den geschätzten Koeffizienten
* Was passiert mit den Tests? (Fehler 1. Art, Power)



Regression, Fahrmeir et al. 2009 (S. 61):

* Fehler werden im klassischen linearen Modell als homoskedastisch angenommmen
* Erwartungswert der Residuen gleich 0
* Residuen additiv
* Residuen unkorreliert

* In vielen Fällen Annahme normalverteilter Residuen


Regression, Fahrmeir et al. 2009 (S. 64 ff):

* Homoskedastische Varianz der Störgrößen bedeutet, dass die Fehler nicht in Abhängigkeit der Zielgröße bzw. einer oder mehrerer Kovariablen systematisch größer oder kleiner werden. 
* Abbildung S. 65
* Typischer Fall heteroskedastischer Varianzen ist "trichterförmige" Varianz (Streuung um die Regressionsgerade nimmt mit wachsendem x zu). Störgrößen schwanken um 0, werden aber mit wachsendem x immer größer
* Untersuchung der Residuen vergleiche Abschnitt 3.6.4
* Auswirkungen heteroskedastischer Varianzen: Varianzen der geschätzten Regressionskoeffizienten nicht korrekt geschätzt. Dieser Fehler hat Auswirkungen auf Hypothesentests über die Regressionsparameter und deren Konfidenzintervalle (siehe Abschnitt 3.4)


wikipedia: Heteroscedasticity

* invalidates statistical tests of significance (that assume that the modelling errors all have the same variance)
* ordinary least squares estimator still unbiased, but is inefficient
* heteroscedasticity concerns expectations of the second moment of the errors (i.e. variance) (misspecification of the second order)
* Gauss-Markov Theorem does not apply due to heteroscedasticity -> ordinary least squares estimators are not BLUE and their variance is not the lowest among all other unbiased estimators
* can cause ordinary least squares estimates of the variance of model coefficients to be biased
* biased standard errors lead to biased inference (i.e. results of hypothesis tests may be wrong)
* "unequal error variance is worth correcting only when the problem is severe", some econometritian
* For non-linear models (e.g. Logit) more severe consequences, since maximum likelihood estimator is biased and inconsistent
* multivariate case: study of heteroscedasticity has been generalized to the multivariate case


Regression, Fahrmeir et al. 2009 (S. 124 ff):

* Verallgemeinerung des linearen Modells für den Fall heteroskedastischer (und nach wie vor unkorrelierter) Störgrößen 
* W positiv definite Wichtungsmatrix(?) anstelle der Einheitsmatrix
* Auswirkung auf den KQ-Schätzer: Immernoch erwartungstreu für beta, Kovarianzmatrix stimmt nicht mehr mit der aus dem klassischen linearen Modell überein (Damit alle Größen, die sich aus der Kovarianzmatrix berechnen falsch, insb. keine korrekten Varianzen und Standardfehler)
* Eine Lösung: Gewichtete Methode der kleinsten Quadrate (siehe Abschnitt 3.4.2)


Regression, Fahrmeir et al. 2009 (S. 124 ff):

* In ökonometrischer Literatur viele Schätz- und Modellierungsverfahren für den Fall heteroskedastischer Fehler (z.B. Greene, 2000)
* Hier vorgestellte Varianten setzen Kenntnis über die Art der Heteroskedastizität voraus
* Außerdem weiteres Verfahren, bei dem Kenntnis über die Art nicht vorausgesetzt wird (entwickelt von White, 1980)

Wie stellt man heteroskedastische Fehler fest?
* Schätze klassisches lineares Modell und untersuche Residuen (v.a. Residualplots, auch Tests (z.B. Bartlett-Test) möglich (vgl. S. 131))

Maßnahmen bei Heteroskedastizität: Dienen der Vermeidung von Fehlschlüssen durch die Nichtbeachtung der Heteroskedastizität
* Variablentransformation (S. 132)
* Zweistufige Schätzung (S. 133)
* White-Schätzer (S. 135)