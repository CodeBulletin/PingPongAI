import processing.sound.*;

SoundFile f1;
SoundFile f2;
SoundFile f3;
SoundFile f4;

ball B;
sticks s1, s2;
int rP = 0, lP = 0, rt = 0, vic = 0;  
float rxx, ryy, rxx1, ryy1, rx, ry, rx1, ry1;
int quil = 3, quil1 = 3, win = 0;

PVector aa, bb, cc, dd;

void setup() {
  fullScreen(P2D);
  smooth(8);
  if (rt == 0) {
    once();
  }
  float k = random(1);
  if (k < 0.5) {
    B = new ball(width/2, height/2, 8, 5, random(-3, 3));
  } else {
    B = new ball(width/2, height/2, 8, -5, random(-3, 3));
  }
  s1 = new sticks(aa.x, height/2, 80, 4);
  s2 = new sticks(bb.x, height/2, 80, 4);
}
void once() {
  rt = 1;
  f1 = new SoundFile(this, "Ping Pong Paddle 02.wav");
  f2 = new SoundFile(this, "Ping Pong Paddle 03.wav");
  f3 = new SoundFile(this, "Ta Da-SoundBible.wav");
  f4 = new SoundFile(this, "point.wav");
  aa = new PVector(400, 0);
  bb = new PVector(width-400, 0);
  cc = new PVector(bb.x, height);
  dd = new PVector(aa.x, height);
}
void keyPressed() {
  if (key == 'r') {
    lP=0;
    rP=0;
    rt = 0;
    vic = 0;
    win = 0;
    f1.stop();
    f2.stop();
    f3.stop();
    f4.stop();
    setup();
  }
  if (key == 'p') {
    looping = !looping;
  }
}
int cheakwin() {
  if (lP == 5) {
    return 1;
  }
  if (rP == 5) {
    return 2;
  }
  return 0;
}
boolean cheakcol() {
  if (B.x < aa.x) {
    rP++;
    return true;
  } else if (B.x > bb.x) {
    lP++;
    return true;
  }
  return false;
}
void draw() {
  background(0);
  stroke(255);
  line(aa.x - 10, aa.y, dd.x - 10, dd.y);
  line(bb.x + 10, bb.y, cc.x + 10, cc.y);
  for (float i = 3; i < height; i+=39) {
    float j = i+20;
    line(width/2, i, width/2, j);
  };
  textSize(48);
  fill(255);
  text(lP, ((aa.x-10) + width/2)/2-15, 50);
  text(rP, ((bb.x+10) + width/2)/2-15, 50);
  text("AI ONE", (aa.x - 10)/2 - 80, height/2 + 19);
  text("AI TWO", ((bb.x + 10)+width)/2 - 76, height/2 + 19);
  win = cheakwin();
  if (win == 0) {
    fline(B.x, B.y, B.vx, B.vy, 5);
    B.update();
    B.show();
    if (cheakcol()) {
      f4.play();
      setup();
    }
    if (quil == 0 && rx < width/2) {
      for (int i = 0; i < s1.v; i++) {
        s1.update(ry);
      }
    } else if (quil == 1 && rx1 < width/2) {
      for (int i = 0; i < s1.v; i++) {
        s1.update(ry1);
      }
    }
    if (quil1 == 0 && rx > width/2) {
      for (int i = 0; i < s2.v; i++) {
        s2.update(ry);
      }
    } else if (quil1 == 1 && rx1 > width/2) {
      for (int i = 0; i < s2.v; i++) {
        s2.update(ry1);
      }
    }
    B.cheakcol();
    B.colsticks1(s1);
    B.colsticks2(s2);
    s1.show();
    s2.show();
  } else if (win == 1) {
    text("AI ONE WON", width/2-133, height/2);
    if (vic == 0) {
      vic = 1;
      f3.play();
    }
  } else if (win == 2) {
    text("AI TWO WON", width/2-133, height/2);
    if (vic == 0) {
      vic = 1;
      f3.play();
    }
  }
}
