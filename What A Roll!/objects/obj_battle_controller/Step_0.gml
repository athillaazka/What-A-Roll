// obj_battle_controller Step Event

switch (battle_state) {
    case "player_turn":
        // Wait for player input to attack (press Space)
        if (keyboard_check_pressed(vk_space)) {
            // Player chooses to attack
            var player_dice = 20; // d20
            var player_roll = scr_dice_roll(player_dice);
            var total_attack = player_roll + player_attack_mod;

            // Store the roll result for HUD display
            global.last_roll = player_roll;
            global.last_attack_value = total_attack;

            // Calculate damage
            var damage = scr_calculate_damage(total_attack);

            // Check for critical hit or miss and adjust damage accordingly
            if (player_roll == player_dice) {
                damage *= 2; // Critical hit: double damage
                show_message("Critical Hit! You rolled a " + string(player_roll) + " and dealt " + string(damage) + " damage.");
            } else if (player_roll == 1) {
                damage = 0; // Critical miss: no damage
                show_message("Critical Miss! You rolled a " + string(player_roll) + " and dealt no damage.");
            } else {
                show_message("You rolled a " + string(player_roll) + "! You dealt " + string(damage) + " damage.");
            }

            // Apply damage to enemy
            enemy_hp -= damage;

            // Check if enemy is defeated
            if (enemy_hp <= 0) {
                battle_state = "battle_end";
                battle_result = "victory";
            } else {
                battle_state = "enemy_turn";
            }
        }
        break;

    case "enemy_turn":
        // Enemy's turn to attack with fixed damage
        var damage = enemy_attack_damage; // Fixed damage from enemy object

        // Store the damage for HUD display
        global.last_roll = 0; // No roll for enemy
        global.last_attack_value = damage;

        // Display attack message
        show_message("Enemy attacks and deals " + string(damage) + " damage to you.");

        // Apply damage to player
        player_hp -= damage;

        // Check if player is defeated
        if (player_hp <= 0) {
            battle_state = "battle_end";
            battle_result = "defeat";
        } else {
            battle_state = "player_turn";
        }
        break;

    case "battle_end":
        // Update player's HP in the player object
        with (objVey) { // Direct reference to player object
            hp = player_hp;
        }

        // Display battle result
        if (battle_result == "victory") {
            show_message("You defeated the enemy!");
            // No need to destroy the enemy instance, as it was handled during battle initiation
        } else if (battle_result == "defeat") {
            show_message("You were defeated!");
            // Handle player defeat (e.g., restart game or go to game over screen)
            // Example: Restart the game
            game_restart();
        }

        // Return to the previous room (game room)
        room_goto_previous();

        break;
}
