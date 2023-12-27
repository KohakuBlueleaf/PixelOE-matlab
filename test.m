img = imread('image/00813.png');
pix_size = 128;
patch_size = 8;
img = resize(img, pix_size * patch_size, 'bicubic', patch_size);
img = single(img)/255;
weight = expansion_weight(img, patch_size*2, 6, 3);

edge = outline_expansion(img, 3, 3, patch_size, 6, 3)-img;
edge = (edge+1)./2;
edge(abs(edge-0.5) < 0.01) = 1.0;

figure(); 
subplot(2, 3, 1); imshow(img); title('Original');
subplot(2, 3, 2); imshow(1-weight); title('Feature Map');
subplot(2, 3, 3); imshow(outline_expansion(img, 3, 3, patch_size, 6, 3)); title('Thickness 3'); %imshow(edge); title('Thickness2 edge');
subplot(2, 3, 4); imshow(outline_expansion(img, 1, 1, patch_size, 6, 3)); title('Thickness 1');
subplot(2, 3, 5); imshow(outline_expansion(img, 2, 2, patch_size, 6, 3)); title('Thickness 2');
subplot(2, 3, 6); imshow(outline_expansion(img, 3, 3, patch_size, 6, 3)); title('Thickness 3');