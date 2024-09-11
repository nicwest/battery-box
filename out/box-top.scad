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
  translate ([0, 0, -52]) {
    cube ([200, 200, 200], center=true);
  }
  translate ([24.5, 19.0, -49.15]) {
    difference () {
      cube ([300, 300, 200], center=true);
      cube ([54.7, 43.7, 300], center=true);
    }
  }
}
