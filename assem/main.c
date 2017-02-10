#include <stdio.h>

int printEquation(int x,int y,int z,int a , int b, int c);
int printFamily();
int printPid();
int main(int argc, char **argv)
{
 printf("%d\n", printFamily());
 printf("%d\n",printPid());
 printf("%d\n",printEquation(1,2,3,1,2,3));
  return 0;
}
