// Collision Event: obj_enemy with obj_player

// Prevent multiple battles at the same time
if (!instance_exists(obj_battle_controller)) {
    // Store references to the player and enemy involved in the battle
    global.battle_player = id; // 'id' refers to obj_player
    global.battle_enemy = other; // 'other' refers to obj_enemy

    // Transition to the battle room
    room_goto(rm_battle);
}
