a=imread('C:\lena512.jpg');
c=double(a);
b=graythresh(a);
for i=1: size(c,1)-2
    for j=1: size(c,2)-2
        
        Gx=((c(i,j+1))-(c(i+1,j)));   
        
        Gy=((c(i,j))-(c(i+1,j+1)));
        
        a(i,j) = abs(Gx)+abs(Gy);
        a(i,j) = sqrt(Gx.^2+Gy.^2);
    end
end
%s=edge(a,'robert',b);
figure,imshow(a); title('Robert Gradient');
%figure,imshow(s); title('Robert Edge');