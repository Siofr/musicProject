import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Player Variables
float x, y, speed;

// Enemy Variables
float enemySpeed, enemyColour;

// Scale of project, for resizability
float scale;

// Audio variables
Minim minim;
AudioPlayer audioPlayer;
AudioBuffer audioBuffer;

// Setting up custom classes
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int maxEnemies = 100;
Player player;

void setup() {
  size(1000, 1000);
  
  scale = height / 2;
  speed = 5;
  enemySpeed = 3;
  x = width / 2;
  y = height / 2;
  player = new Player(x, y, scale * 16, speed, 255);
  
  generateEnemies();
  strokeWeight(scale / 500);
  
  minim = new Minim(this);
  // audioPlayer = minim.loadFile("epidermis.mp3");
  // audioPlayer.loop();
  // audioBuffer = audioPlayer.mix;
  
  
  
}

void draw() {
  background(255);
  
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = enemies.get(i);
    enemy.createEnemy();
  }
  
  player.update();
  player.crosshair(x, y);
  player.createPlayer(x, y);
}

void generateEnemies() {
  for (int i = 0; i < maxEnemies; i++) {
    Enemy enemy = new Enemy(random(0, width), random(0, height), enemySpeed, scale * 16, 255);
    enemies.add(enemy);
  }
}
