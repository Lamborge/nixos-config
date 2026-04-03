{ ... }:
let
bands = {
  band0 = { frequency = 105.0;   gain =  7.5;   q = 0.7;  type = "Lo-shelf"; mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band1 = { frequency = 195.0;   gain = -16.4;  q = 0.18; type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band2 = { frequency = 5708.0;  gain =  8.8;   q = 0.96; type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band3 = { frequency = 223.0;   gain =  19.5;  q = 0.5;  type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band4 = { frequency = 5459.0;  gain = -10.9;  q = 2.6;  type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band5 = { frequency = 10000.0; gain =  1.7;   q = 0.7;  type = "Hi-shelf"; mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band6 = { frequency = 58.0;    gain = -0.9;   q = 2.68; type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band7 = { frequency = 775.0;   gain =  1.1;   q = 2.76; type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band8 = { frequency = 3779.0;  gain =  3.7;   q = 4.57; type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
  band9 = { frequency = 3093.0;  gain = -1.5;   q = 0.84; type = "Bell";     mode = "RLC (BT)"; mute = false; solo = false; slope = "x1"; width = 4.0; };
};
in
{
xdg.dataFile."easyeffects/output/hd400s.json".text = builtins.toJSON { 
  output = {
    blocklist = [];
    plugins_order = [ "equalizer#0" ];
    "equalizer#0" = {
      bypass          = false;
      "input-gain"    = -3.8;
      "output-gain"   = 0.0;
      balance         = 0.0;
      mode            = "IIR";
      "num-bands"     = 10;
      "split-channels" = false;
      "pitch-left"    = 0.0;
      "pitch-right"   = 0.0;
      left = bands;
      right = bands;
    };
  };
};
}
