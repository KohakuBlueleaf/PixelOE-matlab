function output = pixelize(input, target_size, resize_method, thickness, color_matching, patch_size)
    arguments
        input uint8;
        target_size int32 = 128;
        resize_method string = "bicubic";
        thickness int32 = 5;
        color_matching = true;
        patch_size int32 = 16;
    end
    input = single(input)/255;
    
    % Before downscale
    % The operation that should be applied before downscale
    % Outline inflation
    % Color palette choice
    img = input;
    if thickness > 0
        img = outline_inflation(img, thickness, thickness, patch_size, 12, 3);
    end
    if color_matching
        img = match_color(img, input);
    end
    % imshow(img);
    
    % downscale
    % Different downscale method may have Different result
    img_sm = resize(img, target_size, resize_method);
    
    % After downscale
    % Apply color palette
    % Apply dithering
    % img_sm = sharpening(img_sm, 1);
    % [~, centers] = imsegkmeans(img_sm, 64);
    % color_map = min(max(centers, 0), 1);
    % img_sm = rgb2ind(img_sm, double(color_map), 'dither');
    % img_sm = ind2rgb(img_sm, double(color_map));
    
    % Reupscale use nearest to get "pixel" effect
    img_lg = imresize(img_sm, [size(input, 1), size(input, 2)], 'nearest');
    output = uint8(img_lg*255);
end

