// objVey Create Event

// Initialize movement variables
xspd = 0;
yspd = 0;

move_spd = 4; // Adjust as needed for your game

// Animation control variables
current_direction = "down"; // Default starting direction
sprite_index = spr_veyDown; // Set default sprite
image_index = 0; // Start at first frame
image_speed = 1; // Set initial animation speed

// Player stats
hp = 100;
attack_mod = 5;

// Interaction variables
is_near_somone = false;
dialog_active = false;
dialog_current_line = 0;
