// obj_battle_hud Draw Event

// Only draw HUD if the battle is active
if (instance_exists(obj_battle_controller)) {
    var controller = obj_battle_controller;
    
    // Draw dialog and stats
    draw_set_color(c_white);
    draw_set_font(fnt_default); // Ensure 'fnt_default' is created

    // Display player and enemy HP
    draw_text(50, 50, "Player HP: " + string(controller.player_hp));
    draw_text(50, 70, "Enemy HP: " + string(controller.enemy_hp));

    // Display last roll and attack value
    if (global.last_roll != 0) {
        draw_text(50, 100, "Last Roll: " + string(global.last_roll));
        draw_text(50, 120, "Attack Value: " + string(global.last_attack_value));
    }
}
