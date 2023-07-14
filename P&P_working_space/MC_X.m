function ris=MC_X(alpha)
%-------------------------- parameters ------------------------------------
a1=42.5; a2=62; a3=138; a4=153; a5=228; a6=243; a7=319; a8=360; 
in=[0 a1 a2 a3 a4 a5 a6 a7 a8];
%xv_1= 0.2;               %<<<<< Con.Acc motion curve parameters
%xv_1=0;                  %<<<<< Cycloidal or cubic motion curve parameters
xv_1.v=0.33; xv_1.w=0.66; %<<<<< Sshape motion curve parameters


%---------------------------- fall --------------------------------------- 

if(alpha>=in(1) && alpha<in(2))
    h1=5;
    da=(in(2)-in(1));
    alpha_ad=(alpha-in(1))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=25+h1-h1*out.pos;
    ris.vel=-h1/deg2rad(da)*out.vel;
    ris.acc=-h1/(deg2rad(da))^2*out.acc;  
%---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(2) && alpha<=in(3))
    da=(in(3)-in(2));
    alpha_ad=(alpha-in(2))/da;
    ris.pos=25;
    ris.vel=0;
    ris.acc=0;
    %---------------------------- rise ----------------------------------------

elseif(alpha>= in(3) && alpha < in(4)) 
    h2=5;
    da=(in(4)-in(3));
    da2=da/2;
    alpha_ad=(alpha-in(3))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
   % out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
    out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=25+h2*out.pos;
    ris.vel=h2/deg2rad(da)*out.vel;
    ris.acc=h2/(deg2rad(da))^2*out.acc;
    %---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(4) && alpha<=in(5))
    da=(in(5)-in(4));
    alpha_ad=(alpha-in(4))/da;
    ris.pos=30;
    ris.vel=0;
    ris.acc=0;
        %---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(5) && alpha<=in(6))
    da=(in(6)-in(5));
    alpha_ad=(alpha-in(5))/da;
    ris.pos=30;
    ris.vel=0;
    ris.acc=0;

        %---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(6) && alpha<=in(7))
    da=(in(7)-in(6));
    alpha_ad=(alpha-in(6))/da;
    ris.pos=30;
    ris.vel=0;
    ris.acc=0;
            %---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(7) && alpha<=in(8))
    da=(in(8)-in(7));
    alpha_ad=(alpha-in(7))/da;
    ris.pos=30;
    ris.vel=0;
    ris.acc=0;
            %---------------------------- dwell ---------------------------------------    
elseif(alpha>=in(9) && alpha<=in(8))
    da=(in(9)-in(8));
    alpha_ad=(alpha-in(8))/da;
    ris.pos=30;
    ris.vel=0;
    ris.acc=0;

else 
    ris.pos=30;
    ris.vel=0;
    ris.acc=0;

end
