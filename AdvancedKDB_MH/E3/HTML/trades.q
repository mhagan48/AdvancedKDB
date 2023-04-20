

\p 6700

kdir:-4_first (system "pwd")
cdir:system"pwd"


.h.HOME:cdir;

.z.ws:{$[0Nj<>cp:first (where x in enlist"\n");res:`$cp#x;res:`$x];
       $[not res in trade[`sym];
         neg[.z.w] "Sym not in trade table, avaliable syms: ",(raze {" ",x}each distinct string[trade[`sym]],"\n");
         neg[.z.w] .Q.s select from trade where sym=res]};

trade:([] sym:20?`IBM`GOOG`XYZ;qty:20?650;px:20?5f);

