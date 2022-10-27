class Node {
  //          direction variables
  float x, y, dx, dy;

  Node(float x, float y, float dx, float dy) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
  }
  
  // debugging function to make sure nodes are working correctly
  void show() {
    fill(0);
    circle(x, y, 30);
    stroke(0);
    line(x, y, x+dx*50, y+dy*50);
  }
}


// Collections of objects
Node[] nodes;

void makeNodes() {
  nodes = new Nodes[9];
  
  nodes[0] = new Node();
  nodes[1] = new Node();
  nodes[2] = new Node();
  nodes[3] = new Node();
  nodes[4] = new Node();
  nodes[5] = new Node();
  nodes[6] = new Node();
  nodes[7] = new Node();
  nodes[8] = new Node();
}
