Player player = new Player(300, 300);
char[][] map = new char[30][15];
int[] map_info;

void setup() {
  // each tile is 40x40 pixel
  // 30 by 15 board
  //75 pixels top and bottom for HUD
  size(1200, 750);
  getLevel(1);
}

void draw() {
  background(60, 90, 120);
  drawMap();
  player.display();
  player.move();
}  

void drawMag(int tile_x, int tile_y, int magnitude, boolean is_X) {
  int[][] spacings = {{20, 20}, {11, 11, 29, 29}, {9, 9, 20, 20, 31, 31}, {11, 11, 11, 29, 29, 11, 29, 29}, 
    {9, 9, 20, 20, 31, 31, 9, 31, 31, 9}, {11, 9, 11, 20, 11, 31, 29, 9, 29, 20, 29, 31}, 
    {9, 9, 9, 20, 9, 31, 20, 20, 31, 9, 31, 20, 31, 31}, 
    {9, 9, 9, 20, 9, 31, 31, 9, 31, 20, 31, 31, 20, 9, 20, 31}, 
    {9, 9, 9, 20, 9, 31, 31, 9, 31, 20, 31, 31, 20, 9, 20, 31, 20, 20}};
  fill(228, 225, 169);
  stroke(228, 225, 169);
  rect(tile_x*40, tile_y*40+75, 40, 40); 
  for (int k=0; k<magnitude; k++) {
    int x_center = tile_x*40 + spacings[magnitude-1][k*2];
    int y_center = (tile_y*40+75)+ spacings[magnitude-1][k*2+1];
    strokeWeight(2);
    if (is_X) {
      stroke(255, 0, 0);
      line(x_center-3, y_center-3, x_center+3, y_center+3);
      line(x_center-3, y_center+3, x_center+3, y_center-3);
    }
    else {
      stroke(34,139,34);
      strokeWeight(1);
      circle(x_center,y_center,8);
      strokeWeight(3);
      line(x_center,y_center,x_center,y_center);
    }
  }
}

void drawMap() {
  for (int i=0; i<15; i++) {
    for (int j=0; j<30; j++) {
      strokeWeight(1);
      //Draw floor
      if (map[j][i] == ' ') {
        stroke(228, 225, 169);
        fill(228, 225, 169);
        rect(j*40, i*40+75, 40, 40);
      }
      //Draw Walls
      else if (map[j][i] == 'X') {
        stroke(128, 128, 128);
        fill(128, 128, 128);
        rect(j*40, i*40+75, 40, 40);
      }
      //Draw pits
      else if (map[j][i] == 'O') {
        stroke(0, 0, 0);
        fill(0, 0, 0);
        rect(j*40, i*40+75, 40, 40);
      }
      //Draw magnetic fields
      else {
        int field_val = (int)map[j][i];
        // Point into the screen
        if (field_val > 96 && field_val < 106) {
          field_val -= 96;
          drawMag(j, i, field_val, true);
        }
        else{
          field_val -= 48;
          drawMag(j, i, field_val, false);
        }
      }
    }
  }
}

void getLevel(int level) {
  //Lines 0-14 are map, each 40 characters long
  //Line 15 is time interval, one number
  //Line 16 is change, an array of numbers to add or multiply
  String[] lines = loadStrings("map" + str(level) + ".txt");
  for (int i=0; i<15; i++) {
    for (int j=0; j<30; j++) {
      map[j][i] = lines[i].charAt(j);
    }
  }
  int time_interval = Integer.parseInt(lines[15].split("\n", 0)[0]);
  int change = Integer.parseInt(lines[16].split("\n", 0)[0]);
  //println(time_interval);
  //println(change);
  //println(print2DArr(map));
}

String print2DArr (char[][] arr) {
  String output = "";
  for (int i=0; i<arr[0].length; i++) {
    output += "[";
    for (int j=0; j<arr.length; j++) {
      output += arr[j][i];
      if (j != arr.length-1) {
        output += ",";
      }
    }
    if (i != arr[0].length-1) {
      output += "]\n";
    }
  }
  return output + "]";
}

void keyPressed() {
  player.controlMovement(keyCode, 1);
}

void keyReleased() {
  player.controlMovement(keyCode, 0);
}
