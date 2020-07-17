
clc; clear; close all

%% load paths
currentFolder = pwd;
addpath(genpath(currentFolder))

%% Choise a Image for detection 
[filename,pathname]=uigetfile({'*.jpg;*.bmp;*.tif;*.png;*.gif','All Image Files';'*.*','All Files'});
Img = imread([pathname,filename]);
imgPath=strcat(pathname,filename);
disp(['The processing image path is - ',  imgPath ]);
%clear filename pathname imgPath
 
if ~isequal(ndims(Img), 2)
    Img = rgb2gray(Img);
end

 
%% Estimate bias field   
lambdaS = 3.5;
lambdaI = 0.0015; 
degree = 6;
P = 0.35;
maxIter = 15;
I = L2Lp_NUC_paraB(Img, lambdaS, lambdaI, degree, P, maxIter); 
I = 255*(I-min(I(:)))/(max(I(:))-min(I(:)));

figure,
subplot(1,2,1), imshow(Img, []),      title('Input image'); 
subplot(1,2,2), imshow(I, []), title('Image corrected'); 


