img = imread('image/00777.jpg');
pix_size = 160;
patch_size = 8;
img = resize(img, pix_size * patch_size, 'bicubic', patch_size);
pixelized_nearest3 = pixelize(img, pix_size, 'nearest', 3, false, patch_size);
pixelized_nearest3_cm = pixelize(img, pix_size, 'nearest', 3, true, patch_size);

imshow(pixelized_nearest3);

% figure();
% subplot(1, 4, 1); imshow(img);
% subplot(1, 4, 2); imshow(pixelized_nearest3); title('without color matching');
% subplot(1, 4, 3); imshow(pixelized_nearest3_cm); title('with color matching');
% subplot(1, 4, 4); imshow((pixelized_nearest3_cm - pixelized_nearest3).*3); title('difference 3x');


% pixelized_nearest0 = pixelize(img, pix_size, 'nearest', 0, true, patch_size);
% pixelized_nearest1 = pixelize(img, pix_size, 'nearest', 1, true, patch_size);
% pixelized_nearest2 = pixelize(img, pix_size, 'nearest', 2, true, patch_size);
% pixelized_nearest3 = pixelize(img, pix_size, 'nearest', 3, true, patch_size);
% pixelized_bicubic0 = pixelize(img, pix_size, 'bicubic', 0, true, patch_size);
% pixelized_bicubic1 = pixelize(img, pix_size, 'bicubic', 1, true, patch_size);
% pixelized_bicubic2 = pixelize(img, pix_size, 'bicubic', 2, true, patch_size);
% pixelized_bicubic3 = pixelize(img, pix_size, 'bicubic', 3, true, patch_size);


% figure();
% subplot(2, 5, 1) ; imshow(img); title('Original');
% subplot(2, 5, 2) ; imshow(pixelized_nearest0); title(strcat('nearest0'));
% subplot(2, 5, 3) ; imshow(pixelized_nearest1); title(strcat('nearest1'));
% subplot(2, 5, 4) ; imshow(pixelized_nearest2); title(strcat('nearest2'));
% subplot(2, 5, 5) ; imshow(pixelized_nearest3); title(strcat('nearest3'));
% subplot(2, 5, 7) ; imshow(pixelized_bicubic0); title(strcat('bicubic0'));
% subplot(2, 5, 8) ; imshow(pixelized_bicubic1); title(strcat('bicubic1'));
% subplot(2, 5, 9) ; imshow(pixelized_bicubic2); title(strcat('bicubic2'));
% subplot(2, 5, 10); imshow(pixelized_bicubic3); title(strcat('bicubic3'));