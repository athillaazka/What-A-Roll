// objVey Step Event

// Check keyboard inputs
right_key = keyboard_check(vk_right);
up_key = keyboard_check(vk_up);
left_key = keyboard_check(vk_left);
down_key = keyboard_check(vk_down);

// Calculate speed based on input
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

// Update position
x += xspd;
y += yspd;

// Determine movement direction and set sprite
if (xspd > 0) {
    if (current_direction != "right") {
        current_direction = "right";
        sprite_index = spr_veyRight;
        image_index = 0;
    }
} else if (xspd < 0) {
    if (current_direction != "left") {
        current_direction = "left";
        sprite_index = spr_veyLeft;
        image_index = 0;
    }
}

if (yspd > 0) {
    if (current_direction != "down") {
        current_direction = "down";
        sprite_index = spr_veyDown;
        image_index = 0;
    }
} else if (yspd < 0) {
    if (current_direction != "up") {
        current_direction = "up";
        sprite_index = spr_veyUp;
        image_index = 0;
    }
}

// Handle idle state
if (xspd == 0 && yspd == 0) {
    // Stop animation
    image_speed = 0;
    image_index = 0; // Set to first frame (idle pose)
} else {
    // Resume animation
    image_speed = 1; // Adjust animation speed as desired
}

// Check if player is colliding with obj_enemy
if (place_meeting(x, y, obj_enemy)) {
    is_near_enemy = true;
}
else {
    is_near_enemy = false;
}
