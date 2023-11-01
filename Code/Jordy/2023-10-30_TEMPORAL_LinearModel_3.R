load("../data/2023-10-19_TEMPORAL_Limnosat_May_Oct_Lagos_Filtered.RData")

sub_temporal_yravgdWL<-data.frame()
temporal_yravgdWL<-data.frame()

lm_model_results<-data.frame(lake_nhdid=character(), lm_yint=numeric(), lm_pval=numeric(), lm_rsq=numeric(),lm_slope=numeric(), resid_yint=numeric(), resid_pval=numeric(), resid_rsq=numeric(),resid_slope=numeric())


i=20001
j=1
for(i in 20001:30000){
        sub<-temporal[temporal$lake_nhdid==unique(temporal$lake_nhdid)[i],]
        for(j in 1:length(unique(sub$year))){
                sub2<-sub[sub$year==unique(sub$year)[j],]
                sub2[1,]$dWL<-mean(sub2$dWL)
                sub_temporal_yravgdWL<-rbind(sub_temporal_yravgdWL,sub2[1,])
        }
        
        temp_lm<-lm(sub_temporal_yravgdWL$dWL~sub_temporal_yravgdWL$year)
        sub_temporal_yravgdWL$residuals<-abs(temp_lm$residuals)
        resid_lm<-lm(sub_temporal_yravgdWL$residuals~sub_temporal_yravgdWL$year)
        
        lm_model_results<- rbind(lm_model_results,data.frame(lake_nhdid=unique(temporal$lake_nhdid)[i], lm_yint=summary(temp_lm)$coefficients[1,1], lm_pval=summary(temp_lm)$coefficients[2,4], lm_rsq=summary(temp_lm)$r.squared, lm_slope=summary(temp_lm)$coefficients[2,1], resid_yint=summary(resid_lm)$coefficients[1,1], resid_pval=summary(resid_lm)$coefficients[2,4], resid_rsq=summary(resid_lm)$r.squared,resid_slope=summary(resid_lm)$coefficients[2,1]))
        
        temporal_yravgdWL<-rbind(temporal_yravgdWL,sub_temporal_yravgdWL)
        rm(sub_temporal_yravgdWL)
        sub_temporal_yravgdWL<-data.frame()
        print(i)
}


rm(list=setdiff(ls(), "lm_model_results","temporal_yravgdWL"))
save.image(paste0(Sys.Date(),"TEMPORAL_LinearModelOutput_3.Rdata"))
