function output = match_color(source, target)
    % convert RGB to l-alpha-beta, and then match the std/mean
    source = rgb2lab(source);
    target_lab = rgb2lab(target);
    result = (source - mean2(source)) ./ std2(source);
    result = result .* std2(target_lab) + mean2(target_lab);
    source = lab2rgb(result);
    
    % Use wavelet colorfix method to match original low frequency data at first.
    source(:, :, 1) = wavelet_colorfix(source(:, :, 1), target(:, :, 1));
    source(:, :, 2) = wavelet_colorfix(source(:, :, 2), target(:, :, 2));
    source(:, :, 3) = wavelet_colorfix(source(:, :, 3), target(:, :, 3));
    output = source;
end