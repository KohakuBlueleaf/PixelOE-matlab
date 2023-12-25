function output = loss(source, target)
    psnr = 10 * log10(255^2 / immse(source, target));
    msssim = mean(multissim(source, target));
    output = strcat(" | PSNR: ", num2str(psnr), " | MSSSIM: ", num2str(msssim));
end