/// @description Insert description here
// You can write your code in this editor
// obj_battle_menu Draw Event

// Only draw menu if the battle is in the player's turn and menu is visible
if (instance_exists(obj_battle_controller)) {
    var controller = obj_battle_controller;
    
    if (controller.battle_state == "player_turn" && controller.show_battle_menu) {
        // Draw menu background
        draw_set_alpha(0.8);
        draw_set_color(c_black);
        draw_rectangle(300, 200, 500, 400, false);
        draw_set_alpha(1);
        
        // Set text properties
        draw_set_color(c_white);
        draw_set_font(fnt_default);
        draw_text(320, 220, "Choose an action:");
        draw_text(320, 260, "1. Attack");
        draw_text(320, 300, "2. Defend");
        draw_text(320, 340, "3. Run");
    }
}
