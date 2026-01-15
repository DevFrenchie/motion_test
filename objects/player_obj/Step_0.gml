
var max_angle = 72;
var base_angle = 90; // 0 = north, 180 = south, 90 = east, 270 = west
var target_angle = base_angle; // Default: facing east

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    target_angle = base_angle + max_angle;
}
else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    target_angle = base_angle - max_angle;
}
else {
    // Mouse trailing: proportional rotation based on distance
    var mouse_dist = mouse_x - x;
    var sensitivity = 45; // Increase for less sensitivity
    var normalized = clamp(mouse_dist / sensitivity, -1, 1);
    target_angle = base_angle - normalized * max_angle;
}

// Calculate speed boost based on angle
var angle_diff = abs(target_angle - base_angle);
var speed_boost = max(0, floor((angle_diff - 35) / 5)) * 1.5;
var move_speed = 2 + speed_boost;
var prev_x = x; // Store previous x position

// Keyboard movement
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    x -= move_speed;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    x += move_speed;
}
if (mouse_x < x - 5) {
    x -= move_speed;
}
if (mouse_x > x + 5) {
    x += move_speed;
}

// Only rotate if x position changed
if (x != prev_x) {
    image_angle = lerp(image_angle, target_angle, 0.2) - 72;
} else {
    image_angle = lerp(image_angle, base_angle, 0.2) - 72; // Face straight when not moving
}