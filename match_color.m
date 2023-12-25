function output = match_color(source, target)
    % convert RGB to l-alpha-beta, and then match the std and mean
    source = rgb2lab(source);
    target = rgb2lab(target);
    result = (source - mean2(source)) ./ std2(source);
    result = result .* std2(target) + mean2(target);
    output = lab2rgb(result);
end