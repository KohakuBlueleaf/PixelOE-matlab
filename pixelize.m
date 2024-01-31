function output = pixelize(input, target_size, patch_size, thickness, color_matching, contrast, saturation, colors)
    arguments
        input uint8;
        target_size int32 = 128;
        patch_size int32 = 8;
        thickness int32 = 2;
        color_matching = true;
        contrast single = 1.0;
        saturation single = 1.0;
        colors int32 = -1;
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
    
    % downscale
    % Use median/mean and extremal value to determine the value we need
    img_lab = rgb2lab(img);
    img_lab(:, :, 1) = apply_chunk_new(img_lab(:, :, 1), patch_size, patch_size, @find_pixel);
    img_lab(:, :, 2) = apply_chunk_new(img_lab(:, :, 2), patch_size, patch_size, @median2);
    img_lab(:, :, 3) = apply_chunk_new(img_lab(:, :, 3), patch_size, patch_size, @median2);
    img = lab2rgb(img_lab);
    img_sm = resize(img, target_size, 'nearest', patch_size);
    
    % After downscale
    % Apply color palette
    % Apply dithering
    if colors > 0
        [~, centers] = imsegkmeans(img_sm, colors);
        color_map = min(max(centers, 0), 1);
        img_sm = rgb2ind(img_sm, double(color_map), 'dither');
        img_sm = ind2rgb(img_sm, double(color_map));
    end
    % Modify contrast and saturation
    if contrast ~= 1 || saturation
        img_sm = color_styling(img_sm, saturation, contrast);
    end
    
    % Reupscale use nearest to get "pixel" effect
    img_lg = imresize(img_sm, [size(input, 1), size(input, 2)], 'nearest');
    output = uint8(img_lg*255);
end


function output = find_pixel(chunk)
    % med = median(chunk, 'all');
    % mu = mean(chunk, 'all');
    % maximum = max(max(chunk));
    % minimum = min(min(chunk));
    % output = med;
    % if med < mu && maximum - med > med - minimum
    %     output = minimum;
    % elseif med > mu && maximum - med < med - minimum
    %     output = maximum;
    % end
    [w, h] = size(chunk);
    output = chunk(w/2, h/2);
end


function output = median2(chunk)
    output = median(chunk, 'all');
end