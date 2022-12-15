//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to
//the node's instructions.

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
    line(x, y, x+dx*10, y+dy*10);
  }
}
