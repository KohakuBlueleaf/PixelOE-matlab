function output = apply_chunk(input, k, s, func)
    arguments
        input;
        k int32 = 3;
        s int32 = 1;
        func function_handle = @mean2;
    end
    [h, w] = size(input);
    h = ceil(h/s) * s;
    w = ceil(w/s) * s;
    output = zeros([h w]);
    % take kernel size=k  and stride = single
    for i = 0 : floor((size(input, 1) - k)/s)
        for j = 0: floor((size(input, 2) - k)/s)
            chunk = input(i*s+1:i*s+k, j*s+1:j*s+k);
            output(i*s+1:i*s+k, j*s+1:j*s+k) = func(chunk);
        end
    end
end