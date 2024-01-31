function output = color_styling(input, saturation, contrast)
    arguments
        input;
        saturation single = 1.2;
        contrast single = 1.1;
    end
    
    output = input;
    output = rgb2hsv(output);
    output(:, :, 2) = output(:, :, 2) * saturation;
    output(:, :, 3) = output(:, :, 3) * contrast - (contrast-1);
    output(output>1) = 1;
    output(output<0) = 0;
    output = hsv2rgb(output);
end