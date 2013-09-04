#'@name trait_dominant
#'@description identifie le trait dominant
#'@author jcb
#'@param e dataframe
#'@param ties ex-aequo. Si ties=TRUE (défaut) les traits qui ont des valeurs identiques sont 
#'ex-aequo et l'observation se voit attribuer la valeur NA. Si ties=FALSE le résultat dépend
#'de l'ordre dans lequel sont analysée les données
#'@param na.rm est en fait redondant avec ties
#'@return un vecteur contenant les valeurs A, V, K ou NA
#'@details cette fonction est spécifique du programme AVK. Dans le data frame e elle cherche
#'les colonnes A, V et K. Pour chaque ligne, elle isole le trait dominant (c'est à dire pour 
#'une ligne donnée, quelle est celle des 3 colonnes qui a le score de réponse le plus élevé. La
#'lettre correspondante est placée dans la colonne trait. Si deux valeurs sont ex-aeque, le
#'symbole NA est placé dans le colonne trait)
trait_dominant<-function(e,ties=TRUE,na.rm=FALSE){
  for(i in 1:nrow(e)){
    x=max(e[i,c("A","K","V")]);
    # ttt des ex-aequo
    if(ties==TRUE){
      if(e[i,"A"]== x & e[i,"V"]== x
         | e[i,"A"]== x & e[i,"K"]== x
         | e[i,"K"]== x & e[i,"V"]== x
      ){if(na.rm==FALSE){e$trait[i]="NA"}}
      else{
        # si pas d'ex-aequo on détermine le trait
        if(e[i,"A"]== x) {e$trait[i]="A"}
        else if(e[i,"V"] == x) {e$trait[i]="V"}
        else e$trait[i]="K"
      }
    }
    else{
      # si pas d'ex-aequo on détermine le trait
      if(e[i,"A"]== x) {e$trait[i]="A"}
      else if(e[i,"V"] == x) {e$trait[i]="V"}
      else e$trait[i]="K"
    }
    
  }
  return(e$trait)
}