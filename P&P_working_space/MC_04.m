function ris=  MC_04(alpha)
%-------------------------- parameters ------------------------------------
a1=42.5; a2=62; a3=138; a4=153; a5=228; a6=243; a7=319; a8=360; 
in=[0 a1 a2 a3 a4 a5 a6 a7 a8];
%xv_1= 0.2;               %<<<<< Con.Acc motion curve parameters
%xv_1=0;                  %<<<<< Cycloidal or cubic motion curve parameters
xv_1.v=0.33; xv_1.w=0.66; %<<<<< Sshape motion curve parameters


%----------------------------  --------------------------------------- 

if(alpha>=in(1) && alpha<in(2))
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;
    %---------------------------- rise ----------------------------------------

elseif(alpha>= in(2) && alpha < in(3)) 
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;
    %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(3) && alpha<in(4))
    h3=90;
    da=(in(4)-in(3));
    alpha_ad=(alpha-in(3))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-h3*out.pos;
    ris.vel=deg2rad(-h3)/deg2rad(da)*out.vel;
    ris.acc=deg2rad(-h3)/(deg2rad(da))^2*out.acc;  
        %---------------------------- rise ----------------------------------------

elseif(alpha>= in(4) && alpha < in(5)) 
    ris.pos=-90;
    ris.vel=0;
    ris.acc=0;
        %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(5) && alpha<in(6))
    ris.pos=-90;
    ris.vel=0;
    ris.acc=0;
            %---------------------------- rise ----------------------------------------

elseif(alpha>= in(6) && alpha < in(7)) 
    ris.pos=-90;
    ris.vel=0;
    ris.acc=0;
            %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(7) && alpha<in(8))
    h7=90;
    da=(in(8)-in(7));
    alpha_ad=(alpha-in(7))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-90-h7*out.pos;
    ris.vel=-deg2rad(-h7)/deg2rad(da)*out.vel;
    ris.acc=deg2rad(-h7)/(deg2rad(da))^2*out.acc; 
    %---------------------------- rise ----------------------------------------

elseif(alpha>= in(8) && alpha < in(9)) 
    ris.pos=-180;
    ris.vel=0;
    ris.acc=0;
        
%---------------------------- dwell ---------------------------------------
else 
    ris.pos=-180;
    ris.vel=0;
    ris.acc=0;

end