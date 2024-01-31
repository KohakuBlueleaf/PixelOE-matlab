function output = expansion_weight(input, k, avg_scale, dist_scale)
    arguments
        input;
        k int32 = 16;
        avg_scale single = 10;
        dist_scale single = 3;
    end
    img_gray = rgb2gray(input);
    avg_brightness = apply_chunk_new(img_gray, k*3, k, @median2);
    max_brightness = apply_chunk_new(img_gray, k, k, @maximum2);
    min_brightness = apply_chunk_new(img_gray, k, k, @minimum2);
    bright_distance = max_brightness - avg_brightness;
    dark_distance = avg_brightness - min_brightness;
    
    weight = (avg_brightness-0.5)*avg_scale;
    weight = weight - (bright_distance-dark_distance)*dist_scale;
    
    output = sigmoid(weight);
    output = imresize(output, 1/single(k), 'nearest');
    output = imresize(output, k, "bilinear");
    output = output - minimum2(output);
    output = output / maximum2(output);
end

function output = maximum2(chunk)
    output = max(max(chunk));
end

function output = minimum2(chunk)
    output = min(min(chunk));
end

function output = median2(chunk)
    output = median(chunk, "all");
end