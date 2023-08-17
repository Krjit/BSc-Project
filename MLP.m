a=xlsread('DATASET_OF_CYCLONE_YAAS.xlsx');
b=a;

%%RANDOM WEIGHT INTIALIZATION
w1=rand(4,7);
w2=rand(2,4);


b1=1; %BIAS

%%LEARNING PHASE
for j=1:100
  for i=1:70
    h1=b(i,1)*w1(1,1)+b(i,2)*w1(1,2)+b(i,3)*w1(1,3)+b(i,4)*w1(1,4)+b(i,5)*w1(1,5)+b(i,6)*w1(1,6)+b1*w1(1,7);
    h2=b(i,1)*w1(2,1)+b(i,2)*w1(2,2)+b(i,3)*w1(2,3)+b(i,4)*w1(2,4)+b(i,5)*w1(2,5)+b(i,6)*w1(2,6)+b1*w1(2,7);
    h3=b(i,1)*w1(3,1)+b(i,2)*w1(3,2)+b(i,3)*w1(3,3)+b(i,4)*w1(3,4)+b(i,5)*w1(3,5)+b(i,6)*w1(3,6)+b1*w1(3,7);
    h4=b(i,1)*w1(4,1)+b(i,2)*w1(4,2)+b(i,3)*w1(4,3)+b(i,4)*w1(4,4)+b(i,5)*w1(4,5)+b(i,6)*w1(4,6)+b1*w1(4,7);
    
    y1j=sigma(h1);
    y2j=sigma(h2);
    y3j=sigma(h3);
    y4j=sigma(h4);
    
    z1=y1j*w2(1,1)+y2j*w2(1,2)+y3j*w2(1,3)+y4j*w2(1,4);
    z2=y1j*w2(2,1)+y2j*w2(2,2)+y3j*w2(2,3)+y4j*w2(2,4);
    
    y1k=sigma(z1);
    y2k=sigma(z2);
    
    err(i,1)=0.5*(((y1k-b(i,7))^2)+((y2k-b(i,8))^2));
    
    n=0.1;  %ETA -> LEARNING RATE
    
    dw1_1=(y1j^2)*exp(-h1)*(((y1k-b(i,7))*(y1k^2)*exp(-z1)*w2(1,1))+((y2k-b(i,8))*(y2k^2)*exp(-z2)*w2(2,1)));
    w1(1,1)=w1(1,1)-n*b(i,1)*dw1_1;
    w1(1,2)=w1(1,2)-n*b(i,2)*dw1_1;
    w1(1,3)=w1(1,3)-n*b(i,3)*dw1_1;
    w1(1,4)=w1(1,4)-n*b(i,4)*dw1_1;
    w1(1,5)=w1(1,5)-n*b(i,5)*dw1_1;
    w1(1,6)=w1(1,6)-n*b(i,6)*dw1_1;
    w1(1,7)=w1(1,7)-n*b1*dw1_1;
    
    
    dw1_2=(y2j^2)*exp(-h2)*(((y1k-b(i,7))*(y1k^2)*exp(-z1)*w2(1,2))+((y2k-b(i,8))*(y2k^2)*exp(-z2)*w2(2,2)));
    w1(2,1)=w1(2,1)-n*b(i,1)*dw1_2;
    w1(2,2)=w1(2,2)-n*b(i,2)*dw1_2;
    w1(2,3)=w1(2,3)-n*b(i,3)*dw1_2;
    w1(2,4)=w1(2,4)-n*b(i,4)*dw1_2;
    w1(2,5)=w1(2,5)-n*b(i,5)*dw1_2;
    w1(2,6)=w1(2,6)-n*b(i,6)*dw1_2;
    w1(2,7)=w1(2,7)-n*b1*dw1_2;
    
    
    dw1_3=(y3j^2)*exp(-h3)*(((y1k-b(i,7))*(y1k^2)*exp(-z1)*w2(1,3))+((y2k-b(i,8))*(y2k^2)*exp(-z2)*w2(2,3)));
    w1(3,1)=w1(3,1)-n*b(i,1)*dw1_3;
    w1(3,2)=w1(3,2)-n*b(i,2)*dw1_3;
    w1(3,3)=w1(3,3)-n*b(i,3)*dw1_3;
    w1(3,4)=w1(3,4)-n*b(i,4)*dw1_3;
    w1(3,5)=w1(3,5)-n*b(i,5)*dw1_3;
    w1(3,6)=w1(3,6)-n*b(i,6)*dw1_3;
    w1(3,7)=w1(3,7)-n*b1*dw1_3;
    
    
    dw1_4=(y4j^2)*exp(-h4)*(((y1k-b(i,7))*(y1k^2)*exp(-z1)*w2(1,4))+((y2k-b(i,8))*(y2k^2)*exp(-z2)*w2(2,4)));
    w1(4,1)=w1(4,1)-n*b(i,1)*dw1_4;
    w1(4,2)=w1(4,2)-n*b(i,2)*dw1_4;
    w1(4,3)=w1(4,3)-n*b(i,3)*dw1_4;
    w1(4,4)=w1(4,4)-n*b(i,4)*dw1_4;
    w1(4,5)=w1(4,5)-n*b(i,5)*dw1_4;
    w1(4,6)=w1(4,6)-n*b(i,6)*dw1_4;
    w1(4,7)=w1(4,7)-n*b1*dw1_4;
    
    
    w2(1,1)=w2(1,1)-n*(y1k-b(i,7))*(y1k^2)*exp(-z1)*y1j;
    w2(1,2)=w2(1,2)-n*(y1k-b(i,7))*(y1k^2)*exp(-z1)*y2j;
    w2(1,3)=w2(1,3)-n*(y1k-b(i,7))*(y1k^2)*exp(-z1)*y3j;
    w2(1,4)=w2(1,4)-n*(y1k-b(i,7))*(y1k^2)*exp(-z1)*y4j;
    
    
    w2(2,1)=w2(2,1)-n*(y2k-b(i,8))*(y2k^2)*exp(-z2)*y1j;
    w2(2,2)=w2(2,2)-n*(y2k-b(i,8))*(y2k^2)*exp(-z2)*y2j;
    w2(2,3)=w2(2,3)-n*(y2k-b(i,8))*(y2k^2)*exp(-z2)*y3j;
    w2(2,4)=w2(2,4)-n*(y2k-b(i,8))*(y2k^2)*exp(-z2)*y4j;
    
    
  endfor
endfor
disp("Error from Training phase:");
disp(err(i-1,1));


%%TEST PHASE
c=0;
disp("OUTPUT");
for i=71:90
    h1=b(i,1)*w1(1,1)+b(i,2)*w1(1,2)+b(i,3)*w1(1,3)+b(i,4)*w1(1,4)+b(i,5)*w1(1,5)+b(i,6)*w1(1,6)+b1*w1(1,7);
    h2=b(i,1)*w1(2,1)+b(i,2)*w1(2,2)+b(i,3)*w1(2,3)+b(i,4)*w1(2,4)+b(i,5)*w1(2,5)+b(i,6)*w1(2,6)+b1*w1(2,7);
    h3=b(i,1)*w1(3,1)+b(i,2)*w1(3,2)+b(i,3)*w1(3,3)+b(i,4)*w1(3,4)+b(i,5)*w1(3,5)+b(i,6)*w1(3,6)+b1*w1(3,7);
    h4=b(i,1)*w1(4,1)+b(i,2)*w1(4,2)+b(i,3)*w1(4,3)+b(i,4)*w1(4,4)+b(i,5)*w1(4,5)+b(i,6)*w1(4,6)+b1*w1(4,7);
    
    y1j=sigma(h1);
    y2j=sigma(h2);
    y3j=sigma(h3);
    y4j=sigma(h4);
    
    z1=y1j*w2(1,1)+y2j*w2(1,2)+y3j*w2(1,3)+y4j*w2(1,4);
    z2=y1j*w2(2,1)+y2j*w2(2,2)+y3j*w2(2,3)+y4j*w2(2,4);
    
    y1k=sigma(z1);
    y2k=sigma(z2);
   
    if y1k>=0.5
      y1k=1;
    else
      y1k=0;
    end
    if y2k>=0.5
      y2k=1;
    else
      y2k=0;
    end
    
    disp(y1k);
    disp(y2k);
    if (y1k==b(i,7)) && (y2k==b(i,8))
      c=c+1;
    endif
 
endfor
disp("ACCURACY OF THE MODEL");
s=(c/20)*100;
disp(s);