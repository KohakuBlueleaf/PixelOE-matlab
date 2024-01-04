img = imread('image/00813.png');
pix_size = 128;
patch_size = 8;
img = resize(img, pix_size * patch_size, 'bicubic', patch_size);
img = single(img)/255;
weight = expansion_weight(img, patch_size, 9, 4);
weight = 1-weight;
thickness3 = outline_expansion(img, 3, 3, patch_size, 6, 3);

crop_box = [1, size(weight, 2)-128, 128, 128];

edge = outline_expansion(img, 3, 3, patch_size, 9, 4)-img;
edge = (edge+1)./2;
edge(abs(edge-0.5) < 0.01) = 1.0;

figure(); 
subplot(2, 3, 1); imshow(imcrop(img, crop_box)); title('Original');
subplot(2, 3, 2); imshow(imcrop(weight, crop_box)); title('Feature Map');
subplot(2, 3, 3); imshow(imcrop(thickness3, crop_box)); title('Thickness 3'); %imshow(edge); title('Thickness2 edge');
subplot(2, 3, 4); imshow(outline_expansion(img, 1, 1, patch_size, 6, 3)); title('Thickness 1');
subplot(2, 3, 5); imshow(outline_expansion(img, 2, 2, patch_size, 6, 3)); title('Thickness 2');
subplot(2, 3, 6); imshow(outline_expansion(img, 3, 3, patch_size, 6, 3)); title('Thickness 3');