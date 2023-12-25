function output = diffchunk(input, k, s)
    output = apply_chunk(input, k, s, @diff);
end

function output = diff(chunk)
    output = max2(chunk) - min2(chunk);
end