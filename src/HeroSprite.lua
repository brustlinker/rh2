
--[[
local HeroSprite = class("HeroSprite", function()

    return display.newSprite("#player_idle1.png")
end)
]]

local HeroSprite = class("HeroSprite", function()
    
    return display.newSprite("#player_idle1.png")
end)


function HeroSprite:ctor()
   local x=self:getPositionX()
   local y=self:getPositionY()
   print(x)
   print(y)
end

function HeroSprite.create()
    local hero = HeroSprite.new()
    hero:init() 
    return hero
end


-- 回调函数
function HeroSprite:init()
    print("****")
    local  x,y=self:getPosition()
    
    print(x)
    print(y)
    
    cc.Sprite.setSpriteFrame(self,cc.SpriteFrame)
    
    return true
end

return HeroSprite
