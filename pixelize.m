function output = pixelize(input, target_size, resize_method)
    aspect_ratio = size(input, 1) / size(input, 2);
    sqrt_aspect_ratio = sqrt(aspect_ratio);
    shape = [target_size / sqrt_aspect_ratio, target_size * sqrt_aspect_ratio];
    
    % Before downscale
    % The operation that should be applied before downscale
    % Outline inflation
    % Color palette choice
    % Low-pass Filter
    
    % downscale
    % Different downscale method may have Different result
    img_sm = imresize(input, shape, resize_method);
    
    % After downscale
    
    % output
    output = imresize(img_sm, [size(input, 1), size(input, 2)], 'nearest');
end