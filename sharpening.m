function output  = sharpening(input, scale)
    laplacian_mask = [
        [0.0, 1.0, 0.0]
        [1.0, -4.0, 1.0]
        [0.0, 1.0, 0.0]
    ];
    img_sm_lab = rgb2lab(input);
    img_sm_lab(:,:,1) = laplacianFiltering(img_sm_lab(:,:,1), single(laplacian_mask), -0.1 * scale);
    img_sm_lab(:,:,2) = laplacianFiltering(img_sm_lab(:,:,2), single(laplacian_mask), -0.05 * scale);
    img_sm_lab(:,:,3) = laplacianFiltering(img_sm_lab(:,:,3), single(laplacian_mask), -0.05 * scale);
    output = lab2rgb(img_sm_lab);
end