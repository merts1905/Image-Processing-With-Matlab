image = imread('rice.png');
count_column = size(image,2);
count_row = size(image,1);
kumulatif_hist = zeros([1 256]); %vektör
histogram = zeros([1 256]); %vektör

for i = 1 : count_row     % "Hangi renk tonunddan ne kadar olduðunu belirliyoruz" %
    for j = 1 : count_column
        for count = 1: 256
            if(image(i,j) == count-1)
                histogram(count) = histogram(count) + 1;
            end
        end
    end
end

suanki_deger = 0;

for count=1: 256      % "pixel sayýsý" %
    suanki_deger = suanki_deger + histogram(count);
    kumulatif_hist(count) = suanki_deger;
end

normalized_hist = zeros([256,1]); %vektör

for count = 1 : 256         % "formül" %
   normalized_hist(count) = kumulatif_hist(count) ;
   normalized_hist(count) = normalized_hist(count) / ((count_column*count_row));
   normalized_hist(count) = round(normalized_hist(count) * 255);  % Tamsayýya Yuvarlama iþlemi %
end

imageOut = zeros([count_row,count_column],'uint8');

for i = 1: count_row        % "histogram degerlerinin resme dagýltýmasý" %
    for j = 1 : count_column
        for count =1:256
            if(image(i,j) == (count-1))
                imageOut(i,j) = normalized_hist(count);
            end
        end      
    end
end

imshow(image);title('Orijinal Resim');
figure
imhist(image);title('Orijinal Resim Histogramý');
figure
imshow(imageOut);title('Eþitleme Sonucu Oluþan Resmi');
figure
imhist(imageOut);title('Eþitleme Sonucu Oluþan Histogram');