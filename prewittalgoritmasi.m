a=imread('C:\lena512.jpg');
c=double(a);
b=graythresh(a);
for i=1: size(c,1)-2
    for j=1: size(c,2)-2
        
        Gx=((c(i+2,j+1)+c(i+2,j)+c(i+2,j+2))-(c(i,j+1)+c(i,j)+c(i,j+2)));   
        
        Gy=((c(i+1,j+2)+c(i,j+2)+c(i+2,j+2))-(c(i+1,j)+c(i,j)+c(i+2,j)));
        
        a(i,j) = abs(Gx)+abs(Gy);
        a(i,j) = sqrt(Gx.^2+Gy.^2);
    end
end
s=edge(a,'prewitt',b);
figure,imshow(a); title('Prewitt Gradient');
%figure,imshow(s); title('Prewitt Edge');