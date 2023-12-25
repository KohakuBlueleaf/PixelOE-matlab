function output = outline_inflation(input, thickness)
    arguments
        input;
        thickness int32 = 4;
    end
    img_gray = rgb2gray(input);
    avg_brightness = avgchunk(img_gray, 16, 16);
    weight = sigmoid((avg_brightness-0.5)*5);
    
    img_erode = input;
    img_dilate = input;
    for i = 1:thickness
        img_erode = imerode(img_erode, [0 1 0; 1 1 1; 0 1 0]);
        img_dilate = imdilate(img_dilate, [0 1 0; 1 1 1; 0 1 0]);
    end
    % imshow(img_erode);
    output = img_erode .* weight + img_dilate .* (1 - weight);
end