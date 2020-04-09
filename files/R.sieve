  Listing of: sieve
  Located in: /home/hrapgc/Rstuff/lisa/ethylformat/PNZ
Last updated: 24/11/2015 
**************************************

sieve <-
structure(function(xx = semicomLBAM.df, out.xls = "PredictionLBAM_SemiCommercial_EF4.xls")
{
### Purpose:- sieves out the mortalities for semicommercial data
### ----------------------------------------------------------------------
### Modified from:- 
### ----------------------------------------------------------------------
### Arguments:- 
### ----------------------------------------------------------------------
### Author:-   Patrick Connolly, Date:- 29 Sep 2015, 14:35
### ----------------------------------------------------------------------
### Revisions:-
  
  is.egg <- grep("egg", levels(xx$Lifestage), ignore.case = TRUE,value = TRUE)
  xx <- within(xx, IsEgg <- Lifestage%in%is.egg)
  is.scale <- grep("OS", levels(xx$SLS), ignore.case = TRUE,value = TRUE)
  xx <- within(xx, IsScale <- SLS%in%is.scale)
  xx <- xx[!is.na(xx$Total), ] # won't total unless
  xx <- within(xx, Temp <- paste0(Temperature, "C"))
  xx <- within(xx, Hours <- paste0(Duration, "h"))

  ## Define what is dead
  xx <- within(xx, Dead[IsScale] <- Dead[IsScale] + Moribund[IsScale])
  xx <- within(xx, Ndx <- paste(SLS, substring(Fruit, 1, 1), Efnom, Temp, Hours, sep = "|"))
  xx <- within(xx, Ndx <- factor(Ndx))
  xx <- within(xx, dead <- Dead)
  xx <- within(xx, dead[IsEgg] <- Unhatched[IsEgg])
  xx <- within(xx, Mort <- dead/Total)

  glm.xx <- glm(cbind(dead, Total - dead) ~ Ndx, data = xx, family = binomial(link = "cloglog"))
  xx.pred <- predict.glm(glm.xx, newdata = data.frame(Ndx = sort(unique(xx$Ndx))), se.fit = TRUE)
  pred.xx.lo <- xx.pred$fit + xx.pred$se.fit * qt(.025, with(xx, table(Ndx)) - 1)
  pred.xx.hi <- xx.pred$fit + xx.pred$se.fit * qt(.975, with(xx, table(Ndx)) - 1)
  
  pred.mat <- round(100 * cbind(Lower = cloglog.bt(pred.xx.lo), Upper = cloglog.bt(pred.xx.hi)),1)
  pred.df <- as.data.frame(pred.mat)
  pred.df <- within(pred.df, StageTreat <- rownames(pred.df))
  pred.df <- within(pred.df, SpeciesStage <- getbit(StageTreat,  "\\|", 1))
  pred.df <- within(pred.df, fruit <- getbit(StageTreat,  "\\|", 2))
  pred.df <- within(pred.df, Treatment <- getbit(StageTreat,  "\\|", 3))
  pred.df <- within(pred.df, temp <- getbit(StageTreat,  "\\|", 4))
  pred.df <- within(pred.df, duration <- getbit(StageTreat,  "\\|", 5))
  pred.df <- within(pred.df, Temp <- as.numeric(gsub("C", "", temp)))
  pred.df <- within(pred.df, Duration <- as.numeric(gsub("h", "", duration)))
  pred.df$Fruit <- NA
  pred.df <- within(pred.df, Fruit[fruit == "A"] <- "apple")
  predict.df <- within(pred.df, Fruit[fruit == "K"] <- "kiwifruit")

  out.df <- predict.df %>%
    arrange(SpeciesStage, Fruit, Temp, Duration) %>%
      select(SpeciesStage, Treatment, Fruit, Temp, Duration, Lower, Upper)

##   xx %>% select(SLS, Efnom, Temp, Sample, Mort)%>%
##     arrange(SLS, Efnom, Temp) %>%
##       group_by(SLS, Efnom, Temp) %>%
##         summarise(mean(Mort)) 

  require("WriteXLS")

  WriteXLS(x = "out.df", out.xls, "predicted 95% CI",
           BoldHeaderRow = TRUE, FreezeRow = 3, FreezeCol = 2)
  out.df  
  

}, comment = "24/11/2015")
