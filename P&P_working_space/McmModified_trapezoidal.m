function ris=McmModified_trapezoidal(alpha_ad)
delta1=0.125;delta2=0.25;delta3=0.125;delta4=0;delta5=0.125;delta6=0.25;delta7=0.125;
S=2/pi;
in=[delta1 delta2 delta3 delta4 delta5 delta6 delta7];
a11=S*in(1)+in(2)+S*in(3);
a12=-1*S*in(5)-in(6)-(S*in(7));
a21=S*in(1)*(in(1)*(1-S)+0.5*in(2))+(S*in(1)+in(2))*(0.5*in(2)+in(3)*(1-S))+(S*in(1)+in(2)+S*in(3))*(S*in(3)+in(4)+S*in(5));
a22=(S*in(7)+in(6))*(in(5)*(1-S)+0.5*in(6))+S*in(7)*(0.5*in(6)+(1-S)*in(7));
A=(-1)*a12/(a11*a22-a12*a21);
B=a11/(a11*a22-a12*a21);
a1=in(1);a2=a1+in(2);a3=a2+in(3);a4=a3+in(4);a5=a4+in(5);a6=a5+in(6);a7=sum(in);
v_y1=A*S*in(1);%velocity at stage 1
   p_y1=A*S*(in(1)^2)*(1-S);%position at stage 1
 v_y2=v_y1+A*in(2);%velocity at stage 2
    p_y2=p_y1+A*in(2)*(S*in(1)+0.5*in(2));% position at stage 2
 v_y3=v_y2+A*S*in(3);%velocity at stage 3
    p_y3=p_y2+A*in(3)*(S*in(1)+in(2)+(S^2)*in(3));% position at stage 3
 v_y4=v_y3;%velocity at stage 4
    p_y4=p_y3+A*delta4*(S*delta1+delta2+(S^2)*delta3);
 v_y5=v_y4-B*S*delta5;%velocity at stage 5
    p_y5=p_y4+A*delta5*(S*delta1+delta2+S*delta3)-B*S*(delta5^2)*(1-S);
 v_y6=v_y5-B*delta6;%velocity at stage 6
    p_y6=p_y5+v_y5*delta6-B*0.5*delta6^2;
if(alpha_ad>=0 && alpha_ad<=a1)%rise
    ris.pos=A*S*in(1)*(alpha_ad-S*in(1)*sin(alpha_ad/(S*in(1))));
    ris.vel=A*S*in(1)*(1-cos(alpha_ad/(S*in(1))));
    ris.acc=A*sin(alpha_ad/(S*in(1)));
elseif(alpha_ad>=a1 && alpha_ad<=a2)%dwell
    ris.pos=p_y1+v_y1*(alpha_ad-a1)+A*0.5*(alpha_ad-a1)^2;
    ris.vel=v_y1+A*(alpha_ad-a1);
    ris.acc=A;
elseif(alpha_ad>=a2 && alpha_ad<=a3)%down
    ris.pos=p_y2+v_y2*(alpha_ad-a2)+A*(S*in(3))^2*(1-cos((alpha_ad-a2)/(S*in(3))));
   ris.vel=v_y2+A*S*in(3)*sin((alpha_ad-a2)/(S*in(3)));
    ris.acc=A*cos((alpha_ad-a2)/(S*in(3)));
elseif(alpha_ad>a3 && alpha_ad<=a4)%dwell
  ris.pos=p_y3+v_y3*(alpha_ad-a3);
   ris.vel=v_y3;
    ris.acc=0;
elseif(alpha_ad>=a4 && alpha_ad<=a5)
        ris.pos=p_y4+v_y4*(alpha_ad-a4)-B*S*delta5*(alpha_ad-a4-S*delta5*sin((alpha_ad-a4)/(S*delta5)));
    ris.vel=v_y4-B*S*delta5*(1-cos((alpha_ad-a4)/(S*delta5)));
    ris.acc=-B*sin((alpha_ad-a4)/(S*delta5));
elseif(alpha_ad>=a5 && alpha_ad<=a6)%rise
    ris.pos=p_y5+v_y5*(alpha_ad-a5)-B*0.5*(alpha_ad-a5)^2;
    ris.vel=v_y5-B*(alpha_ad-a5);
    ris.acc=-B;
elseif(alpha_ad>=a6 && alpha_ad<=a7)%rise
    ris.pos=p_y6+v_y6*(alpha_ad-a6)-B*((S*delta7)^2)*(1-cos((alpha_ad-a6)/(S*delta7)));
    ris.vel=v_y6-B*S*delta7*sin((alpha_ad-a6)/(S*delta7));
    ris.acc=-B*cos((alpha_ad-a6)/(S*delta7));
else
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;
end
end