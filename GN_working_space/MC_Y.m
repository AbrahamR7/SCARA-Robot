function ris=MC_Y(alpha)
%-------------------------- parameters ------------------------------------
a1=6.3; a2=7.76; a3=9.37; a4=10.78; a5=20.33; 
in=[0 a1 a2 a3 a4 a5];
%xv_1= 0.2;               %<<<<< Con.Acc motion curve parameters
%xv_1=0;                  %<<<<< Cycloidal or cubic motion curve parameters
%xv_1.v=0.33; xv_1.w=0.66; %<<<<< Sshape motion curve parameters



    %---------------------------- rise ----------------------------------------

if(alpha>= in(1) && alpha < in(2)) 
    h1=16;
    da=(in(2)-in(1));
    alpha_ad=(alpha-in(1))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
    %out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
    out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=-15+h1*out.pos;
    ris.vel=h1/deg2rad(da)*out.vel;
    ris.acc=h1/(deg2rad(da))^2*out.acc;

  %---------------------------- rise ----------------------------------------

elseif(alpha>= in(2) && alpha < in(3)) 
    h1=13;
    da=(in(3)-in(2));
    alpha_ad=(alpha-in(2))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
    %out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
    out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=1+h1*out.pos;
    ris.vel=h1/deg2rad(da)*out.vel;
    ris.acc=h1/(deg2rad(da))^2*out.acc;
        %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(3) && alpha<in(4))
    h5=13;
    da=(in(4)-in(3));
    alpha_ad=(alpha-in(3))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=14-h5*out.pos;
    ris.vel=-h5/deg2rad(da)*out.vel;
    ris.acc=-h5/(deg2rad(da))^2*out.acc; 
        %---------------------------- rise ----------------------------------------
        

elseif(alpha>= in(4) && alpha < in(5)) 
    h4=13;
    da=(in(5)-in(4));
    alpha_ad=(alpha-in(4))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve
    % out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve
    % out=McmSshape(alpha_ad,xv_1);                  %Sshape motion curve 
      out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=1+h4*out.pos;
    ris.vel=h4/deg2rad(da)*out.vel;
    ris.acc=h4/(deg2rad(da))^2*out.acc;
         %---------------------------- fall --------------------------------------- 

elseif(alpha>=in(5) && alpha<in(6))
    h5=29;
    da=(in(6)-in(5));
    alpha_ad=(alpha-in(5))/da;
    % out=McmConstantAcceleration(alpha_ad,xv_1);  %Con.Acc motion curve ...
    %  out=McmCubic(alpha_ad,xv_1);                 %cubic motion curve ...
    % out=McmCycloidal(alpha_ad,xv_1);             %Cycloidal motion curve 
    % out=McmSshape(alpha_ad,xv_1);                %Sshape motion curve 
     out=McmModified_trapezoidal(alpha_ad);       %Modified_trapezoidal motion curve
    ris.pos=14-h5*out.pos;
    ris.vel=-h5/deg2rad(da)*out.vel;
    ris.acc=-h5/(deg2rad(da))^2*out.acc; 


%---------------------------- dwell ---------------------------------------
else 
    ris.pos=-15;
    ris.vel=0;
    ris.acc=0;

end
