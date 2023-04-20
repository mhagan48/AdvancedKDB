args:.Q.opt .z.x; 
system"l /home/mhagan_kx_com/E1/tick/sym.q";

upd:insert;

t:tables[];

tplog: `$(raze ":",args[`logs],"sym",args[`date]);
hdb: `$(raze ":",args[`hdb]) ;
dt: "D"$(first args[`date]);

part:.Q.dd[.Q.dd[`$(-1_string(hdb));dt];] each t;


-11!tplog;

//file compression 
.z.zd:17 2 6;

{.Q.dpft[hdb;dt;`sym;x]} each t;

//disable compression
.z.zd:3#0;

//uncompress each sym partition

symFile:.Q.dd[;`sym] each part;

{x set get x} each symFile;


//uncompress each time partition

timeFile:.Q.dd[;`time] each part;

{x set get x} each timeFile;

exit 0
