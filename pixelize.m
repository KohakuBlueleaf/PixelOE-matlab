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
    % Outline expansion
    % Color palette choice
    img = input;
    if thickness > 0
        img = outline_expansion(img, thickness, thickness, patch_size, 9, 4);
    end
    if color_matching
        img = match_color(img, input);
    end
    % imshow(img);
    
    % downscale
    % Different downscale method may have Different result
    img_lab = rgb2lab(img);
    img_lab(:, :, 1) = apply_chunk_new(img_lab(:, :, 1), patch_size, patch_size, @find_pixel);
    img_lab(:, :, 2) = apply_chunk_new(img_lab(:, :, 2), patch_size, patch_size, @median2);
    img_lab(:, :, 3) = apply_chunk_new(img_lab(:, :, 3), patch_size, patch_size, @median2);
    img = lab2rgb(img_lab);
    % imshow(img);
    img_sm = resize(img, target_size, resize_method, patch_size);
    % img_sm = chunk_mean_downsample(img, patch_size);
    
    % After downscale
    % Apply color palette
    % Apply dithering
    % img_sm = sharpening(img_sm, 2);
    % [~, centers] = imsegkmeans(img_sm, 64);
    % color_map = min(max(centers, 0), 1);
    % img_sm = rgb2ind(img_sm, double(color_map), 'dither');
    % img_sm = ind2rgb(img_sm, double(color_map));
    
    % Reupscale use nearest to get "pixel" effect
    img_lg = imresize(img_sm, [size(input, 1), size(input, 2)], 'nearest');
    output = uint8(img_lg*255);
end


function output = chunk_mean_downsample(img, chunk_size)
    [h, w, ~] = size(img);
    h = h / chunk_size;
    w = w / chunk_size;
    output = zeros([h w]);
    x = 0;
    for i = 1:chunk_size:size(img, 1)
        y = 0;
        x = x + 1;
        for j = 1:chunk_size:size(img, 2)
            y = y + 1;
            chunk = img(i:i+chunk_size-1, j:j+chunk_size-1, :);
            output(x, y, 1) = mean2(chunk(:, :, 1));
            output(x, y, 2) = mean2(chunk(:, :, 2));
            output(x, y, 3) = mean2(chunk(:, :, 3));
        end
    end
end


function output = find_pixel(chunk)
    med = median(median(chunk));
    mu = mean(mean(chunk));
    maximum = max(max(chunk));
    minimum = min(min(chunk));
    if med < mu || maximum - mu > mu - minimum
        output = minimum;
    else
        output = maximum;
    end
end


function output = median2(chunk)
    output = median(median(chunk));
end