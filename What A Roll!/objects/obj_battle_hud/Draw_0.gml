// obj_battle_hud Draw Event

// Only draw HUD if the battle controller exists
if (instance_exists(obj_battle_controller)) {
    // Set text properties
    draw_set_color(c_white);
    draw_set_font(fnt_default); // Ensure 'fnt_default' exists

    // Display Player and Enemy HP
    draw_text(50, 50, "Player HP: " + string(obj_battle_controller.player_hp));
    draw_text(50, 70, "Enemy HP: " + string(obj_battle_controller.enemy_hp));

    // Display Last Player Roll and Attack Value
    if (global.last_roll > 0) {
        draw_text(50, 100, "Player Last Roll: " + string(global.last_roll));
        draw_text(50, 120, "Player Attack Value: " + string(global.last_attack_value));
    }

    // Display Last Enemy Attack (no roll)
    if (global.last_roll == 0 && global.last_attack_value > 0) {
        draw_text(50, 100, "Enemy Attack: " + string(global.last_attack_value));
    }
}
