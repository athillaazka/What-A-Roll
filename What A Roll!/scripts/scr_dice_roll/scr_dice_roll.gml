/// scr_dice_roll(sides)
/// @param sides The number of sides on the dice (e.g., 6 for d6, 20 for d20)
/// @return The result of the dice roll (integer between 1 and sides)

function scr_dice_roll(sides) {
    return irandom_range(1, sides);
}
