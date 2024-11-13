// obj_battle_controller Create Event

// Load player and enemy instances from global variables
player = global.player_instance;
enemy = global.enemy_instance;

// Initialize battle state
battle_state = "player_turn"; // Possible states: "player_turn", "enemy_turn", "battle_end"
battle_result = "";

// Player stats
player_hp = global.player_hp;
player_attack_mod = global.player_attack_mod;

// Enemy stats
enemy_hp = global.enemy_hp;
enemy_attack_mod = global.enemy_attack_mod;

// Initialize last roll variables for HUD display
global.last_roll = 0;
global.last_attack_value = 0;
