img_name = "00909";
img_original = imread('image/' + img_name + ".png");
patch_size = 8;
for settings = [96 128 160; 2 3 3]
    pix_size = settings(1);
    expand = settings(2);
    disp(settings);
    
    img = resize(img_original, pix_size * patch_size, 'bicubic', patch_size);
    pixelized_nearest3 = pixelize(img, pix_size, patch_size, expand, false);
    pixelized_nearest3_cm = pixelize(img, pix_size, patch_size, expand, true, 1.1, 1.2);
    imwrite(pixelized_nearest3, 'image/' + img_name + '-' + num2str(pix_size*4) + "_pixelized_matlab.png");
    imwrite(pixelized_nearest3_cm, 'image/' + img_name + '-' + num2str(pix_size*4) + "_pixelized_cm_matlab.png");
end