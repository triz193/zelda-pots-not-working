--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    -- creating the extra heart object
    ['extra_heart'] = {
        texture = 'extra_heart',
        frame = 5,
        width = 16,
        height = 16,
        collidable = false,
        consumable = true,
        solid = false,
        opacity = 1
    },

    ['pot'] = {
        texture = 'tiles',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        collidable = true,
        pickable = true,
        throwable = false,

        states = {
            ['not_picked'] = {
                frame = 14
            },
            ['picked'] = {
                frame = 33
            }, 
            ['thrown'] = {
                frame = 52
            }
        }
    }
}