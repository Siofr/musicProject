import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Scene Variables
int sceneNumber;

// Player Variables
float x, y, playerSize, playerSpeed;
PVector playerPosition, playerColour;

// Pickup Variables
float pickupSize;
int numPickups;
PVector pickupColour;

// Healthbar Variables
Health healthbar;
PVector healthPosition, healthColour;
int time;
float healthWidth, healthHeight, depletionRate;

// Scale of project, for resizability
float scale;

// Score Counter
int score = 0;

// Text Variables
PVector textColour;

// Audio variables
Minim minim;
AudioPlayer audioPlayer;
AudioBuffer audioBuffer;
FFT fft;
float average, lerpedAverage, audioSize;

// Setting up custom classes
ArrayList<Pickup> pickups = new ArrayList<Pickup>();
int maxPickups = 5;
Player player;

void setup() {
 
  size(800, 800);
  scale = height / 2;
  noStroke();
  
  // Scenes
  sceneNumber = 0;
  
  // Player
  x = width / 2;
  y = height / 2;
  playerSpeed = 0.03;
  playerSize = scale / 16;
  playerPosition = new PVector(x, y);
  playerColour = new PVector(168, 220, 217);
  player = new Player(playerPosition, playerSize, playerSpeed, playerColour);
  
  // Pickups
  numPickups = 0;
  pickupSize = scale / 16;
  pickupColour = new PVector(226, 163, 199);
  generatePickups();
  
  // Text
  textColour = new PVector(96, 67, 95);
  
  // Healthbar
  depletionRate = 2;
  healthPosition = new PVector(590, 10);
  healthColour = new PVector(214, 122, 177);
  healthWidth = 200;
  healthHeight = 50;
  healthbar = new Health(healthPosition, healthWidth, healthHeight, healthColour, textColour);
  
  // Audio Setup
  minim = new Minim(this);
}

void draw() {
  
  background(253, 247, 250);
  
  // If healthbar is depleted change scene to game over screen
  if(healthbar.healthWidth <= 0) {
    sceneNumber = 2;
  }
  
  // Handles scene changing
  if (sceneNumber == 0) {
    mainMenuScreen();
  } else if (sceneNumber == 1) {
    gameScreen();
  } else if (sceneNumber == 2) {
    audioPlayer.pause();
    gameOverScreen();
  }
}

// Function for Main Menu Screen
void mainMenuScreen() {
  textSize(scale / 10);
  textAlign(CENTER);
  fill(textColour.x, textColour.y, textColour.z);
  text("Choose A Song", width / 2, scale / 4);
  text("1. The Cybergrind, Meganeko", width / 2, scale / 1.5);
  text("2. Epidermis, Venetian Snares", width / 2, scale / 1);
  if (keyPressed) {
    if (key == '1') {
      audioPlayer = minim.loadFile("TheCyberGrind.mp3");
      audioPlayer.loop();
      audioBuffer = audioPlayer.mix;
      fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
      sceneNumber = 1;
    } else if (key == '2') {
      audioPlayer = minim.loadFile("epidermis.mp3");
      audioPlayer.loop();
      audioBuffer = audioPlayer.mix;
      fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
      sceneNumber = 1;
    }
  }
}

// Function for Game Screen
void gameScreen() {
  textSize(scale / 10);
  textAlign(CENTER);
  fill(textColour.x, textColour.y, textColour.z);
  text("Score: " + str(score), width / 2, scale / 8);
  
  healthbar.createHealth();
  healthbar.healthWidth = healthbar.healthWidth - depletionRate;
  
  float total = 0;
  
  for(int i = 0; i < audioBuffer.size(); i++) {
    total += abs(audioBuffer.get(i));
  }
  
  fft.forward(audioPlayer.mix);
  
  for (int i = 0; i < fft.specSize(); i++) {
    rect(0, map(i, 0, fft.specSize(), height / 2, height), fft.getBand(i), 1);
    rect(width, map(i, 0, fft.specSize(), height / 2, height), -fft.getBand(i), 1);
    
    rect(0, map(-i, 0, fft.specSize(), height / 2, height), fft.getBand(i), 1);
    rect(width, map(-i, 0, fft.specSize(), height / 2, height), -fft.getBand(i), 1);
  }
  
  average = total / (float) audioBuffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  
  for (int i = 0; i < pickups.size(); i++) {
    Pickup pickup = pickups.get(i);
    pickup.createPickup();
    numPickups += 1;
    pickup.size = map(lerpedAverage, 0, 1, 5, 150);
    if (pickup.pickedUp(playerPosition, playerSize)) {
      pickups.remove(i);
      numPickups -= 1;
      healthbar.healthWidth = 200;
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

// Function for Game Over Screen
void gameOverScreen() {
  fill(textColour.x, textColour.y, textColour.z);
  text("GAME OVER", width / 2, height / 2 - (scale / 10));
  text("SCORE: " + str(score), width / 2, height / 2 + (scale /10));
  text("Click to Restart", width / 2, height / 2 + (scale / 2));
  
  if (mousePressed) {
    healthbar.healthWidth = 200;
    sceneNumber = 0;
  }
}

// Generating Pickups
void generatePickups() {
  while (numPickups < maxPickups) {
    Pickup pickup = new Pickup(random(scale / 2, width - (scale / 5)), random(scale / 5, height - (scale / 2)), pickupSize, pickupColour);
    pickups.add(pickup);
    numPickups = pickups.size();
  }
}
