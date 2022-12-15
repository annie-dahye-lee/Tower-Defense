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
int map;
int nodes;
int wave = 1;
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
color blue = #0000FF;
color purple = #A020F0;
color pink = #FFC0CB;
color red = #B90E0A;
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
ArrayList<AoE_Ring> rings;
ArrayList<Bullet> bullets;

//Images and Gifs
PImage bg, bg2;
PImage path;

PImage map1, map2;

Gif intro;

//Fonts


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
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  //imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = GAMEOVER; //MAP_SELECTION;
}

void initializeVariables() {
  //Load Images & Gifs
  intro = new Gif("intro2/frame_", "_delay-0.02s.gif", 13, 2, width/2, height/2, width, height);
  bg = loadImage("map.png");
  path = loadImage("path.png");
  map2 = loadImage("map2.png");

  //Load Fonts

  //Create Collections of Objects
  map1nodes = new Node[9];
  mobs = new ArrayList<Mob>(); // ArrayList<ObjType> name = new ArrayList<ObjType>();
  towers = new ArrayList<Tower>();
  rings = new ArrayList<AoE_Ring>();
  bullets = new ArrayList<Bullet>();
}

//Plot the nodes on the map
void makeNodes() {
  map1nodes = new Node[14];
  map1nodes[0] = new Node(85, 400-32, 0, 1);
  map1nodes[1] = new Node(85, 440-38, 1, 0);
  map1nodes[2] = new Node(414, 440-38, 0, 1);
  map1nodes[3] = new Node(414, 515-17, -1, 0);
  map1nodes[4] = new Node(134, 515-17, 0, 1);
  map1nodes[5] = new Node(134, 595-7, 1, 0);
  map1nodes[6] = new Node(496, 595-7, 0, -1);
  map1nodes[7] = new Node(496, 365-52, -1, 0);
  map1nodes[8] = new Node(175, 365-52, 0, -1);
  map1nodes[9] = new Node(175, 210-63, 1, 0);
  map1nodes[10] = new Node(619, 210-62, 0, 1);
  map1nodes[11] = new Node(619, 515-28, 1, 0);
  map1nodes[12] = new Node(743, 515-28, 0, -1);
  map1nodes[13] = new Node(745, 130-74, 1, 0);
  
  map2nodes = new Node[5];
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", "", width/2, 450, 200, 100, black, white, false);
  
  // MAP_SELECTION
  selectMap1 = new Button("DUNGEON", "", 300, 470, 200, 100, grey, white, false);
  selectMap2 = new Button("FIELD", "", 800, 470, 200, 100, green, white, false);
  
  tryAgain = new Button("TRY AGAIN", "", width/2, 470, 200, 100, pink, black, false);
  
  //next - Next Wave
  next = new Button("NEXT WAVE", "", 970, 640, 220, 60, black, white, false);
  //build - To build mode, Buy Sniper, Buy Gun, Buy AoE
  buildModeButton = new Button("BUILD", "", 970, 370, 220, 60, black, white, false);
  // gun tower
  buyGunTowerButton = new Button("GUN", "$10", 878, 130, 80, 65, black, white, true);
  // sniper tower
  buySniperTowerButton = new Button("SNIPER", "$20", 880+87, 130, 80, 65, black, white, true);
  // aoe tower
  buyAoETowerButton = new Button("AoE RING", "$30", 880+87*2, 130, 80, 65, black, white, true);
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
}
