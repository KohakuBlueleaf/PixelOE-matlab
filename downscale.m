img = imread('image/00813.png');
pix_size = 96;
patch_size = 8;
img = resize(img, pix_size * patch_size, 'bicubic', patch_size);

img_sm_bicubic = resize(img, pix_size, 'bicubic');
img_sm_nearest = resize(img, pix_size, 'nearest');

figure();
subplot(1, 3, 1); imshow(img); title('Original');
subplot(1, 3, 2); imshow(img_sm_bicubic); title('Bicubic');
subplot(1, 3, 3); imshow(img_sm_nearest); title('Nearest');