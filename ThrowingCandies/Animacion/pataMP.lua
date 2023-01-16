
pataMP = Core.class(Sprite)

function pataMP:init()
	self.anim={}
	j=0
	for i=0,15,1 do
	if i>8 then
	j=j+2
	end
	self.anim[i]=	Bitmap.new(Texture.new('Recursos/GatoAnimado/pata_1_'..i-j..'.png'))
	self.anim[i]:setAnchorPoint(0.5,0.5)
	end
	self.frame = 1
	self:addChild(self.anim[1])
	self.nframes = #self.anim
	self.subframe = 0
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function pataMP:onEnterFrame()
	self.subframe = self.subframe + 1
	if self.subframe > 4 then
		self:removeChild(self.anim[self.frame])
		self.frame = self.frame + 1
		if self.frame > self.nframes then
			self.frame = 1
		end

		self:addChild(self.anim[self.frame])
		
		self.subframe = 0
	end
end
function pataMP:agregarUpdate()
self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function pataMP:removerUpdate()
self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end
