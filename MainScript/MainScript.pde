PImage photo;

PVector[][] colors;

ArrayList<Walker> artists;
float rand;
float timeStep;
int imageWidth;
int imageHeight;
int nbrArtists;

void setup() {
  frameRate(60);
  fullScreen(P3D);

  background(0);
  noFill();
  
  photo = loadImage("Image.jpg");
  translate(width/2-photo.width, (height-photo.height)/2);
  image(photo, 0, 0);
  
  colors = new PVector[photo.width][photo.height];
  for(int Y=0; Y<photo.height; Y++){
    for(int X=0; X<photo.width; X++){
      colors[X][Y].x = red(get(int((width-photo.width)/2)+X, int((height-photo.height)/2)+Y));    //NullPointerException ??
      colors[X][Y].y = green(get(int((width-photo.width)/2)+X, int((height-photo.height)/2)+Y));
      colors[X][Y].z = blue(get(int((width-photo.width)/2)+X, int((height-photo.height)/2)+Y));
    }
  }

  artists = new ArrayList<Walker>();
  rand = 1;
  timeStep = 0.01;

  nbrArtists = 100;
  for (int i=0; i<nbrArtists; i++) {
    float initSpeedX = random(-0.5, 0.5);
    float initSpeedY = random(-0.5, 0.5);
    Walker artist = new Walker(initSpeedX, initSpeedY);
    artists.add(artist);
  }
}

void draw() {
  translate(width/2-photo.width, (height-photo.height)/2);

  for (Walker artist : artists) {
    artist.update();
    artist.display();
  }
}
