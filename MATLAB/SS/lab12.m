im = imread('circles.png');
imshow(im)

if(~islogical(im)) %if the image is not binary
    %transforming a RGB image into a gray scale image
    if(ndims(im)>2)
        im = rgb2gray(im);
    end
    %computation of the threshold for binarization
    level = graythresh(im);
    %binarizare imagine
    BW = im2bw(im, level);
else 
    BW = im;
end
figure, imshow(BW)
%if after this step the background is white and the objects are black, the
%image needs to be complemented
%BW = ~BW;
%figure, imshow(BW)

%we need to extract the exterior boundaries of objects. Option 'noholes'
%can provide better performance by preventing the function bwboundaries to
%search for interior boundaries.
[B,L,N] = bwboundaries(BW, 'noholes'); %N - number of objects found in the image; 

%B - structure containing the boundary of each object;
%L - the label matrix, a two dimensional array of nonnegative integers that
%represent contiguous regions. The kth region includes all elements in L
%that have value k

for(k = 1:N)
    X = B{k}(:, 2);
    Y = B{k}(:,1);
    contur = [X', Y'];
    figure, plot(X,Y)
end