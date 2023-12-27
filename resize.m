function output = resize(input, target_size, resize_method, patch_size)
    arguments
        input;
        target_size int32 = 128;
        resize_method string = "bicubic";
        patch_size int32 = 1;
    end
    aspect_ratio = size(input, 1) / size(input, 2);
    sqrt_aspect_ratio = sqrt(aspect_ratio);
    shape = [target_size * sqrt_aspect_ratio, target_size / sqrt_aspect_ratio];
    shape = int32(shape ./ patch_size) .* patch_size;
    output = imresize(input, shape, resize_method);
end