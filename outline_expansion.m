function output = outline_expansion(input, round_erode, round_dilate, patch_size, avg_scale, dist_scale)
    arguments
        input;
        round_erode int32 = 5;
        round_dilate int32 = 7;
        patch_size int32 = 16;
        avg_scale int32 = 12;
        dist_scale int32 = 5;
    end
    kernel = [1 1 1; 1 1 1; 1 1 1];
    
    % weight
    weight = expansion_weight(input, patch_size*2, avg_scale, dist_scale);
    
    img_erode = input;
    img_dilate = input;
    for i = 1:round_erode
        img_erode = imerode(img_erode, kernel);
    end
    for i = 1:round_dilate
        img_dilate = imdilate(img_dilate, kernel);
    end
    output = img_erode .* weight + img_dilate .* (1 - weight);
    % figure();
    % subplot(1, 3, 1); imshow(img_erode); title('erode');
    % subplot(1, 3, 2); imshow(img_dilate); title('dilate');
    % subplot(1, 3, 3); imshow(output); title('Ours');
end