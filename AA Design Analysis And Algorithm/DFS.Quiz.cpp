#include<iostream>
using namespace std;

DFS(G)
{
   for each vertex k element of G.V
      u.color=WHITE
      k.pi=NIL
   time=0
   for each vertex k element of G.V
      if k.color==WHITE
         DFS-VISIT(G;k)
}

DFS-VISIT(G;k)
{
   time=time+1
   k.d=time
   k.color=GRAY
   for each I element of G.adj[k]
      if I.color ==WHITE
         I.pi=k;
         DFS-VISIT(G;I)
      else if I.color ==GRAY
         print k + " -> " I "is the BACK_EDGE"
      else if I.color ==BLACK
         if I.f>k.d
            print k + " -> " I "is the FORWARD_EDGE"
         else if I.f<k.d
            print k + " -> " I "is the CROSS_EDGE"
   k.color=BLACK
   time=time+1
   k.f=time       /finish time

}

int main()
{



   return 0;
}

