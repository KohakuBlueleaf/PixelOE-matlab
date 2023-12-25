function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)
  laplacian = spatialFiltering(input, laplacianMask);
  scaledLaplacian = scale * laplacian;
  output = input + scaledLaplacian;
  % output = min(max(output, 0), 1);
end