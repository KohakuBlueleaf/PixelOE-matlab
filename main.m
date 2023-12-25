img = imread('image/00813.png');
pix_size = 64;
img = resize(img, pix_size * 8);
img_outline = outline_inflation(img, 1);

pixelized_nearest = pixelize(img_outline, pix_size, 'nearest');
pixelized_bicubic = pixelize(img_outline, pix_size, 'bicubic');
pixelized_lanczos2 = pixelize(img_outline, pix_size, 'lanczos2');

% calc loss
psnr_nearest = 10 * log10(255^2 / immse(img, pixelized_nearest));
psnr_bicubic = 10 * log10(255^2 / immse(img, pixelized_bicubic));
psnr_lanczos2 = 10 * log10(255^2 / immse(img, pixelized_lanczos2));
[ssim_nearest,  ] = ssim(img, pixelized_nearest);
[ssim_bicubic,  ] = ssim(img, pixelized_bicubic);
[ssim_lanczos2, ] = ssim(img, pixelized_lanczos2);


disp(psnr_nearest);
disp(psnr_bicubic);
disp(psnr_lanczos2);

disp(ssim_nearest);
disp(ssim_bicubic);
disp(ssim_lanczos2);


figure(4);
subplot(1, 4, 1); imshow(img); title('Original');
subplot(1, 4, 2); imshow(pixelized_nearest); title('Nearest');
subplot(1, 4, 3); imshow(pixelized_bicubic); title('Bicubic');
subplot(1, 4, 4); imshow(pixelized_lanczos2); title('Lanczos2');