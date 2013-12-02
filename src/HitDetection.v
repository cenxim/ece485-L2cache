//**************************************************
// HIT DETECTION
// Instantiate the 8 to 1 multiplexor using the cache data as the inputs,
// and wire up the select bits to an AND function of the comparator and the
// valid bit of each line.
//
// Hit detection will be the OR function of all the select bits, and if
// a hit is detected then the corresponding data will be output by the
// multiplexor.
//
// Long story short --
// Inputs: (Cache data, Cache tag, Address tag, Valid bit) all according to
// cache index
// Outputs: Hit, Cache line
//**************************************************

module HitDetector(
  valid,
  addressTag,
  cacheTag,
  cacheData,
  hit,
  cacheLine
);

input [7:0] valid;
input [7:0] addressTag;
input [7:0] cacheTag;
input [7:0] cacheData;
output hit;
output cacheLine;

wire comparator_out[7:0];
wire encoder_out[2:0];
wire mux_out;

// Instantiate our 8 comparators
module comparator1(addressTag[0], cacheTag[0], comparator_out[0]);
module comparator2(addressTag[1], cacheTag[1], comparator_out[1]);
module comparator3(addressTag[2], cacheTag[2], comparator_out[2]);
module comparator4(addressTag[3], cacheTag[3], comparator_out[3]);
module comparator5(addressTag[4], cacheTag[4], comparator_out[4]);
module comparator6(addressTag[5], cacheTag[5], comparator_out[5]);
module comparator7(addressTag[6], cacheTag[6], comparator_out[6]);
module comparator8(addressTag[7], cacheTag[7], comparator_out[7]);

// Instantiate our encoder
module encoder(cacheData, encoder_out);

// Instantiate our multiplexor
module multiplexor(encoder_out, cacheData, mux_out);

// 
  assign hit =  (comparator_out[0] && valid[0]) ||
                (comparator_out[1] && valid[1]) ||
                (comparator_out[2] && valid[2]) ||
                (comparator_out[3] && valid[3]) ||
                (comparator_out[4] && valid[4]) ||
                (comparator_out[5] && valid[5]) ||
                (comparator_out[6] && valid[6]) ||
                (comparator_out[7] && valid[7]);

  assign cacheLine = mux_out;
end
endmodule