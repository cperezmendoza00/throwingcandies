gato4 = Core.class(Sprite)
function gato4:init()
	self.anim={}
	j=0
	for i=0,9,1 do
		if i>5 then
			j=j+2
		end
		self.anim[i]=	Bitmap.new(Texture.new('Recursos/GatoAnimado/g4_'..i-j..'.png'))
		self.anim[i]:setAnchorPoint(0.5,0.5)
	end
	self.frame = 1
	self:addChild(self.anim[1])
	self.nframes = #self.anim
	self.subframe = 0
end

function gato4:onEnterFrame()
	self.subframe = self.subframe + 1
	if self.subframe > 1 then
		self:removeChild(self.anim[self.frame])
		self.frame = self.frame + 1
		if self.frame > self.nframes then
			self.frame = 0
		end
		self:addChild(self.anim[self.frame])
		self.subframe = 0
	end
end
function gato4:agregarUpdate()
self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function gato4:removerUpdate()
self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end
