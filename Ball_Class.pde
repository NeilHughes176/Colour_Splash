public class Ball_Class
{
  private float x_pos; 
  private float y_pos;

  private float x_speed;
  private float y_speed;



  private float circle_diameter;

  private color fill_colour;
  private color stroke_colour;

  Ball_Class()
  {
    x_pos = 100;
    y_pos = 100;

    x_speed = 0;
    y_speed = 0;

    circle_diameter = 50.0f;

    fill_colour = color(0, 0, 0, 0);
    stroke_colour = color(0, 0, 0, 0);
  }
}
