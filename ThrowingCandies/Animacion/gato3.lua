
gato3 = Core.class(Sprite)

function gato3:init()
	self.anim={}
	
	j=0
	for i=0,9,1 do

	self.anim[i]=	Bitmap.new(Texture.new('Recursos/GatoAnimado/g3_'..i..'.png'))
	self.anim[i]:setAnchorPoint(0.5,0.5)

	end
	
	

	self.frame = 1
	self:addChild(self.anim[1])

	self.nframes = #self.anim

	self.subframe = 0
	
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function gato3:onEnterFrame()
	self.subframe = self.subframe + 1
	if self.subframe > 8 then
		self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	else
	self:removeChild(self.anim[self.frame])
	self.frame = self.frame + 1
	if self.frame > self.nframes then
		self.frame = 1
	end
		self:addChild(self.anim[self.frame])
	end
end

