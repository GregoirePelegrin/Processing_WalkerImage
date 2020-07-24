PImage photo;
int[] mask;

ArrayList<Walker> artists;
float rand;
float timeStep;
int imageWidth;
int imageHeight;
int nbrArtists;

void setup() {
  frameRate(30);
  fullScreen(P3D);

  background(0);
  noFill();
  
  photo = loadImage("Image.jpg");
  mask = new color[photo.width*photo.height];
  for(int i=0; i<photo.width*photo.height; i++){
    mask[i] = 0;
  }

  artists = new ArrayList<Walker>();
  rand = 1;
  timeStep = 0.01;

  nbrArtists = 500;
  for (int i=0; i<nbrArtists; i++) {
    float initSpeedX = random(-0.5, 0.5);
    float initSpeedY = random(-0.5, 0.5);
    Walker artist = new Walker(initSpeedX, initSpeedY);
    artists.add(artist);
  }
  translate(width/2-photo.width, (height-photo.height)/2);
  image(photo, 0, 0);
}

void draw() {
  translate(width/2-photo.width, (height-photo.height)/2);

  for (Walker artist : artists) {
    artist.update();
    artist.display();
  }
}
