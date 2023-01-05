
//Tower Defense Game (change name later)
//Annie Lee
//Programming 12
//Oct 24, 2022

/*
game concept: dark fantasy pixel game. dark tones, soundtrack, SCARY gameplay as you advance
 storyline: save the world from the demons/dragons/monsters with the help of elves/fairies
 */

// ================ GLOBAL VARIABLES =================

final int INTRO         = 0;
final int MAP_SELECTION = 1;
final int PLAY          = 2;
final int BUILD         = 3;
final int GAMEOVER      = 4;
int mode;
int map = 1;
int nodes;
int wave = 0;
int elixir = 30;
int lives = 3;

// tower types
final int GUN = 0;
final int SNIPER = 1;
final int AOE = 2;

// tower costs
final int[] price = {10, 20, 30};

//Pallette
color white = #ffffff;
color black = #000000;
color grey = #cccccc;
color blue = #0353a4;
color lBlue = #d9ed92;
color purple = #A020F0;
color dPurple = #32004f;
color pink = #FFC0CB;
color red = #00406c;
color green = #378805;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, next, buildModeButton, playButton, buyGunTowerButton, buySniperTowerButton, buyAoETowerButton, selectMap1, selectMap2, tryAgain;

//Collections of objects, arrays
Node[] map1nodes;
Node[] map2nodes;

public ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
PImage map1, map2;

PImage bg, bg2;
PImage path;
PImage waterMageMagic;

PImage pWaterMage;
PImage pGuitarShooter;
PImage pDarkWizard;
PImage ghost;
PImage ghoul;
PImage giant;

Gif intro;
Gif waterMage;
Gif guitarShooter;
Gif darkWizard;

//Fonts
PFont dHomicide;
PFont script;
PFont tandy;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1100, 700);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();

  mode = INTRO; //MAP_SELECTION;
  map = 1;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  //imageMode(CENTER);
  textAlign(CENTER, CENTER);
}

void initializeVariables() {
  //Load Images & Gifs
  intro = new Gif("intro2/frame_", "_delay-0.02s.gif", 13, 1, width/2, height/2, width, height);
  waterMage = new Gif("water_mage/frame_", "_delay-0.08s.gif", 13, 1, width/2, height/2, width, height);
  guitarShooter = new Gif("guitarShooter/frame_", "_delay-0.06s.gif", 150, 1, width/2, height/2, width, height);
  darkWizard = new Gif("darkWizard/frame_", "_delay-0.04s.gif", 50, 1, width/2, height/2, width, height);

  bg = loadImage("map.png");
  path = loadImage("path.png");
  map2 = loadImage("map2.png");
  waterMageMagic = loadImage("waterMageMagic.png");
  ghost = loadImage("ghost.gif");
  ghoul = loadImage("ghoul.gif");
  giant = loadImage("giant.gif");

  pWaterMage = loadImage("waterMage.gif");
  pGuitarShooter = loadImage("guitarShooter.gif");
  pDarkWizard = loadImage("pDarkWizard.png");

  //Load Fonts
  dHomicide = createFont("DoubleHomicide.ttf", 50);
  script = createFont("script.otf", 42);
  tandy = createFont("tandy.ttf", 42);

  //Create Collections of Objects
  map1nodes = new Node[9];
  mobs = new ArrayList<Mob>(); // ArrayList<ObjType> name = new ArrayList<ObjType>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
}

//Plot the nodes on the map
void makeNodes() {
  map1nodes = new Node[14];
  map1nodes[0] = new Node(70, 384, 0, 1);
  map1nodes[1] = new Node(72, 426, 1, 0);
  map1nodes[2] = new Node(435, 424, 0, 1);
  map1nodes[3] = new Node(431, 534, -1, 0);
  map1nodes[4] = new Node(126, 534, 0, 1);
  map1nodes[5] = new Node(126, 634, 1, 0);
  map1nodes[6] = new Node(517, 634, 0, -1);
  map1nodes[7] = new Node(517, 315, -1, 0);
  map1nodes[8] = new Node(169, 315, 0, -1);
  map1nodes[9] = new Node(169, 135, 1, 0);
  map1nodes[10] = new Node(648, 135, 0, 1);
  map1nodes[11] = new Node(650, 522, 1, 0);
  map1nodes[12] = new Node(785, 522, 0, -1);
  map1nodes[13] = new Node(785, 123, 1, 0);

  map2nodes = new Node[5];
  map2nodes[0] = new Node(32, 190, 1, 0);
  map2nodes[1] = new Node(145, 190, 0, 1);
  map2nodes[2] = new Node(145, 500, 1, 0);
  map2nodes[3] = new Node(450, 500, 0, -1);
  map2nodes[4] = new Node(450, 355, 1, 0);
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", "", width/2, 450, 300, 100, black, white, false);

  // MAP_SELECTION
  selectMap1 = new Button("THE DUNGEON", "", 300, 470, 250, 125, grey, white, false);
  selectMap2 = new Button("THE FIELD", "", 800, 470, 250, 125, green, white, false);

  tryAgain = new Button("TRY AGAIN", "", width/2, 470, 200, 100, grey, white, false);

  //next - Next Wave
  next = new Button("NEXT WAVE", "", 970, 640, 220, 60, black, white, false);
  //build - To build mode, Buy Sniper, Buy Gun, Buy AoE
  buildModeButton = new Button("BUILD", "", 970, 550, 220, 60, black, white, false);
  // gun tower
  //PImage pic, String t, String price, int _x, int _y, int _w, int _h, color norm, color high, boolean towerButton
  buyGunTowerButton = new Button(pWaterMage, "$10", "Water Mage", "The mage is an ancient being who harnesses the element of water.", 878, 160, 80, 65, lBlue, white, true);
  // sniper tower
  buySniperTowerButton = new Button(pGuitarShooter, "$20", "Mystic Music", "This music elf is a mystical being who uses their instrument gifted from the gods to fight evil.", 880+87, 160, 80, 65, red, white, true);
  // aoe tower
  buyAoETowerButton = new Button(pDarkWizard, "$30", "Dark Wizard", "The wizard is a mysterious being who uses an unknown power to create high energy rings of dark magic.", 880+87*2, 160, 80, 65, dPurple, white, true);
  // play - Go from build to play
  playButton = new Button("PLAY", "", 970, 640, 220, 60, black, white, false);
  //GAMEOVER - Reset
}

// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAP_SELECTION) {
    mapSelect();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  println(mouseX + ", " + mouseY);
}
