function output = pixelize(input, target_size, resize_method, outline_thikness)
    arguments
        input uint8;
        target_size int32 = 128;
        resize_method string = "bicubic";
        outline_thikness int32 = 4;
    end
    input = single(input)/255;
    
    % Before downscale
    % The operation that should be applied before downscale
    % Outline inflation
    % Color palette choice
    % Low-pass Filter
    img = input;
    img = outline_inflation(img, outline_thikness);
    
    % downscale
    % Different downscale method may have Different result
    img_sm = resize(img, target_size, resize_method);
    
    % After downscale
    % Apply color palette
    % Apply dithering
    % Apply color transfering
    img_sm = match_color(img_sm, input);
    
    % output
    output = imresize(img_sm, [size(input, 1), size(input, 2)], 'nearest');
    output = uint8(output*255);
end