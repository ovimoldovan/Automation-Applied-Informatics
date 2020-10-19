A = imread('peppers.png');
imshow(A);
%h = imtool()
%blur gaussian filter
h = 1/256*[ 1 4 6 4 1; 4 16 24 16 4; 6 24 35 24 6; 4 16 24 16 4; 1 4 6 4 1];
X = imfilter(A,h, 'conv');
imshow(X)
%% motion blur
h = zeros(9,9);
for i = 1:length(h)
    for j = 1:length(h)
        if(i==j) h(i,j) = 1; end
    end
end
h= h/9;
X = imfilter(A,h, 'conv')
imshow(X)
%% sharpening
h = [-1 -1 -1; -1 9 -1; -1 -1 -1];
X = imfilter(A,h, 'conv')
imshow(X)
% AN LTI CAN BE WRITTEN AS y[n] = x[n] * h[n] (convolution)
% h = convolution kernel

%% lab 8.2
im = imread('peppers.png');
template = imread('onion.png');
% convert images to gray scale if needed
if(size(im,3) == 3)
    im = rgb2gray(im);
end

    if(size(template,3) == 3)
        template = rgb2gray(template);
    end
    figure;imshow(im), title('Image')
    figure, imshow(template), title('Template')
    
% calculate the normalized cross-correlation and display as a surface plot
% the peak of the cross-correlation matrix occurs where the images are best
% correlated
c = normxcorr2(template, im);
figure, surf(c), shading flat
%the offset or translation between images depends on the location of the
%peak in the cross-correlation matrix, and on the size and position of the
%images
[max_c, imax] = max(c(:));
[ypeak, xpeak] = ind2sub(size(c), imax(1));
corr_offset = [(xpeak -size(template, 2))
    ypeak-size(template,1)];
xoffset = corr_offset(1);
yoffset = corr_offset(2);
xbegin = round(xoffset + 1);
xend = round(xoffset + size(template,2));
ybegin= round(yoffset + 1);
yend = round(yoffset + size(template, 1));

recovered_template = uint8(zeros(size(im)));
recovered_template(ybegin:yend, xbegin:xend) = template; 
figure, imshow(recovered_template)

[m, n] = size(im);
mask = ones(m,n);
i = find(recovered_template == 0);
mask(i) = .5;
%overlay image with transparency
figure, imshow(im), title('Template overlayed on original image')
hold on
h = imshow(recovered_template);
set(h, 'AlphaData', mask);