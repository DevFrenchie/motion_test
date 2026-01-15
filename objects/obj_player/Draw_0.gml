// Draw the player sprite as usual
draw_self();

// Prepare debug info
var scroll_speed = string(global.scene_scroll_speed);
var dist_start = string(distance_to_object(obj_start));
var dist_end = string(distance_to_object(obj_end));

// Set navy blue color
draw_set_color(make_color_rgb(0, 0, 128));
draw_set_font(-1); // Use default font, or set your own

// Draw debug text to the right of the player
var debug_x = x + 32;
var debug_y = y - 32;
draw_text(debug_x, debug_y, "Scroll: " + scroll_speed);
draw_text(debug_x, debug_y + 16, "Start: " + dist_start);
draw_text(debug_x, debug_y + 32, "End: " + dist_end);

// Reset color (optional)
draw_set_color(c_white);