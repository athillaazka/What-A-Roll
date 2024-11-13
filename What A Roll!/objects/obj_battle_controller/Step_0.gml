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

            // Check for critical hit or miss
            if (player_roll == player_dice) {
                damage *= 2; // Critical hit: double damage
                show_message("Critical Hit! You dealt " + string(damage) + " damage.");
            } else if (player_roll == 1) {
                damage = 0; // Critical miss: no damage
                show_message("Critical Miss! You dealt no damage.");
            } else {
                show_message("You dealt " + string(damage) + " damage.");
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
        // Enemy's turn to attack
        var enemy_dice = 20; // d20
        var enemy_roll = scr_dice_roll(enemy_dice);
        var total_attack = enemy_roll + enemy_attack_mod;

        // Store the roll result for HUD display
        global.last_roll = enemy_roll;
        global.last_attack_value = total_attack;

        // Calculate damage
        var damage = scr_calculate_damage(total_attack);

        // Check for critical hit or miss
        if (enemy_roll == enemy_dice) {
            damage *= 2; // Critical hit: double damage
            show_message("Enemy Critical Hit! You took " + string(damage) + " damage.");
        } else if (enemy_roll == 1) {
            damage = 0; // Critical miss: no damage
            show_message("Enemy Critical Miss! You took no damage.");
        } else {
            show_message("Enemy dealt " + string(damage) + " damage to you.");
        }

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
        with (player) {
            hp = obj_battle_controller.player_hp;
        }

        // Display battle result
        if (battle_result == "victory") {
            show_message("You defeated the enemy!");
            // Destroy the enemy instance in the game room
            with (enemy) {
                instance_destroy();
            }
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
