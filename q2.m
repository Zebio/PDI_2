clear;
clc;
close all;

imagem = double(imread('imagem exemplo.png'));
imagem=imagem(:,:,1);
figure
imshow(uint8(imagem));

%******* GAUSSIANA******
h = fspecial('gaussian',[5 5], 0.7)
gaussiana= imfilter(imagem,h,'circular');
figure
imshow(uint8(gaussiana));
title('Aplicacao da Gaussiana 3x3 , 0.8');

%******* MEDIANA ********
Mediana = medfilt2(imagem,[3 3]);
figure
imshow(uint8(Mediana));
title('Aplicacao da Mediana 3x3');
