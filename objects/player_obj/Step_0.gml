// Smoothly move player towards mouse
speed = 0.05; // Lower = slower, Higher = faster
// Move a fraction of the distance each step
x += (mouse_x - x) * speed;
y += (mouse_y - y) * speed;
// Rotate player to face mouse
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction; // Visually rotate sprite
// Non-invasive change for git detection
