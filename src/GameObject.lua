--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end

    -- default empty consume callback
    self.onConsume = function() end


    -- default consumable value
    self.consumable = def.consumable or false

    -- adding a default opacity for the extra heart
    self.opacity = 1
    
    -- Add a consumed flag
    self.consumed = false
    
    -- setting up the pot
    self.pickable = false
    self.throwable = false

end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    if self.states and self.states[self.state] then
        love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
            self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    else
        love.graphics.setColor(1, 1, 1, self.opacity)
        love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame],
            self.x + adjacentOffsetX, self.y + adjacentOffsetY)
        love.graphics.setColor(1, 1, 1, 1) -- reset color
   
    end
end