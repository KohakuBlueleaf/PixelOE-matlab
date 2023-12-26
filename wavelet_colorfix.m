function output = wavelet_colorfix(input, target)
    [input_high, ~] = wavelet_decomposition(input, 5);
    [~, target_low] = wavelet_decomposition(target, 5);
    output = input_high + target_low;
end


function [high_freq, low_freq] = wavelet_decomposition(input, levels)
    high_freq = zeros("like", input);
    for i = 1:levels
        radius = 2^i;
        low_freq = wavelet_blur(input, radius);
        high_freq = high_freq + (input - low_freq);
        input = low_freq;
    end
end


function output = wavelet_blur(input, radius)
    kernel = make_kernel(radius);
    input = padarray(input, [radius radius], "replicate", "both");
    output = conv2(input, kernel, 'valid');
end


function output = make_kernel(radius)
    kernel = [
        [0.0625, 0.125, 0.0625]
        [0.125, 0.25, 0.125]
        [0.0625, 0.125, 0.0625]
    ];
    output = zeros([2*radius+1 2*radius+1]);
    for i = 0:2
        for j = 0:2
            output(1+radius*i, 1+radius*j) = kernel(i+1, j+1);
        end
    end
end