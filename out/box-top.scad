difference () {
  translate ([49/2, 19, 35]) {
    difference () {
      minkowski () {
        cube ([49, 38, 70], center=true);
        sphere ($fn=30, r=6);
      }
      cube ([49, 38, 70], center=true);
    }
  }
  translate ([0, 0, -52]) {
    cube ([200, 200, 200], center=true);
  }
  translate ([24.5, 19.0, -49.25]) {
    difference () {
      cube ([300, 300, 200], center=true);
      cube ([54.5, 43.5, 300], center=true);
    }
  }
}
