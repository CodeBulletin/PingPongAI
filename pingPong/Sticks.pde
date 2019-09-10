class sticks {
  float x, y, l, v;
  color c;
  sticks(float _x, float _y, float _l, float _v) {
    x = _x;
    y = _y;
    l = _l;
    v = _v;
    c = color(255);
  }
  void show() {
    rectMode(CENTER);
    stroke(c);
    fill(c);
    rect(x, y, 6, l);
  }
  void update(float ys) {
    if ((y > l/2+1 || ys > y) && (y < height - l/2-1 || ys < y)) {
      if (ys > y) {
        y += 1;
      }
      if (ys < y) {
        y -= 1;
      }
    }
  }
};
