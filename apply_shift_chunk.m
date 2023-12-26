function output = apply_shift_chunk(input, k, func)
    arguments
        input;
        k int32 = 3;
        func function_handle = @mean2;
    end
    % Take stride = kernel size for convinience
    s = k;
    h = size(input, 1);
    w = size(input, 2);
    output = zeros(size(input));
    for i = 0 : floor((size(input, 1) - k)/s)-1
        for j = 0: floor((size(input, 2) - k)/s)-1
            chunk = input(i*s+1+k/2:i*s+k+k/2, j*s+1+k/2:j*s+k+k/2);
            output(i*s+1+k/2:i*s+k+k/2, j*s+1+k/2:j*s+k+k/2) = func(chunk);
        end
    end
    % doing func on edge part
    for i = 0 : floor((size(input, 1) - k)/s)-1
        output(i*s+1+k/2:i*s+k+k/2, 1:k/2) = func(input(i*s+1+k/2:i*s+k+k/2, 1:k/2));
        output(i*s+1+k/2:i*s+k+k/2, w-k/2+1:w) = func(input(i*s+1+k/2:i*s+k+k/2, w-k/2+1:w));
        output(1:k/2, i*s+1+k/2:i*s+k+k/2) = func(input(1:k/2, i*s+1+k/2:i*s+k+k/2));
        output(h-k/2+1:h, i*s+1+k/2:i*s+k+k/2) = func(input(h-k/2+1:h, i*s+1+k/2:i*s+k+k/2));
    end
    % doing func on corner
    output(1:k/2, 1:k/2) = func(input(1:k/2, 1:k/2));
    output(1:k/2, w-k/2+1:w) = func(input(1:k/2, w-k/2+1:w));
    output(h-k/2+1:h, 1:k/2) = func(input(h-k/2+1:h, 1:k/2));
    output(h-k/2+1:h, w-k/2+1:w) = func(input(h-k/2+1:h, w-k/2+1:w));
    % imshow(output);
end