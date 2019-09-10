class ball {
  float x, y, r, vx, vy, cy;
  ball(float _x, float _y, float _r, float _vx, float _vy) {
    x = _x;
    y = _y;
    r = _r;
    vx = _vx;
    vy = _vy;
    cy = vy;
  }
  void show() {
    ellipseMode(RADIUS);
    stroke(255);
    fill(255);
    ellipse(x, y, r, r);
  }
  void update() {
    x += vx;
    y += vy;
  }
  void cheakcol() {
    if (y <= r && vy < 0) {
      vy *=-1;
      f1.play();
      f2.stop();
    }
    if (y >= height - r && vy > 0) {
      vy *=-1;
      f1.play();
      f2.stop();
    }
  }
  void colsticks1(sticks s) {
    float d = abs(dist(x, 0, s.x, 0));
    if ((d < r + 3)&&(y < s.y + s.l/2 + 4 && y > s.y - s.l/2 - 4) && vx < 0) {
      f2.stop();
      if (vx > -10) {
        vx -= 0.25;
      }
      float ccc = y - s.y;
      vy = map(ccc, -s.l/2 - 4, s.l/2 + 4, -9, 9);
      vx *= -1;
      f2.play();
      f1.stop();
    }
  }
  void colsticks2(sticks s) {
    float d = abs(dist(x, 0, s.x, 0));
    if ((d < r + 3)&&(y < s.y + s.l/2 + 4 && y > s.y - s.l/2 - 4) && vx > 0) {
      f2.stop();
      if(vx < 10){
        vx +=0.25;
      }
      float ccc = y - s.y;
      vy = map(ccc, -s.l/2 - 4, s.l/2 + 4, -9, 9);
      vx *= -1;
      f4.stop();
      f2.play();
      f1.stop();
    }
  }
};
