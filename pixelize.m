function output = pixelize(input, target_size, resize_method, thickness, patch_size)
    arguments
        input uint8;
        target_size int32 = 128;
        resize_method string = "bicubic";
        thickness int32 = 5;
        patch_size int32 = 16;
    end
    input = single(input)/255;
    
    % Before downscale
    % The operation that should be applied before downscale
    % Outline inflation
    % Color palette choice
    % Low-pass Filter
    img = input;
    img = imgaussfilt(img, 0.5);
    img = outline_inflation(img, thickness, thickness, patch_size, 12, 3);
    % imshow(img);
    
    % downscale
    % Different downscale method may have Different result
    img_sm = resize(img, target_size, resize_method);
    
    % After downscale
    % Apply color palette
    % Apply dithering
    % Apply color transfering
    % img_sm = imgaussfilt(img_sm, 0.2);
    % diagLaplacianMask = [
    %     [1.0, 1.0, 1.0]
    %     [1.0, -8.0, 1.0]
    %     [1.0, 1.0, 1.0]
    % ];
    % img_sm_lab = rgb2lab(img_sm);
    % img_sm_lab(:,:,1) = laplacianFiltering(img_sm_lab(:,:,1), single(diagLaplacianMask), -0.1);
    % img_sm_lab(:,:,2) = laplacianFiltering(img_sm_lab(:,:,2), single(diagLaplacianMask), -0.05);
    % img_sm_lab(:,:,3) = laplacianFiltering(img_sm_lab(:,:,3), single(diagLaplacianMask), -0.05);
    % img_sm = lab2rgb(img_sm_lab);
    
    img_sm = match_color(img_sm, input);
    
    % output, use nearest to get "pixel" effect
    output = imresize(img_sm, [size(input, 1), size(input, 2)], 'nearest');
    output = uint8(output*255);
end

