PlayerLiftingPotState = Class{__includes = BaseState}

function PlayerLiftingPotState:init(player, pot, dungeon)
    self.player = player
    self.pot = pot
    self.dungeon = dungeon


    -- Set the animation for lifting the pot
    self.player:changeAnimation('pot-lift-' .. self.player.direction)
end


function PlayerLiftingPotState:enter()
    self.pot.x = self.player.x
    self.pot.y = self.player.y - self.pot.height  -- Set a default height if 'pot.height' is nil
end

function PlayerLiftingPotState:update(dt)
    if self.player.currentAnimation.timesPlayed > 0 then
        -- Reset the flag before changing state
        self.player.canLiftPot = false

        -- Transition to walking with the pot state once the lifting animation is complete
       self.player:changeState('walking-with-pot', {pot = self.pot})
        
    end
end

function PlayerLiftingPotState:render()
    -- Render the player and the pot
    self.player:render()
    self.pot:render()
end
