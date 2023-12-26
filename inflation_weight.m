function output = inflation_weight(input, k, avg_scale, dist_scale)
    arguments
        input;
        k int32 = 16;
        avg_scale single = 10;
        dist_scale single = 3;
    end
    img_gray = rgb2gray(input);
    avg_brightness = apply_chunk(img_gray, k, @mean2);
    max_brightness = apply_chunk(img_gray, k, @maximum2);
    min_brightness = apply_chunk(img_gray, k, @minimum2);
    bright_distance = max_brightness - avg_brightness;
    dark_distance = avg_brightness - min_brightness;
    
    shift_avg_brightness = apply_shift_chunk(img_gray, k, @mean2);
    shift_max_brightness = apply_shift_chunk(img_gray, k, @maximum2);
    shift_min_brightness = apply_shift_chunk(img_gray, k, @minimum2);
    shift_bright_distance = shift_max_brightness - shift_avg_brightness;
    shift_dark_distance = shift_avg_brightness - shift_min_brightness;
    
    weight = (avg_brightness-0.5)*avg_scale;
    weight = weight - (bright_distance-dark_distance)*dist_scale;
    shift_weight = (shift_avg_brightness-0.5)*avg_scale;
    shift_weight = shift_weight - (shift_bright_distance-shift_dark_distance)*dist_scale;
    % imshow(shift_weight);
    output = sigmoid((weight+shift_weight)/2);
    output = apply_shift_chunk(output, k/2, @interpolate);
    output = output - minimum2(output);
    output = output / maximum2(output);
end

function output = maximum2(chunk)
    output = max(max(chunk));
end

function output = minimum2(chunk)
    output = min(min(chunk));
end

function output = interpolate(chunk)
    [h, w] = size(chunk);
    output = zeros(h, w);
    tl = chunk(1, 1);
    tr = chunk(1, w);
    bl = chunk(h, 1);
    br = chunk(h, w);
    for i = 1:h
        left = (bl * i + tl * (h-i))/h;
        right = (br * i + tr * (h-i))/h;
        for j = 1:w
            output(i, j) = (right * j + left * (w-j))/w;
        end
    end
end