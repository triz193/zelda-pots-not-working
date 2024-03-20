PlayerWalkingWithPotState = Class{__includes = BaseState}

function PlayerWalkingWithPotState:init(player, dungeon, pot)
    self.player = player
    self.dungeon = dungeon
    self.pot = pot

    -- Set the animation for walking with the pot
    self.player:changeAnimation('pot-walk-' .. self.player.direction)
end

function PlayerWalkingWithPotState:enter()
    -- Keep the pot positioned above the player's head
    self.pot.x = self.player.x
    self.pot.y = self.player.y - self.pot.height
end

function PlayerWalkingWithPotState:update(dt)
    -- Update the player's position and animation
    self.player:update(dt)

    -- Keep the pot positioned above the player's head
    self.pot.x = self.player.x
    self.pot.y = self.player.y - self.pot.height

    -- Update the animation based on the player's direction
    self.player:changeAnimation('pot_walk' .. self.player.direction)
end

function PlayerWalkingWithPotState:render()
    -- Render the player and the pot
    self.player:render()
    self.pot:render()
end
