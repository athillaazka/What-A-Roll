// obj_battle_controller Create Event

// Load player stats from global variables
player_hp = global.player_hp;
player_attack_mod = global.player_attack_mod;

// Load enemy stats from global variables
enemy_hp = global.enemy_hp;
enemy_attack_damage = global.enemy_attack_damage;

// Initialize battle state
battle_state = "player_turn"; // Possible states: "player_turn", "enemy_turn", "battle_end"
battle_result = "";

// Initialize last roll variables for HUD display
global.last_roll = 0;
global.last_attack_value = 0;
