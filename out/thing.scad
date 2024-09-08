translate ([5, 5, 0]) {
  translate ([17/2, 3, 65/2]) {
    union () {
      cube ([17, 6, 65], center=true);
      translate ([0, 0, 35]) {
        cube ([3, 4.7, 5], center=true);
      }
    }
  }
}
translate ([5, 16, 0]) {
  translate ([17/2, 3, 65/2]) {
    union () {
      cube ([17, 6, 65], center=true);
      translate ([0, 0, 35]) {
        cube ([3, 4.7, 5], center=true);
      }
    }
  }
}
translate ([5, 27, 0]) {
  translate ([17/2, 3, 65/2]) {
    union () {
      cube ([17, 6, 65], center=true);
      translate ([0, 0, 35]) {
        cube ([3, 4.7, 5], center=true);
      }
    }
  }
}
translate ([27, 5, 0]) {
  translate ([17/2, 3, 65/2]) {
    union () {
      cube ([17, 6, 65], center=true);
      translate ([0, 0, 35]) {
        cube ([3, 4.7, 5], center=true);
      }
    }
  }
}
translate ([27, 16, 0]) {
  translate ([17/2, 3, 65/2]) {
    union () {
      cube ([17, 6, 65], center=true);
      translate ([0, 0, 35]) {
        cube ([3, 4.7, 5], center=true);
      }
    }
  }
}
translate ([27, 27, 0]) {
  translate ([17/2, 3, 65/2]) {
    union () {
      cube ([17, 6, 65], center=true);
      translate ([0, 0, 35]) {
        cube ([3, 4.7, 5], center=true);
      }
    }
  }
}
color ([0, 0, 1, ]) {
  difference () {
    translate ([49/2, 19, 3]) {
      cube ([49, 38, 6], center=true);
    }
    translate ([5, 5, 0]) {
      translate ([17/2, 3, 0]) {
        cube ([17, 6, 1000], center=true);
      }
    }
    translate ([5, 16, 0]) {
      translate ([17/2, 3, 0]) {
        cube ([17, 6, 1000], center=true);
      }
    }
    translate ([5, 27, 0]) {
      translate ([17/2, 3, 0]) {
        cube ([17, 6, 1000], center=true);
      }
    }
    translate ([27, 5, 0]) {
      translate ([17/2, 3, 0]) {
        cube ([17, 6, 1000], center=true);
      }
    }
    translate ([27, 16, 0]) {
      translate ([17/2, 3, 0]) {
        cube ([17, 6, 1000], center=true);
      }
    }
    translate ([27, 27, 0]) {
      translate ([17/2, 3, 0]) {
        cube ([17, 6, 1000], center=true);
      }
    }
  }
}
color ([0, 0, 1, ]) {
  translate ([0, 0, 42]) {
    difference () {
      translate ([49/2, 19, 3]) {
        cube ([49, 38, 6], center=true);
      }
      translate ([5, 5, 0]) {
        translate ([17/2, 3, 0]) {
          cube ([17, 6, 1000], center=true);
        }
      }
      translate ([5, 16, 0]) {
        translate ([17/2, 3, 0]) {
          cube ([17, 6, 1000], center=true);
        }
      }
      translate ([5, 27, 0]) {
        translate ([17/2, 3, 0]) {
          cube ([17, 6, 1000], center=true);
        }
      }
      translate ([27, 5, 0]) {
        translate ([17/2, 3, 0]) {
          cube ([17, 6, 1000], center=true);
        }
      }
      translate ([27, 16, 0]) {
        translate ([17/2, 3, 0]) {
          cube ([17, 6, 1000], center=true);
        }
      }
      translate ([27, 27, 0]) {
        translate ([17/2, 3, 0]) {
          cube ([17, 6, 1000], center=true);
        }
      }
    }
  }
}
color ([1, 0, 0, ]) {
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
    union () {
      translate ([0, 0, 148]) {
        cube ([200, 200, 200], center=true);
      }
      translate ([49/2, 19, 148]) {
        cube ([55, 44, 206], center=true);
      }
    }
  }
}
color ([1, 0, 0, ]) {
  translate ([0, 0, 40]) {
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
  }
}
