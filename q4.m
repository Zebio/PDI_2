clear;
clc;
close all;

%********* IMAGEM *********
imagem = imread('cameraman.tif');
figure
imshow(imagem);

%******* HISTOGRAMA *******
figure
histogram(imagem);

%****** EQUALIZACAO *******
img_eq = histeq(imagem);
figure
imshow(img_eq);

%* HISTOGRAMA EQUALIZADO **
figure
histogram(img_eq);


