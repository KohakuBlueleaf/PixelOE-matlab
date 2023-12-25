function output = spatialFiltering(input, mask)
  [rows, cols] = size(input);
  [mRows, mCols] = size(mask);
  
  padRows = floor(mRows / 2);
  padCols = floor(mCols / 2);
  
  paddedInput = padarray(input, [padRows, padCols], 'replicate');
  output = zeros('like', input);
  
  for i = 1:rows
    for j = 1:cols
      region = paddedInput(i:i+mRows-1, j:j+mCols-1);
      result = sum(sum(region .* mask));
      output(i, j) = result;
    end
  end
end