function ris=MC_Z(alpha)
%-------------------------- parameters ------------------------------------
a1=42.5; a2=62; a3=138; a4=153; a5=228; a6=243; a7=319; a8=360; 
in=[0 a1 a2 a3 a4 a5 a6 a7 a8];
%xv_1= 0.2;               %<<<<< Con.Acc motion curve parameters
%xv_1=0;                  %<<<<< Cycloidal or cubic motion curve parameters
xv_1.v=0.33; xv_1.w=0.66; %<<<<< Sshape motion curve parameters


%---------------------------- fall --------------------------------------- 

if(alpha>=in(1) && alpha<in(2))
    h1=10;
    da=(in(2)-in(1));
    alpha_ad=(alpha-in(1))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-h1*out.pos;
    ris.vel=-h1/deg2rad(da)*out.vel;
    ris.acc=-h1/(deg2rad(da))^2*out.acc;  
    %---------------------------- rise ----------------------------------------

elseif(alpha>= in(2) && alpha < in(3)) 
    h2=5;
    da=(in(3)-in(2));
    da2=da/2;
    alpha_ad=(alpha-in(2))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
   %  out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
   out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-10+h2*out.pos;
    ris.vel=h2/deg2rad(da)*out.vel;
    ris.acc=h2/(deg2rad(da))^2*out.acc;
    %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(3) && alpha<in(4))
    h3=5;
    da=(in(4)-in(3));
    alpha_ad=(alpha-in(3))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
   % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-5-h3*out.pos;
    ris.vel=-h3/deg2rad(da)*out.vel;
    ris.acc=-h3/(deg2rad(da))^2*out.acc;  
        %---------------------------- rise ----------------------------------------

elseif(alpha>= in(4) && alpha < in(5)) 
    h4=5;
    da=(in(5)-in(4));
    da2=da/2;
    alpha_ad=(alpha-in(4))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
    % out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
       out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-10+h4*out.pos;
    ris.vel=h4/deg2rad(da)*out.vel;
    ris.acc=h4/(deg2rad(da))^2*out.acc;
        %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(5) && alpha<in(6))
    h5=5;
    da=(in(6)-in(5));
    alpha_ad=(alpha-in(5))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
     % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-5-h5*out.pos;
    ris.vel=-h5/deg2rad(da)*out.vel;
    ris.acc=-h5/(deg2rad(da))^2*out.acc; 
            %---------------------------- rise ----------------------------------------

elseif(alpha>= in(6) && alpha < in(7)) 
    h6=5;
    da=(in(7)-in(6));
    da2=da/2;
    alpha_ad=(alpha-in(6))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
    % out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
      out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-10+h6*out.pos;
    ris.vel=h6/deg2rad(da)*out.vel;
    ris.acc=h6/(deg2rad(da))^2*out.acc;
            %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(7) && alpha<in(8))
    h7=2;
    da=(in(8)-in(7));
    alpha_ad=(alpha-in(7))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
  %   out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
    out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-5-h7*out.pos;
    ris.vel=-h7/deg2rad(da)*out.vel;
    ris.acc=-h7/(deg2rad(da))^2*out.acc; 
    %---------------------------- rise ----------------------------------------

elseif(alpha>= in(8) && alpha < in(9)) 
    h8=7;
    da=(in(9)-in(8));
    alpha_ad=(alpha-in(8))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
   %  out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
       out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-7+h8*out.pos;
    ris.vel=h8/deg2rad(da)*out.vel;
    ris.acc=h8/(deg2rad(da))^2*out.acc;
        
%---------------------------- dwell ---------------------------------------
else 
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;

end
