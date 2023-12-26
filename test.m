img = imread('image/00813.png');
pix_size = 96;
patch_size = 8;
img = resize(img, pix_size * patch_size, 'bicubic', patch_size);
img = single(img)/255;
weight = inflation_weight(img, patch_size*2, 6, 3);

figure(); 
subplot(2, 3, 1); imshow(img); title('Original');
subplot(2, 3, 2); imshow(1-weight); title('Feature Map');
subplot(2, 3, 4); imshow(outline_inflation(img, 1, 1, patch_size, 6, 3)); title('Thickness 1');
subplot(2, 3, 5); imshow(outline_inflation(img, 2, 2, patch_size, 6, 3)); title('Thickness 2');
subplot(2, 3, 6); imshow(outline_inflation(img, 3, 3, patch_size, 6, 3)); title('Thickness 3');