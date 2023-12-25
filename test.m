img = imread('image/00813.png');
pix_size = 96;
patch_size = 16;
img = resize(img, pix_size * patch_size);
img = single(img)/255;


figure(18);
idx = 1;
for dist_scale = 3:2:7
    for avg_scale = 10:2:20
        subplot(3, 6, idx); imshow(outline_inflation(img, 5, 10, patch_size, avg_scale, dist_scale)); 
        title(strcat('a: ', num2str(avg_scale), ' | d: ', num2str(dist_scale)));
        idx = idx + 1;
    end
end