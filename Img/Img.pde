PImage img;
float f = 100;
boolean anim = true;
boolean start = false;

void setup() {
    //size(1920,1080,P2D);
    size(1600,1200,P2D);
    //size(1200,900,P2D);
    img = loadImage("test1.jpg");
    //image(img,0,0);
}

void CirclesGrey(PImage img, int size){
    background(0);
    fill(255);
    noStroke();
    img.loadPixels(); 
    float hsize = (float)size / 2.0f;
    for (int i = 0; i < img.width/(size); i++)
    for (int j = 0; j < img.height/(size); j++){
        int bx = i*size, by = j*size;
        float str = 0;
        for (int x = 0; x < size; x++)
        for (int y = 0; y < size; y++){ 
            int xp = bx + x;
            int yp = by + y;
            int loc = xp + yp*img.width;
            color col = img.pixels[loc];
            str += red(col);
            str += green(col);
            str += blue(col);
        }
        str /= size*size;
        str /= 255 * 3;
        str *= size;
        ellipse(bx + hsize, by + hsize, str, str);
    }
}

void CirclesColour(PImage img, int size, float mul){
    background(0);
    fill(255);
    noStroke();
    img.loadPixels(); 
    float hsize = (float)size / 2.0f;
    for (int i = 0; i < img.width/(size); i++)
    for (int j = 0; j < img.height/(size); j++){
        int bx = i*size, by = j*size;
        float r = 0, g= 0, b = 0;
        for (int x = 0; x < size; x++)
        for (int y = 0; y < size; y++){ 
            int xp = bx + x;
            int yp = by + y;
            int loc = xp + yp*img.width;
            color col = img.pixels[loc];
            r += red(col);
            g += green(col);
            b += blue(col);
        }
        r /= size*size;
        g /= size*size;
        b /= size*size;
        float str = r + g + b;
        str /= 255 * 3;
        if (mul > 1)
            mul = 1;
        str *= size * mul;
        fill(r,g,b);
        circle(bx + hsize, by + hsize, str);
    }
}

void draw() {
    if (keyPressed && key == ' ')
        start = true;
    if(!start) return;
    if(anim){
        f *= 0.997f;
        f = max(1,f);
        CirclesColour(img, (int)f, 1);
    }else{
        CirclesGrey(img, 13);
    }
}
