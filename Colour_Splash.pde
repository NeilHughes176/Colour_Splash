

// set up ball class
// setup random colours
// setup random x and y speeds
// make balls on click

private float horizontal_friction;
private float bounce_elasticity;

private int background_color;
private boolean draw_circles;
private float start_speed;

private float y_acc;  // gravity value

private float ball_size;
private int num_balls;
Ball_Class[] balls;

private int num_colours;
color[] colours;

void setup()
{
  size(1600, 800);
  initValues();

  balls = new Ball_Class[num_balls];
  for (int i = 0; i < num_balls; i++)
  {
    balls[i] = new Ball_Class();
    balls[i].x_pos = random(width);
    balls[i].y_pos = random(height);
    balls[i].circle_diameter = random(ball_size);
    balls[i].fill_colour = randColor();
    balls[i].stroke_colour = randColor();
  }

  colours = new color[num_colours];
  generateColourArray();
}

void draw()
{
  if (draw_circles)
  {
    // background(background_color);
    for (int i =0; i < num_balls; i++)
    {
      fill(balls[i].fill_colour);
      stroke(balls[i].stroke_colour);
      ellipse(balls[i].x_pos, balls[i].y_pos, balls[i].circle_diameter, balls[i].circle_diameter);
      updatePhysics(balls[i]);
    }
  }
}
void mousePressed()
{
  generateShapes();
}

void mouseDragged()
{
  generateShapes();
}

void initValues()
{

  horizontal_friction = 0.7f;
  bounce_elasticity = 0.7f;

  background_color = 255;
  draw_circles = false;
  start_speed = 50.0f;

  y_acc = 2f;

  ball_size = 100.0f;
  num_balls = 30;

  num_colours = 100;
}

void generateColourArray()
{
  for (int j =0; j < num_colours; j++)
  {
    colours[j] = randColor();
  }
}

void generateShapes()
{

  generateColourArray();

  for (int i = 0; i < num_balls; i++)
  {
    balls[i].x_pos = mouseX;
    balls[i].y_pos = mouseY;
    balls[i].x_speed = random(-start_speed, start_speed);
    balls[i].y_speed = random(-start_speed, start_speed);
    balls[i].circle_diameter = random(ball_size);
    // redo colors



    int random_colour_index = (int)random(num_colours);
    balls[i].fill_colour = colours[random_colour_index];
    random_colour_index = (int)random(num_colours);
    balls[i].stroke_colour = colours[random_colour_index];

    draw_circles = true;
  }
}

color randColor()
{
  return color(random(255), random(255), random(255), 255);
}



void updatePhysics(Ball_Class ball)
{
  // bounce off walls
  //ball.x_speed = wallBounceX(ball.x_speed, ball.x_pos);

  // update positions using speed
  ball.x_pos += ball.x_speed;
  ball.y_pos += ball.y_speed;

  if (ball.y_pos > height - ball.circle_diameter/2)
  {
    ball.y_pos = height - ball.circle_diameter/2;
    ball.y_speed *= -bounce_elasticity; // -1.0f * ball.y_speed * bounce_elasticity;
    ball.x_speed *= horizontal_friction;
  }
  if (ball.x_pos > width - ball.circle_diameter/2 || ball.x_pos < 0 + ball.circle_diameter/2)
  {
    if (ball.x_pos > width - ball.circle_diameter/2)
      ball.x_pos = width - ball.circle_diameter/2;

    if (ball.x_pos < 0 + ball.circle_diameter/2)
      ball.x_pos = 0 + ball.circle_diameter/2;

    ball.x_speed *= -1.0f;
  }

  // update speeds
  ball.y_speed = accelerateY(ball.y_speed, y_acc);
}

float accelerateY(float current_speed, float acc)
{
  // add acceleration to speed
  return current_speed + acc;
}
