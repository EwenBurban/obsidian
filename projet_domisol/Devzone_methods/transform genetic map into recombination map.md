Tag : #Method #Draft
# input format
| chr_phy | phy_pos | chr_gen | gen_pos |
|---|---|---|---|
| physical chr| physical position (in base)| genetic chr | genetic position |
# get cM/Mb
## exemple for 1 chromosome
```{r}
data$phy_pos = data$phy_pos / 1e6

smooth_strengh = 0.4 # choose a value between 0 and 1. The higher is the value, the smoother the map will be
### for each chromosome
sub_data = subset(data,subset = chr_phy == 1)
sm = smooth.line(x=sub_data$phy_pos,y=sub_data$gen_pos,spar=smooth_strengh)

### check if the smooth is enough
predx = seq(0,max(sub_data$phy_pos),by=0.1)
predy = predict(sm,x=predx,deriv=0)$y
plot(sub_data$phy_pos,sub_data$gen_pos,type='p')
points(predx,perdy,col='red')
#### you must obtain a growing monotonous dot line , and the red line must be in the dot line.

### produce the map
pred_deriv = predict(sm,x=predx,deriv=1)$y
plot(predx,pred_deriv)
```