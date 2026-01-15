// --- SCROLL SPEED VARIABLES ---
if (!variable_global_exists("scene_scroll_speed")) global.scene_scroll_speed = 2;
if (!variable_global_exists("target_scroll_speed")) global.target_scroll_speed = 2;

// --- GET Y POSITIONS ---
var y_start = obj_start.y;
var y_end = obj_end.y;
var y_player = obj_player.y;

// Calculate percent as before
var percent = clamp((y_player - y_start) / (y_end - y_start), 0, 1) * 100;

// --- SPEED SETTINGS ---
var min_speed = 2;
var default_speed = 5;
var max_speed = 10;
var overdrive_speed = 14;

// --- SET TARGET SPEED BASED ON PERCENTAGE ---
if (percent < 50) {
    global.target_scroll_speed = lerp(min_speed, default_speed, percent / 50);
} else if (percent < 75) {
    // 50-75%: Speed up
    global.target_scroll_speed = lerp(default_speed, max_speed, (percent - 50) / 25);
} else {
    // 75-100%: Overdrive
    global.target_scroll_speed = lerp(max_speed, overdrive_speed, (percent - 75) / 25);
}

// --- SMOOTH INTERPOLATION ---
global.scene_scroll_speed = lerp(global.scene_scroll_speed, global.target_scroll_speed, 0.1);

// --- APPLY SCROLL TO SCENE (EXCLUDE PLAYER, START, END) ---
with (all) {
    if (object_index != obj_player && object_index != obj_start && object_index != obj_end) {
        y += global.scene_scroll_speed;
    }
}

// --- OPTIONAL: MOVE BACKGROUND LAYER ---
layer_vspeed("Background", global.scene_scroll_speed);