function output = outline_inflation(input, thickness)
    input = single(input)/255;
    output = input;
    erode_filters = [0 1 0; 1 1 1; 0 1 0];
    for i = 1:thickness
        output = imerode(output, erode_filters);
        output = imdilate(output, erode_filters);
        output = imerode(output, erode_filters);
    end
    output = uint8(output*255);
end