function ris=  MC_04(alpha)
%-------------------------- parameters ------------------------------------
a1=20.33; 
in=[0 a1];
%xv_1= 0.2;               %<<<<< Con.Acc motion curve parameters
%xv_1=0;                  %<<<<< Cycloidal or cubic motion curve parameters
%xv_1.v=0.33; xv_1.w=0.66; %<<<<< Sshape motion curve parameters


%----------------------------  --------------------------------------- 

if(alpha>=in(1) && alpha<in(2))
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;

        
%---------------------------- dwell ---------------------------------------
else 
    ris.pos=0.000001;
    ris.vel=0;
    ris.acc=0;

end