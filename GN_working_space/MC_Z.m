function ris=MC_Z(alpha)
%-------------------------- parameters ------------------------------------
a1=6.32; a2=10.78; a3=20.33; 
in=[0 a1 a2 a3];
%xv_1= 0.2;               %<<<<< Con.Acc motion curve parameters
%xv_1=0;                  %<<<<< Cycloidal or cubic motion curve parameters
%xv_1.v=0.33; xv_1.w=0.66; %<<<<< Sshape motion curve parameters



    %---------------------------- rise ----------------------------------------

if(alpha>= in(1) && alpha < in(2)) 
    h1=10;
    da=(in(2)-in(1));
    alpha_ad=(alpha-in(1))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
    %out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
    out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=h1-h1*out.pos;
    ris.vel=h1/deg2rad(da)*out.vel;
    ris.acc=h1/(deg2rad(da))^2*out.acc;
    
    %---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(2) && alpha<=in(3))
    da=(in(3)-in(2));
    alpha_ad=(alpha-in(2))/da;
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;
    %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(3) && alpha<in(4))
    h3=10;
    da=(in(4)-in(3));
    alpha_ad=(alpha-in(3))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=h3*out.pos;
    ris.vel=-h3/deg2rad(da)*out.vel;
    ris.acc=-h3/(deg2rad(da))^2*out.acc;  
         
%---------------------------- dwell ---------------------------------------
else 
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;

end
