import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float x, y, speed, scale;

Minim minim;
AudioPlayer audioPlayer;
AudioBuffer audioBuffer;

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Player player;

void setup() {
  size(1000, 1000);
  
  scale = height / 2;
  speed = 5;
  x = width / 2;
  y = height / 2;
  player = new Player(x, y, scale * 16, 255);
  
  strokeWeight(scale / 500);
  
  minim = new Minim(this);
  // audioPlayer = minim.loadFile("epidermis.mp3");
  // audioPlayer.loop();
  // audioBuffer = audioPlayer.mix;
  
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).createEnemy(random(0, width), random(0, height));
  }
  
}

void draw() {
  background(255);
  player.update();
  player.crosshair(x, y);
  player.createPlayer(x, y);
}
