import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Player Variables
float x, y, playerSize, speed;
PVector playerPosition;

// Pickup Variables
float pickupColour, pickupSize;
int numPickups;

// Scale of project, for resizability
float scale;

// Score Counter
int score = 0;

// Audio variables
Minim minim;
AudioPlayer audioPlayer;
AudioBuffer audioBuffer;

// Setting up custom classes
ArrayList<Pickup> pickups = new ArrayList<Pickup>();
int maxPickups = 5;
Player player;

void setup() {
  fullScreen();
  numPickups = 0;
  generatePickups();
  scale = height / 2;
  playerSize = scale / 16;
  pickupSize = scale / 16;
  speed = 0.03;
  x = width / 2;
  y = height / 2;
  playerPosition = new PVector(x, y);
  player = new Player(playerPosition, playerSize, speed, 255);

  strokeWeight(scale / 500);
  
  minim = new Minim(this);
  // audioPlayer = minim.loadFile("epidermis.mp3");
  // audioPlayer.loop();
  // audioBuffer = audioPlayer.mix;
  
  
  
}

void draw() {
  background(255);
  textSize(scale / 10);
  fill(0);
  text("Score: " + str(score), 40, 120);
  back();
  
  for (int i = 0; i < pickups.size(); i++) {
    Pickup pickup = pickups.get(i);
    pickup.createPickup();
    numPickups += 1;
    if (pickup.pickedUp(playerPosition, playerSize)) {
      pickups.remove(i);
      numPickups -= 1;
      score += 1;
    }
  }
  
  numPickups = pickups.size();
  
  if (numPickups < maxPickups) {
    generatePickups();
  }
  
  player.update();
  player.createPlayer(playerPosition);
  playerPosition = player.playerPosition;
}

void generatePickups() {
  while (numPickups < maxPickups) {
    Pickup pickup = new Pickup(random(scale / 5, width - (scale / 5)), random(scale / 5, height - (scale / 5)), pickupSize, 255);
    pickups.add(pickup);
    numPickups = pickups.size();
  }
}

void back() {
  
}
