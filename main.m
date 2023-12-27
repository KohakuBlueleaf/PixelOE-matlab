img_name = "00673";
img_original = imread('image/' + img_name + ".png");
patch_size = 8;
for pix_size = 128:128:384
    img = resize(img_original, pix_size * patch_size, 'bicubic', patch_size*2);
    pixelized_nearest3 = pixelize(img, pix_size, 'nearest', 2, false, patch_size);
    pixelized_nearest3_cm = pixelize(img, pix_size, 'nearest', 2, true, patch_size);
    imwrite(pixelized_nearest3, 'image/' + img_name + '-' + num2str(pix_size*4) + "_pixelized_matlab.png");
    imwrite(pixelized_nearest3_cm, 'image/' + img_name + '-' + num2str(pix_size*4) + "_pixelized_cm_matlab.png");
end

% pix_size = 64;
% img = resize(img_original, pix_size * patch_size, 'bicubic', patch_size);
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
% pixelized_box0 = pixelize(img, pix_size, 'box', 0, true, patch_size);
% pixelized_box1 = pixelize(img, pix_size, 'box', 1, true, patch_size);
% pixelized_box2 = pixelize(img, pix_size, 'box', 2, true, patch_size);
% pixelized_box3 = pixelize(img, pix_size, 'box', 3, true, patch_size);


% figure();
% subplot(3, 5, 1) ; imshow(img); title('Original');
% subplot(3, 5, 2) ; imshow(pixelized_nearest0); title(strcat('nearest0'));
% subplot(3, 5, 3) ; imshow(pixelized_nearest1); title(strcat('nearest1'));
% subplot(3, 5, 4) ; imshow(pixelized_nearest2); title(strcat('nearest2'));
% subplot(3, 5, 5) ; imshow(pixelized_nearest3); title(strcat('nearest3'));
% subplot(3, 5, 7) ; imshow(pixelized_bicubic0); title(strcat('bicubic0'));
% subplot(3, 5, 8) ; imshow(pixelized_bicubic1); title(strcat('bicubic1'));
% subplot(3, 5, 9) ; imshow(pixelized_bicubic2); title(strcat('bicubic2'));
% subplot(3, 5, 10); imshow(pixelized_bicubic3); title(strcat('bicubic3'));
% subplot(3, 5, 12); imshow(pixelized_box0); title(strcat('box0'));
% subplot(3, 5, 13); imshow(pixelized_box1); title(strcat('box1'));
% subplot(3, 5, 14); imshow(pixelized_box2); title(strcat('box2'));
% subplot(3, 5, 15); imshow(pixelized_box3); title(strcat('box3'));