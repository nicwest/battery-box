difference () {
  translate ([43.75, 15.0, 61/2]) {
    difference () {
      minkowski () {
        cube ([87.5, 30.0, 61], center=true);
        sphere ($fn=30, r=6);
      }
      cube ([87.5, 30.0, 61], center=true);
    }
  }
  union () {
    translate ([0, 0, 134]) {
      cube ([200, 200, 200], center=true);
    }
    translate ([43.75, 15.0, 134]) {
      cube ([93.5, 36.0, 206], center=true);
    }
  }
  translate ([43.75, 0, -5]) {
    cube ([10, 1000, 2], center=true);
  }
}
