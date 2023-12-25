function output = avgchunk(input, k, s)
    output = apply_chunk(input, k, s, @mean2);
end