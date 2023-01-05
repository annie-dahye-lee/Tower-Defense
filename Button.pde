//This class represents a tactile button that can be clicked
//to cause something to happen.

class Button {

  //instance variables
  int x, y, w, h;  //x, y is the center
  int textSize;
  boolean clicked;
  boolean towerButton;
  color highlight, normal;
  String text;
  String price;
  String title;
  String description;
  PImage img;

  //constructor
  Button(String t, String price, int _x, int _y, int _w, int _h, color norm, color high, boolean towerButton) {
    this.towerButton = false;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    text = t;
    this.price = price;
  }

  //constructor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high, String price) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    text = t;
    this.price = price;
  }

  Button(PImage pic, int _x, int _y, int _w, int _h, color norm, color high) {
    this("", "", _x, _y, _w, _h, norm, high, false);
    img = pic;
  }

  Button(PImage pic, String price, String title, String description, int _x, int _y, int _w, int _h, color norm, color high, boolean towerButton) {
    this.towerButton = false;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    img = pic;
    this.price = price;
    this.title = title;
    this.description = description;
  }

  //Behaviour Functions
  void show() {
    drawBody();
    drawLabel();
    checkForClick();
  }

  void drawBody() {
    // TACTILE
    noStroke();
    if (this.towerButton && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      tactile();
    } else {
      fill(normal);
    }

    if (!this.towerButton && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }

    rect(x, y, w, h, 30);
  }

  void tactile() {
    fill(highlight);
    textSize(10);
    fill(black);
    textFont(dHomicide);
    text(price, 880+87, y+140);

    if (this.title != null) {
      fill(black);
      textSize(55);
      text(title, 880+87, 230);
    }

    if (this.description != null) {
      fill(black);
      textSize(30);
      text(description, 880+87, 450, 230, 500);
    }
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    textFont(dHomicide);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }

    if (textSize > 0) {
      textSize(textSize);
      text(text, w, h);
    }

    if (img == null) {
      textSize(w/6);
      text(text, x, y-8);
    } else {
      image(img, x, y, w, h);
    }
  }

  void checkForClick() {
    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked  = true;
    } else {
      clicked = false;
    }
  }
}
