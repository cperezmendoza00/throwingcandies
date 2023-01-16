
gato2 = Core.class(Sprite)

function gato2:init()
	self.anim={}
	
	for i=0,7,1 do
		self.anim[i]=	Bitmap.new(Texture.new('Recursos/GatoAnimado/g2_'..i..'.png'))
		self.anim[i]:setAnchorPoint(0.5,0.5)
	end
	self.frame = 0
	self:addChild(self.anim[0])
	self.nframes = #self.anim
end

function gato2:onEnterFrame()
	self:removeChild(self.anim[self.frame])
	self.frame=self.frame+1
	if self.frame > self.nframes then
		self.frame=7
	end
	self:addChild(self.anim[self.frame])
	
	if self.frame >= self.nframes then
		self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	end

end

function gato2:agregarUpdate()
self.frame = 0
self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function gato2:reiniciar()
	self:removeChild(self.anim[7])
	self:addChild(self.anim[0])

end