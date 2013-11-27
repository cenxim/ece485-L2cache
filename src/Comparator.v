//**************************************************
// Cache tag comparator:
// inputs: address tag, cache tag
// outputs: match
//**************************************************

module Comparator(addressTag, cacheTag, match);
  input[4:0] addressTag;                    // Tag coming from virtual address
  input[4:0] cacheTag;                      // Tag coming from cache location
  output reg match;                         // Outputs if they match or not

  always @(addressTag or cacheTag)
  begin
    assign match = addressTag && cacheTag;
  end
end module