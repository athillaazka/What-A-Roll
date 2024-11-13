/// @description Insert description here
// You can write your code in this editor
// obj_battle_menu Step Event

// Only process input if it's the player's turn and menu is visible
if (instance_exists(obj_battle_controller)) {
    var controller = obj_battle_controller;
    
    if (controller.battle_state == "player_turn" && controller.show_battle_menu) {
        if (keyboard_check_pressed(ord('1'))) {
            // Player selects Attack
            global.player_selected_action = "Attack";
            controller.battle_state = "player_action_selected";
            controller.show_battle_menu = false;
        }
        
        if (keyboard_check_pressed(ord('2'))) {
            // Player selects Defend
            global.player_selected_action = "Defend";
            controller.battle_state = "player_action_selected";
            controller.show_battle_menu = false;
        }
        
        if (keyboard_check_pressed(ord('3'))) {
            // Player selects Run
            global.player_selected_action = "Run";
            controller.battle_state = "player_action_selected";
            controller.show_battle_menu = false;
        }
    }
}
