/**
 * TD2 Exercice 1.2
 *  Pour le compiler : gcc td2_12.c -o td2_12
 *  Pour l'exécuter : ./td2_12
 *  
 *  Résultat : 1, 3, 423
 */

#include <stdio.h>

int i = 0;
int f (int j){ 
  i = i + j;
  return i; 
}

int main(void)
{
  f(1); 
  printf("%d, ", i); 

  f(2); 
  printf("%d, ", i); 

  i=421; 
  f(2); 
  printf("%d \n", i); 

  return 0;
}  
