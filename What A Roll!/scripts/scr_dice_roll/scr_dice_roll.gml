/// scr_dice_roll(sides)
/// @param sides Number of sides on the dice (e.g., 6, 20)
/// @return Result of the dice roll (integer)

function scr_dice_roll(sides) {
    return irandom_range(1, sides);
}
