function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)
  laplacian = spatialFiltering(input, laplacianMask);
  scaledLaplacian = scale * laplacian;
  output = input + scaledLaplacian;
end