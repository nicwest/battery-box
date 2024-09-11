difference () {
  translate ([49/2, 19, 75/2]) {
    difference () {
      minkowski () {
        cube ([49, 38, 75], center=true);
        sphere ($fn=30, r=6);
      }
      cube ([49, 38, 75], center=true);
    }
  }
  union () {
    translate ([0, 0, 148]) {
      cube ([200, 200, 200], center=true);
    }
    translate ([49/2, 19, 148]) {
      cube ([55, 44, 206], center=true);
    }
  }
  translate ([49/2, 0, -5]) {
    cube ([10, 1000, 2], center=true);
  }
}
