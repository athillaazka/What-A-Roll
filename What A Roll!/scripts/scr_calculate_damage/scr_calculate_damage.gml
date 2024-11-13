/// scr_calculate_damage(attack_value)
/// @param attack_value Total attack value (dice roll + modifiers)
/// @return Calculated damage (integer)

function scr_calculate_damage(attack_value) {
    // Example damage formula: 50% of attack value
    var damage = floor(attack_value * 0.5);
    return max(1, damage); // Ensure at least 1 damage is dealt
}
