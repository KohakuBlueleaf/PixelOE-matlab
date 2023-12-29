function output = apply_chunk_new(input, k, s, func)
    arguments
        input;
        k int32 = 3;
        s int32 = 3;
        func function_handle = @mean2;
    end
    h = size(input, 1);
    w = size(input, 2);
    k_shift = max(k-s,0)/2;
    
    output = zeros("like", input);
    for i = 0: ceil(h/s)-1
        offset_i = i*s;
        output_range_i = offset_i+1:offset_i+s;
        input_range_i = max(1, offset_i+1-k_shift): min(h, offset_i+s+k_shift);
        for j = 0: ceil(w/s)-1
            offset_j = j*s;
            output_range_j = offset_j+1:offset_j+s;
            input_range_j = max(1, offset_j+1-k_shift): min(w, offset_j+s+k_shift);
            for ch = 1:size(input, 3)
                output(output_range_i, output_range_j, ch) = func(input(input_range_i, input_range_j, ch));
            end
        end
    end
end