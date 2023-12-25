img = imread('image/00813.png');
pix_size = 96;
img = resize(img, pix_size * 8);


pixelized_nearest0 = pixelize(img, pix_size, 'nearest', 0);
pixelized_nearest2 = pixelize(img, pix_size, 'nearest', 2);
pixelized_nearest4 = pixelize(img, pix_size, 'nearest', 4);
pixelized_bicubic0 = pixelize(img, pix_size, 'bicubic', 0);
pixelized_bicubic2 = pixelize(img, pix_size, 'bicubic', 2);
pixelized_bicubic4 = pixelize(img, pix_size, 'bicubic', 4);
pixelized_lanczos0 = pixelize(img, pix_size, 'lanczos2', 0);
pixelized_lanczos2 = pixelize(img, pix_size, 'lanczos2', 2);
pixelized_lanczos4 = pixelize(img, pix_size, 'lanczos2', 4);


figure(12);
subplot(3, 4, 1); imshow(img); title('Original');
subplot(3, 4, 2); imshow(pixelized_nearest0); title(strcat('nearest0', loss(pixelized_nearest0, img)));
subplot(3, 4, 3); imshow(pixelized_nearest2); title(strcat('nearest2', loss(pixelized_nearest2, img)));
subplot(3, 4, 4); imshow(pixelized_nearest4); title(strcat('nearest4', loss(pixelized_nearest4, img)));
subplot(3, 4, 6); imshow(pixelized_bicubic0); title(strcat('bicubic0', loss(pixelized_bicubic0, img)));
subplot(3, 4, 7); imshow(pixelized_bicubic2); title(strcat('bicubic2', loss(pixelized_bicubic2, img)));
subplot(3, 4, 8); imshow(pixelized_bicubic4); title(strcat('bicubic4', loss(pixelized_bicubic4, img)));
subplot(3, 4, 10); imshow(pixelized_lanczos0); title(strcat('lanczos0', loss(pixelized_lanczos0, img)));
subplot(3, 4, 11); imshow(pixelized_lanczos2); title(strcat('lanczos2', loss(pixelized_lanczos2, img)));
subplot(3, 4, 12); imshow(pixelized_lanczos4); title(strcat('lanczos4', loss(pixelized_lanczos4, img)));