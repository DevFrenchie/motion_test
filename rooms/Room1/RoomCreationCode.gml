// Move everything down each step
var scroll_speed = 2; // pixels per step

// Move all instances except the player up (so world scrolls down)
with (all)
{
    if (object_index != obj_player)
    {
        y += scroll_speed;
    }
}

// Move background layer down (if needed)
layer_vspeed("Background", scroll_speed);