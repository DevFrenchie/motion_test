// --- CONFIGURABLES ---
var max_angle = 72;
var base_angle = 90; // 0 = north, 180 = south, 90 = east, 270 = west
var sensitivity = 45; // Mouse sensitivity for rotation
var min_boost_angle = 35; // Angle after which speed boost starts
var boost_step = 5;       // Degrees per speed boost increment
var boost_amount = 1.5;   // Speed boost per increment
var base_speed_x = 2;     // Base speed for x axis
var base_speed_y = 2;     // Base speed for y axis

// --- ROTATION TARGET ---
var target_angle = base_angle;

// Keyboard overrides for rotation
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    target_angle = base_angle + max_angle;
} else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    target_angle = base_angle - max_angle;
} else {
    // Mouse trailing: proportional rotation based on distance
    var mouse_dist = mouse_x - x;
    var normalized = clamp(mouse_dist / sensitivity, -1, 1);
    target_angle = base_angle - normalized * max_angle;
}

// --- SPEED BOOST (X AXIS ONLY) ---
var angle_diff = abs(target_angle - base_angle);
var speed_boost = max(0, floor((angle_diff - min_boost_angle) / boost_step)) * boost_amount;
var move_speed_x = base_speed_x + speed_boost;
var move_speed_y = base_speed_y;

// --- MOVEMENT ---
var prev_x = x;
var prev_y = y;

// Horizontal movement (keyboard)
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    x -= move_speed_x;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    x += move_speed_x;
}

// Vertical movement (keyboard)
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    y -= move_speed_y;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    y += move_speed_y;
}

// Mouse movement (horizontal)
if (mouse_x < x - 5) {
    x -= move_speed_x;
}
if (mouse_x > x + 5) {
    x += move_speed_x;
}

// Mouse movement (vertical)
if (mouse_y < y - 5) {
    y -= move_speed_y;
}
if (mouse_y > y + 5) {
    y += move_speed_y;
}

// --- ROTATION APPLICATION ---
// Only rotate if x position changed (no deadzone rotation)
if (x != prev_x) {
    image_angle = lerp(image_angle, target_angle, 0.2) - 90; // -90 if sprite faces up
} else {
    image_angle = lerp(image_angle, base_angle, 0.2) - 90;
}
