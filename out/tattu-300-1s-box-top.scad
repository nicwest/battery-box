difference () {
  translate ([43.75, 15.0, 75/2]) {
    difference () {
      minkowski () {
        cube ([87.5, 30.0, 75], center=true);
        sphere ($fn=30, r=6);
      }
      cube ([87.5, 30.0, 75], center=true);
    }
  }
  translate ([0, 0, -52]) {
    cube ([200, 200, 200], center=true);
  }
  translate ([43.74999999999999, 15.000000000000002, -49.15]) {
    difference () {
      cube ([300, 300, 200], center=true);
      cube ([93.19999999999999, 35.7, 300], center=true);
    }
  }
}
