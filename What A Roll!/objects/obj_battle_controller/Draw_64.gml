/// @description Insert description here
// You can write your code in this editor
// Display HP and other info
draw_text(20, 20, player.name + " HP: " + string(player.hp));
draw_text(20, 50, enemy.name + " HP: " + string(enemy.hp));

// Display action menu if it's the player's turn
if (battle_state == "player_turn" && !action_selected) {
    draw_text(20, 100, "Press 'A' to Attack");
    draw_text(20, 130, "Press 'B' for Bonus Attack");
    // Check for input
    if (keyboard_check_pressed(ord('A'))) {
        selected_action = "Attack";
        action_selected = true;
    }
    if (keyboard_check_pressed(ord('B'))) {
        selected_action = "Bonus Attack";
        action_selected = true;
    }
}
