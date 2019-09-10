float oldy, oldy1;
boolean intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float x, float y) {
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    strokeWeight(1);
    stroke(255);
    float ix = x1 + (uA * (x2-x1));
    float iy = y1 + (uA * (y2-y1));
    line(x, y, ix, iy);
    return true;
  }
  return false;
}
void interseptf(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float vx, float vy, int m, sticks s) {
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float ix = x1 + (uA * (x2-x1));
  float iy = y1 + (uA * (y2-y1));
  float ccc = iy - s.y;
  rxx1 = ix;
  if (int(ceil(iy)) != int(ceil(oldy))) {
    ryy1 = iy + random(-s.l/2, s.l/2);
  }
  vy = map(ccc, -s.l/2-4, s.l/2+4, -9, 9);
  fline(ix, iy, -vx, vy, m-1);
  oldy = iy;
}
void interseptf1(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float vx, float vy, int m) {
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float ix = x1 + (uA * (x2-x1));
  float iy = y1 + (uA * (y2-y1));
  fline(ix, iy, vx, -vy, m-1);
}
void interseptf2(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, sticks s) {
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float ix = x1 + (uA * (x2-x1));
  float iy = y1 + (uA * (y2-y1));
  rxx = ix;
  if (int(ceil(iy)) != int(ceil(oldy1))) {
    ryy = iy + random(-s.l/2, s.l/2);
  }
  oldy1 = iy;
}


void fline(float x, float y, float vx, float vy, int m) {
  if (m >= 0) {
    PVector vel = new PVector(vx, vy);
    vel.setMag(10000);
    float cx = x + vel.x;
    float cy = y + vel.y;
    if (intersect(x, y, cx, cy, aa.x, s1.y - s1.l/2 - 3, aa.x, s1.y + s1.l/2 + 3, x, y) && B.vx < 0) {
      interseptf(x, y, cx, cy, aa.x, s1.y - s1.l/2, aa.x, s1.y + s1.l/2, vx, vy, m, s1);
      quil = 0;
      ry = ryy1;
      rx = rxx1;
    } else {
      if (intersect(x, y, cx, cy, dd.x, dd.y, aa.x, aa.y, x, y)) {
        interseptf2(x, y, cx, cy, dd.x, dd.y, aa.x, aa.y, s1);
        quil = 1;
        ry1 = ryy;
        rx1 = rxx;
      }
    }
    if (intersect(x, y, cx, cy, bb.x, s2.y - s2.l/2 - 3, bb.x, s2.y + s2.l/2 + 3, x, y) && B.vx > 0) {
      interseptf(x, y, cx, cy, bb.x, s2.y - s2.l/2, bb.x, s2.y + s2.l/2, vx, vy, m, s2);
      quil1 = 0;
      ry = ryy1;
      rx = rxx1;
    } else {
      if (intersect(x, y, cx, cy, bb.x, bb.y, cc.x, cc.y, x, y)) {
        interseptf2(x, y, cx, cy, bb.x, bb.y, cc.x, cc.y, s2);
        quil1 = 1;
        ry1 = ryy;
        rx1 = rxx;
      }
    }
    if (intersect(x, y, cx, cy, aa.x, aa.y, bb.x, bb.y, x, y)) {
      interseptf1(x, y, cx, cy, aa.x, aa.y, bb.x, bb.y, vx, vy, m);
    }
    if (intersect(x, y, cx, cy, cc.x, cc.y, dd.x, dd.y, x, y)) {
      interseptf1(x, y, cx, cy, cc.x, cc.y, dd.x, dd.y, vx, vy, m);
    }
  }
}
