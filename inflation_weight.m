function output = inflation_weight(input, k, s, avg_scale, dist_scale)
    arguments
        input;
        k int32 = 16;
        s int32 = 16;
        avg_scale single = 10;
        dist_scale single = 3;
    end
    img_gray = rgb2gray(input);
    avg_brightness = avgchunk(img_gray, k, s);
    max_brightness = apply_chunk(img_gray, k, s, @maximum2);
    min_brightness = apply_chunk(img_gray, k, s, @minimum2);
    bright_distance = max_brightness - avg_brightness;
    dark_distance = avg_brightness - min_brightness;
    
    output = sigmoid((avg_brightness-0.5)*avg_scale - (bright_distance-dark_distance)*dist_scale);
end

function output = maximum2(chunk)
    output = max(max(chunk));
end

function output = minimum2(chunk)
    output = min(min(chunk));
end