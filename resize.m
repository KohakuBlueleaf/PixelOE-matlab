function output = resize(input, target_size)
    aspect_ratio = size(input, 1) / size(input, 2);
    sqrt_aspect_ratio = sqrt(aspect_ratio);
    shape = [target_size / sqrt_aspect_ratio, target_size * sqrt_aspect_ratio];
    output = imresize(input, shape, 'bicubic');
end