img = imread('image/00813.png');
pix_size = 128;
patch_size = 8;
img = resize(img, pix_size * patch_size);


pixelized_nearest0 = pixelize(img, pix_size, 'nearest', 0, patch_size);
pixelized_nearest1 = pixelize(img, pix_size, 'nearest', 1, patch_size);
pixelized_nearest3 = pixelize(img, pix_size, 'nearest', 3, patch_size);
pixelized_nearest5 = pixelize(img, pix_size, 'nearest', 5, patch_size);
pixelized_bicubic0 = pixelize(img, pix_size, 'bicubic', 0, patch_size);
pixelized_bicubic1 = pixelize(img, pix_size, 'bicubic', 1, patch_size);
pixelized_bicubic3 = pixelize(img, pix_size, 'bicubic', 3, patch_size);
pixelized_bicubic5 = pixelize(img, pix_size, 'bicubic', 5, patch_size);

imshow(pixelized_nearest3);
figure(10);
subplot(2, 5, 1) ; imshow(img); title('Original');
subplot(2, 5, 2) ; imshow(pixelized_nearest0); title(strcat('nearest0'));
subplot(2, 5, 3) ; imshow(pixelized_nearest1); title(strcat('nearest1'));
subplot(2, 5, 4) ; imshow(pixelized_nearest3); title(strcat('nearest3'));
subplot(2, 5, 5) ; imshow(pixelized_nearest5); title(strcat('nearest5'));
subplot(2, 5, 7) ; imshow(pixelized_bicubic0); title(strcat('bicubic0'));
subplot(2, 5, 8) ; imshow(pixelized_bicubic1); title(strcat('bicubic1'));
subplot(2, 5, 9) ; imshow(pixelized_bicubic3); title(strcat('bicubic3'));
subplot(2, 5, 10); imshow(pixelized_bicubic5); title(strcat('bicubic5'));