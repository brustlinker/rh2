

local scheduler = require(cc.PACKAGE_NAME .. ".scheduler")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    
    self.map_=cc.TMXTiledMap:create("1.tmx")
    self:addChild(self.map_)
    
    display.addSpriteFrames("bandit.plist","bandit.png")
    self.hero_=display.newSprite("#player_idle1.png",32+16,32*5+36):addTo(self)
    self.hero_.status="idle"
    
    print(self.hero_.xstatus)
    
end




return MainScene
