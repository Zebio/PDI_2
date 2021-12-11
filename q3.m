clear;
clc;
close all;

imagem_rgb = double(imread("peppers_color.jpg"));
figure
imshow(uint8(imagem_rgb));


[x,y,~]   = size(imagem_rgb);  %x=comprimento, y=largura
red     = imagem_rgb(:,:,1);   %separa a componente vermelha da imagem
green   = imagem_rgb(:,:,2);   %separa a componente verde de imagem
blue    = imagem_rgb(:,:,3);   %separa a componente azul da imagem

imagem_hsv = rgb2hsv(imagem_rgb);
hue        = imagem_hsv(:,:,1); %separa o hue
saturation = imagem_hsv(:,:,2); %separa a saturacao
luminance  = imagem_hsv(:,:,3); %separa a luminancia

saturation_red   = saturation;
saturation_green = saturation;

for i=1:x  % a variavel i percorre o comprimento da imagem
   for j=1:y %a variavel j percorre a largura da imagem
        %se o pixel nao e vermelho, o torna cinza (sem cor)
        if((red(i,j)<green(i,j)+30) || (red(i,j)<blue(i,j)))
                    saturation_red(i,j)=0; %torna cinza
        end
        %se o pixel nao e verde/amarelo, o torna cinza
        if((green(i,j)<red(i,j)-30) || (green(i,j)<blue(i,j)))
                    saturation_green(i,j)=0; %torna conza
        end
        %se o brilho do pixel e muito baixo, tambem o torna cinza
        if(luminance(i,j)<100)
                  saturation_red (i,j)=0;
                  saturation_green(i,j)=0;
        end
   end
end
%recupera a saturacao da imagem vermelha e imprime
imagem_hsv(:,:,2)=saturation_red;
imagem_final= hsv2rgb(imagem_hsv);
figure
imshow(uint8(imagem_final));

%recupera a saturacao da imagem verde/amarela e imprime
imagem_hsv(:,:,2)=saturation_green;
imagem_final= hsv2rgb(imagem_hsv);
figure
imshow(uint8(imagem_final));

