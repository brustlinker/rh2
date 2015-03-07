
--
local scheduler = require(cc.PACKAGE_NAME .. ".scheduler")


local HeroMoveDown = class()

function HeroMoveDown:ctor(hero,map,hudLayer)
	self.map_=map
	self.hero_=hero
	self.hudLayer_=hudLayer
	
	
	--testPosToCoordinate(self.map_)
	
	scheduler.scheduleUpdateGlobal(function()  
		--self:heroMoveDown()
		self:down()
    end )
    
 
     
end


function HeroMoveDown:down(dt)
	local heroSize=self.hero_:getSpriteFrame():getRect()
	local aabb=self.hero_:getBoundingBox()
	
	--left is ground
	local leftFoot=cc.p(aabb.x,aabb.y)
    local leftFootNextPos=cc.p(aabb.x,aabb.y-GRAVITY)
	local leftResult=self:tileIsGround(leftFootNextPos)
	
	--right is ground
	local rightFoot=cc.p(aabb.x+heroSize.width,aabb.y)
    local rightFootNextPos=cc.p(aabb.x+heroSize.width,aabb.y-GRAVITY)
	local rightResult=self:tileIsGround(rightFootNextPos)
	
	if leftResult~="ground" and rightResult~="ground" then
		local nowx,nowy=self.hero_:getPosition()
		self.hero_:setPositionY(nowy-GRAVITY)
	end
	
end

function HeroMoveDown:tileIsGround(pos)

    
    local zheng,yu=math.modf(pos.y/32)
    if(yu~=0) then
    
        return "no"
    end
    
    
	local mapLayer=self.map_:getLayer("map")
	local i,j=posToCoordinate(pos,self.map_)
	local gid=mapLayer:getTileGIDAt({x=i,y=j})
	if gid==1 or gid==2 or gid==3
		or gid==24
		or gid==25 or gid==26 or gid==27 then
		
		
		return "ground"

    else
		return "not ground"
    end
end


function posToCoordinate(pos,map)

    local x,x0=math.modf(pos.x/TILE_WIDTH)
    local mapHeight=map:getMapSize().height*TILE_HEIGHT
    local y=(mapHeight-pos.y)/TILE_HEIGHT
    local y,y0=math.modf((mapHeight-pos.y)/TILE_HEIGHT)


    return x,y
end


return HeroMoveDown













