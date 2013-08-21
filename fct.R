trait_dominant<-function(e){
  for(i in 1:nrow(e)){
    x=max(e[i,c("A","K","V")]);
    if(e[i,"A"]== x) {e$trait[i]="A"}
    else if(e[i,"V"] == x) {e$trait[i]="V"}
    else e$trait[i]="K"
  }
  return(e$trait)
}