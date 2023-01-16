Juego = Core.class(Sprite)
--//----------------------------------------------------------------// COMER
function comer(bodyA,bodyB)
	x1,y1=caramelo:getPosition()
	x2,y2=meta[1]:getPosition()
	caramelo:setVisible(false)
	caramelo.body:setGravityScale(0);
	bodyA:setAngularVelocity(0,0)
	bodyA:setLinearVelocity(0,0)
	local BDHasta = dataSaver.loadValue("BDHasta")
	local imgComer
	if BDHasta<=9 then
		imgComer=1 
	end
	if BDHasta>9 and BDHasta<=18 then
		imgComer=2 
	end
	if BDHasta>18 then
		imgComer=3 
	end
	
local CarameloComer
	showBanner()
	CarameloComer = Bitmap.new(Texture.new("Recursos/Juego/p_"..imgComer..".png"))
	CarameloComer:setAnchorPoint(0.5,0.5)
	CarameloComer:setPosition(x,y)
	_self:addChild(CarameloComer)
	
	mc = MovieClip.new
		{{1, 15, CarameloComer, {scale = {1,0, "easeIn"}}}}
		mc = MovieClip.new
		{{1, 15, CarameloComer, {x = {x1, x2, "easeOut"}}},
		{1, 15, CarameloComer, {y = {y1, y2, "easeOut"}}}}
		mc:addEventListener(Event.COMPLETE, function()
		end, mc)
	mc:addEventListener(Event.COMPLETE, function()
		cerrar()
		CarameloComer:removeFromParent()
	end, mc)
	
	local contadorEstrellas = dataSaver.loadValue("agarradas_en_nivel_"..stage.hasta)
	if contadorEstrellas<estrellasAgarradas then 
		dataSaver.saveValue("agarradas_en_nivel_"..stage.hasta, estrellasAgarradas)
	end

	stage.win=1

	pause=true 
	layerNegraWin= Shape.new()
	layerNegraWin:setFillStyle(Shape.SOLID, 0x000000, 1)
	layerNegraWin:beginPath()
	layerNegraWin:moveTo(0,0)
	layerNegraWin:lineTo(960, 0)
	layerNegraWin:lineTo(960, 640)
	layerNegraWin:lineTo(0, 640)
	layerNegraWin:lineTo(0, 0)
	layerNegraWin:endPath()
	layerNegraWin:setPosition(0, 0)
	_self:addChild(layerNegraWin)

	local nombreLike ="like"
	local mcA_win={}
	local mcS_win={}
	local mcR_win={}
	if estrellasAgarradas==0 then nombreLike="dislike" end

	like = Bitmap.new(Texture.new('Recursos/Juego/'..nombreLike..'.png'))
	like:setAnchorPoint(0.5,0.5)
	like:setPosition(640,480)
	_self:addChild(like)

	local estrellas_win={}
	local x_estrellas_win={}
	x=0
	local mensaje=""
	if estrellasAgarradas==0 then x_estrellas_win[1]=480 mensaje="youcando" end
	if estrellasAgarradas==1 then x_estrellas_win[1]=480 mensaje="notbad" end
	if estrellasAgarradas==2 then x_estrellas_win[1]=480-45 x_estrellas_win[2]=480+45 mensaje="godjob" end
	if estrellasAgarradas==3 then x_estrellas_win[1]=480-85 x_estrellas_win[2]=480  x_estrellas_win[3]=480+85 mensaje="excellent"end
	
	for i=1,estrellasAgarradas,1 do
	    estrellas_win[i]=Bitmap.new(Texture.new('Recursos/Juego/estrella_01.png'))
		estrellas_win[i]:setAnchorPoint(0.5,0.5)
		estrellas_win[i]:setPosition(x_estrellas_win[i]+x,280)
		_self:addChild(estrellas_win[i])
		mcA_win[i] = MovieClip.new
		{{1, 30+i*10, estrellas_win[i], {alpha = {0,1,"outSine" }}}}
		mcS_win[i] = MovieClip.new
		{{1, 30+i*10, estrellas_win[i], {scale = {0,1,"outSine" }}}}
		mcR_win[i] = MovieClip.new
		{{1, 30+i*10, estrellas_win[i], {rotation = {-80,0,"outSine" }}}}
	end
	local mensajeImagen=Bitmap.new(Texture.new('Recursos/BotonesTexto/'..mensaje..'_'..dataSaver.loadValue("idioma")..'.png'))
	mensajeImagen:setPosition(480,135)
	mensajeImagen:setAnchorPoint(0.5,0.5)
	_self:addChild(mensajeImagen)

	img1BotonesPause={}
	img2BotonesPause={}
	botonesPause={}
	mcA2_win={}
	mcX2_win={}

		mcS_win[4] = MovieClip.new
		{{1, 30, mensajeImagen, {scale = {0,1,"outSine" }}}}
		for i=1,3,1 do
			if i==1 then y=-105  str_boton="next_"..dataSaver.loadValue("idioma")  end
			if i==2 then y=0 str_boton="reload_"..dataSaver.loadValue("idioma")  end
			if i==3 then y=105 str_boton="mainmenu_"..dataSaver.loadValue("idioma")  end
			img1BotonesPause[i] = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
			img2BotonesPause[i]  = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
			img2BotonesPause[i] :setScale(1.06,1.06)
			img1BotonesPause[i] :setAnchorPoint(0.5,0.5)
			img2BotonesPause[i] :setAnchorPoint(0.5,0.5)
			botonesPause[i]  = Button.new(img1BotonesPause[i], img2BotonesPause[i])
			_self:addChild(botonesPause[i])
				
			botonesPause[i]:setPosition(320	,480+y)
	
			mcA2_win[i] = MovieClip.new
			{{1, 30, botonesPause[i], {alpha = {0,1,"outSine" }}}}
			mcX2_win[i] = MovieClip.new
			{{1, 30+i*10, botonesPause[i], {x = {200,320,"outSine" }}}}
			
			botonesPause[i]:addEventListener("click",
			function() 
			if dataSaver.loadValue("efectos")==1 then
			_self.sonido:play()	
			end
			local BDDesde = dataSaver.loadValue("BDDesde")	
			
				for k=1,3,1 do
					botonesPause[k]:removeFromParent()
					botonesPause[k]=nil
					img1BotonesPause[k]=nil
					img2BotonesPause[k]=nil
				end
				for k=1,estrellasAgarradas,1 do
					 estrellas_win[k]:removeFromParent()
					estrellas_win[k]=nil
				end
				like:removeFromParent()
				mensajeImagen:removeFromParent()
				--layerNegraWin:removeFromParent()
				local mcLNW = MovieClip.new
				{{1, 10, layerNegraWin, {alpha = {0.75,0,"outSine" }}}}
				mcLNW:addEventListener(Event.COMPLETE, function()
				layerNegraWin:removeFromParent()
				end, mcLNW)
										
				
				if i==1 then
					local BDHasta = dataSaver.loadValue("BDHasta")
					local proxNivel=BDHasta+1
					--reload_win(i,_self,BDDesde,BDHasta+1)

					if (proxNivel==10 and _self.TotalAgarradas<22)or(proxNivel==19 and _self.TotalAgarradas<45) then
						if  MusicaJuegoChanel:isPlaying()==true   then
									MusicaJuegoChanel:setPaused(true)
						end
						_self.error:play()
						reload_win(i,_self,BDDesde,"MenuNiveles")
					else
					if proxNivel==28 then
						proxNivel="Creditos"
					end
					reload_win(i,_self,BDDesde,proxNivel)
					end
				end
				
				
				if i==2 then
				local BDHasta = dataSaver.loadValue("BDHasta")
				reload_win(i,_self,"MenuNiveles",BDHasta)
				end
				if i==3 then
				if  MusicaJuegoChanel:isPlaying()==true   then
					MusicaJuegoChanel:setPaused(true)
				end
				
				reload_win(i,_self,BDDesde,"MenuNiveles")
				end
			end ) 
		end
	mcPause = MovieClip.new
	{{1, 15, layerNegraWin, {alpha = {0,0.75,"outSine" }}}}
			
	
	
	
	
	
	
	
	
end
--//----------------------------------------------------------------//
function cerrar()
	meta[1]:removerUpdate()
	GatoAbriendoBoca:setVisible(false)
	GatoComiendo:setVisible(true)
	local x
	local y
	GatoComiendo:agregarUpdate()
	x,y=meta[1]:getPosition()
	GatoComiendo:setPosition(x,y)

end
--//----------------------------------------------------------------//
function estrellaAgarrada()

	if estrellasAgarradas < 3 then
					if dataSaver.loadValue("efectos")==1 then
		sonidoEstrella:play()	
		end
		estrellasAgarradas=estrellasAgarradas+1

		for i=1,estrellasAgarradas,1 do
			estrella2[i]:setTexture(Texture.new("Recursos/Juego/estrella_03.png"))
		end

	end
end
--//----------------------------------------------------------------//
local function onBeginContact(event)
	local fixtureA = event.fixtureA
	local fixtureB = event.fixtureB
	local bodyA = fixtureA:getBody()
	local bodyB = fixtureB:getBody()
	if stage.win ==0 and soltado==true then
		if (bodyA.name=="caramelo" and bodyB.name=="meta_2") or (bodyA.name=="meta_2" and bodyB.name=="caramelo") then
			sonidoMasticar:play()
			comer(bodyA,bodyB)
		end
		if (bodyA.name=="caramelo" and bodyB.name=="meta_1") or (bodyA.name=="meta_1" and bodyB.name=="caramelo") then
			meta[1]:setVisible(false)
			sonidoAbrirBoca:play()
			x,y=meta[1]:getPosition()
			GatoAbriendoBoca:reiniciar()
			GatoAbriendoBoca:agregarUpdate()
			GatoAbriendoBoca:setVisible(true)
			GatoAbriendoBoca:setPosition(x,y)

		end
		if estrella1Agarrada==false then
			if  (bodyA.name=="caramelo" and bodyB.name=="estrella_1") or (bodyA.name=="estrella_1" and bodyB.name=="caramelo") then
				mcE1R= MovieClip.new
				{{1, 12, estrella[1], {rotation = {0,80,"OutSine" }}}}
				mcE1S = MovieClip.new
				{{1, 12, estrella[1], {scale = {0.7,0,"OutSine" }}}}
				mcE1A = MovieClip.new
				{{1, 10, estrella[1], {alpha = {1,0,"OutSine" }}}}
				mcE1R:addEventListener(Event.COMPLETE, function()
					if estrella1Agarrada==false then
						estrella[1]:setScale(0.5,0.5)
						estrella[1]:setAlpha(1)
					end
				end)
				estrella1Agarrada=true
				estrellaAgarrada()
			end
		end
		if estrella2Agarrada==false then
			if  (bodyA.name=="caramelo" and bodyB.name=="estrella_2") or (bodyA.name=="estrella_2" and bodyB.name=="caramelo") then
				mcE2R= MovieClip.new
				{{1, 12, estrella[2], {rotation = {0,80,"OutSine" }}}}
				mcE2S = MovieClip.new
				{{1, 12, estrella[2], {scale = {0.7,0,"OutSine" }}}}
				mcE2A = MovieClip.new
				{{1, 10, estrella[2], {alpha = {1,0,"OutSine" }}}}
				mcE2R:addEventListener(Event.COMPLETE, function()
					if estrella2Agarrada==false then
						estrella[2]:setScale(0.5,0.5)
						estrella[2]:setAlpha(1)
					end
				end)
				estrella2Agarrada=true
				estrellaAgarrada()
			end
		end
		if estrella3Agarrada==false then
			if estrella3Agarrada==false and (bodyA.name=="caramelo" and bodyB.name=="estrella_3") or (bodyA.name=="estrella_3" and bodyB.name=="caramelo") then
				mcE3R= MovieClip.new
				{{1, 12, estrella[3], {rotation = {0,80,"OutSine" }}}}
				mcE3S = MovieClip.new
				{{1, 12, estrella[3], {scale = {0.7,0,"OutSine" }}}}
				mcE3A = MovieClip.new
				{{1, 10, estrella[3], {alpha = {1,0,"OutSine" }}}}
				mcE3R:addEventListener(Event.COMPLETE, function()
					if estrella3Agarrada==false then
						estrella[3]:setScale(0.5,0.5)
						estrella[3]:setAlpha(1)
					end
				end)
				estrella3Agarrada=true
				estrellaAgarrada()
			end
		end
		if (soltado==true and (bodyA.type=="obstaculo" and bodyB.name=="caramelo") or (bodyA.name=="caramelo" and bodyB.type=="obstaculo")) then
							if dataSaver.loadValue("efectos")==1 then
			sonidoPelotaMadera:play()	
			end
		end
	end

		--print("end contact: "..bodyA.type.." - "..bodyB.name)

end
--//----------------------------------------------------------------//
local function onEndContact(event)
	local fixtureA = event.fixtureA
	local fixtureB = event.fixtureB
	local bodyA = fixtureA:getBody()
	local bodyB = fixtureB:getBody()
	if (bodyA.name=="caramelo" and bodyB.name=="meta_1") or (bodyA.name=="meta_1" and bodyB.name=="caramelo")then
		if salidoDePantalla==false then
		meta[1]:setVisible(true)
	end
		GatoAbriendoBoca:setVisible(false)
	end

	--print("end contact: "..bodyA.name.." - "..bodyB.name)
end
--//----------------------------------------------------------------// Setear Variables
function setearVariables(self)
	caramelo:setVisible(true)
	estrella1Agarrada=false
	estrella2Agarrada=false
	estrella3Agarrada=false
	pause=false
	soltado=false
	distanciaEntrePuntos=0
	screenW = application:getContentWidth()
	screenH = application:getContentHeight()
	stage.win=0
	estrellasAgarradas=0

	caramelo:setScale(1,1)
	caramelo.body:setGravityScale(0);
	caramelo.body:setAngularVelocity(0,0)
	caramelo.body:setLinearVelocity(0,0)
	
	for i=1, 3,1 do
	estrella[i]:setScale(0.5,0.5)
	estrella[i]:setRotation(0)
	estrella[i]:setAlpha(1)
	end
	for i=1, 6,1 do
	obstaculo[i]:setVisible(true)
	obstaculo[i]:setPosition(-100,-100)
	end
	for i=1, 3,1 do
	estrella[i]:setPosition(-100,-100)
	estrella[i]:setVisible(true)
	labelLevel:setVisible(false)
	end
	GatoComiendo:setPosition(-100,-100)
	GatoComiendo:setVisible(false)
	GatoComiendo:removerUpdate()
	meta[1]:removerUpdate()
	if catTriste~=nil then
		catTriste:removeFromParent()
		catTriste=nil
	end
	local debugDraw = b2.DebugDraw.new()
	world:setDebugDraw(debugDraw)
	---------debug---------
	--self:addChild(debugDraw)
	----------------
end
--//----------------------------------------------------------------// INIT
function Juego:init()
	require "box2d"
	require "niveles"
	_self=self
	dataSaver.saveValue("BDPerdiste", 0)
	BDPerdiste = dataSaver.loadValue("BDPerdiste")
	self.startpoint = {}
	self.endpoint = {}
	self.slingshot = Shape.new()
	self:addChild(self.slingshot)
	nivelactual=1
	salidoDePantalla=false
	-----------------------------------------------------------------WORLD
	world = b2.World.new(0, 50, true)
	application:setBackgroundColor(0x000000) -- 0xB8B8B8
	self.ground = world:createBody({})
	self.mouseJoint = nil
	transicion=false
	sonidoPelotaMadera=Sound.new("Recursos/Sonidos/sonido_pelota_madera.wav")
	sonidoTriste=Sound.new("Recursos/Sonidos/sonido_triste.wav")
	
	
	
	
	
	
	sonidoAbrirBoca=Sound.new("Recursos/Sonidos/sonido_abrirboca.wav")
	sonidoMasticar=Sound.new("Recursos/Sonidos/sonido_masticar.wav")
	self.sonido=Sound.new("Recursos/Sonidos/sonido_boton_presionado.wav")
	self.error=Sound.new("Recursos/Sonidos/sonido_error.wav")
	sonidoEstrella=Sound.new("Recursos/Sonidos/sonido_estrella.wav")
	if dataSaver.loadValue("idioma")==nil then
		dataSaver.saveValue("idioma", "en")
	end
	if dataSaver.loadValue("musica")==nil then
		dataSaver.saveValue("musica", 1)
	end
	if dataSaver.loadValue("efectos")==nil then
		dataSaver.saveValue("efectos", 1)
	end
		if dataSaver.loadValue("idioma")==nil then
		dataSaver.saveValue("idioma", "es")
	end
	

print(application:getDeviceInfo())

	--require "iad"

	
	local function onBannerAdLoaded()
	print("banner ad loaded")
end

local function onBannerAdFailed(event)
	print("banner ad failed", event.errorCode, event.errorDescription)
end

local function onBannerActionBegin(event)
	
	print("banner action begin", event.willLeaveApplication)
end

local function onBannerActionFinished()
	print("banner action finished")
end
	
	
	
	-- if iAd module is loaded and iAd framework is available, create an ad banner and then show it
banner = nil
if iad and iad.isAvailable() then
	banner = iad.Banner.new(iad.Banner.TOP, iad.Banner.LANDSCAPE)
	banner:addEventListener(Event.BANNER_AD_LOADED, onBannerAdLoaded)
	banner:addEventListener(Event.BANNER_AD_FAILED, onBannerAdFailed)
	banner:addEventListener(Event.BANNER_ACTION_BEGIN, onBannerActionBegin)
	banner:addEventListener(Event.BANNER_ACTION_FINISHED, onBannerActionFinished)
	banner:show()  -- show it because newly created banners are not visible by default
end


	setObstaculos(self,"0","MenuPrincipal",world)
	setearVariables(self)
	_self=self
	
	
	
		if dataSaver.loadValue("agarradas_en_nivel_27")==nil then
			for i=1,27,1 do
				print ("SETEANDO: agarradas_en_nivel_"..i.." en 0.")
				dataSaver.saveValue("agarradas_en_nivel_"..i, 0)
			end
		end
		
		
	--[[ads= Bitmap.new(Texture.new('Recursos/Otros/ads.jpg'))
	ads:setPosition(0,0)
	self:addChild(ads)]]
	
	world:addEventListener(Event.BEGIN_CONTACT, onBeginContact)
	world:addEventListener(Event.END_CONTACT, onEndContact)
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)
	self:addEventListener(Event.MOUSE_MOVE, self.onMouseMove, self)
	self:addEventListener(Event.MOUSE_UP, self.onMouseUp, self)
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
----------------------------------------------------------------------------------->BOTONES ->
	
----------------------------------------------------------------------------------->BOTONES  <-

	
end
function showBanner()
print("showBanner")
	if banner ~= nil then
		banner:show()
	end
end

-- hide the banner (if it exists)
function hideBanner()
print("hideBanner")
	if banner ~= nil then
		banner:hide()
	end
end

--//----------------------------------------------------------------// KEY DOWN
function Juego:onMouseDown(event)
	if pause==false and soltado==false then
		x,y=imagenagarre:getPosition()
		print(event.x,event.y)
		if event.x <480 then
		
		else
		
		end
		if (self.mouseJoint==nil and transicion==false and event.x>=(x-115) and event.x<=(x+115) and event.y <= (y+115) and  event.y>=(y-115)) then
			local jointDef = b2.createMouseJointDef(self.ground, caramelo.body, x, y, 100000)
				self.mouseJoint = world:createJoint(jointDef)
				--save starting point
				self.startpoint.x = x;
				self.startpoint.y = y;
			end	
	end
end
--//----------------------------------------------------------------// KEY MOVE MOVED

function Juego:onMouseMove(event)

	if self.mouseJoint ~= nil  then
		self.endpoint.x = event.x
		self.endpoint.y = event.y
		distanciaEntrePuntos=distance(self.startpoint.x,self.startpoint.y,event.x,event.y)
		x,y=caramelo:getPosition()
		imagenagarre:setPosition(event.x,event.y)
		self.mouseJoint:setTarget(event.x, event.y)
		--clear any previous slingshot
		self.slingshot:clear()
		--borde
		self.slingshot:setLineStyle((distanciaEntrePuntos/(13))*-1+40, 0x33344b, 0.8)
		self.slingshot:beginPath()
		self.slingshot:moveTo(self.startpoint.x, self.startpoint.y)
		self.slingshot:lineTo(event.x, event.y)
		self.slingshot:endPath()
		--relleno
		self.slingshot:setLineStyle((distanciaEntrePuntos/(13))*-1+30, 0x6f6f82, 0.8)
		self.slingshot:beginPath()
		self.slingshot:moveTo(self.startpoint.x, self.startpoint.y)
		self.slingshot:lineTo(event.x, event.y)
		self.slingshot:endPath()
		--rojo
		
		self.slingshot:setLineStyle((distanciaEntrePuntos/(13))*-1+30, 0xbc2f2f, distanciaEntrePuntos/300)
		self.slingshot:beginPath()
		self.slingshot:moveTo(self.startpoint.x, self.startpoint.y)
		self.slingshot:lineTo(event.x, event.y)
		self.slingshot:endPath()
		
	 if distanciaEntrePuntos> 300 then 
	 	soltar(self.startpoint.x,self.startpoint.y,event.x,event.y,self)

	 end
	 
	 if (distance(x,y,event.x,event.y))>160 then 
	 soltar(self.startpoint.x,self.startpoint.y,event.x,event.y,self)
	 end
	 
	 
	end
end

    function distance ( x1, y1, x2, y2 )
      local dx = x1 - x2
      local dy = y1 - y2
      return math.sqrt ( dx * dx + dy * dy )
    end

--//----------------------------------------------------------------// KEY UP
function Juego:onMouseUp(event)
	--check if slingshot is pulled up
	if self.mouseJoint ~= nil then
	soltar(self.startpoint.x,self.startpoint.y,event.x,event.y,self)
		self.endpoint.x = event.x
		self.endpoint.y = event.y
	end
end
--//----------------------------------------------------------------//
function soltar(x1,y1,x2,y2,self)
	soltado=true
	sonido=Sound.new("Recursos/Sonidos/sonido_soltar_caramelo.wav")
					if dataSaver.loadValue("efectos")==1 then
	sonido:play()	
	end
	mc = MovieClip.new
		{{1, 39, imagenagarre, {scale = {0.5,0.4, "easeIn"}}}}
		mc = MovieClip.new
		{{1, 39, imagenagarre, {x = {x2, x1, "outElastic"}}},
		{1, 39, imagenagarre, {y = {y2, y1, "outElastic"}}}}
	mc:addEventListener(Event.COMPLETE, function()
		--cerrar()
	end, mc)	
		local body=caramelo.body
		body:setGravityScale(1)
		if (self.mouseJoint ~= nil) then
		world:destroyJoint(self.mouseJoint)
		self.mouseJoint = nil
		end
		--clear slingshot respresentation
		self.slingshot:clear()
	ultimotiro1= Shape.new()
	ultimotiro1:clear()
	ultimotiro1:setLineStyle((distanciaEntrePuntos/(13))*-1+40, 0x33344b, 0.2)
	ultimotiro1:beginPath()
	ultimotiro1:moveTo(x1,y1)
	ultimotiro1:lineTo(x2,y2)
	ultimotiro1:endPath()
	self:addChildAt(ultimotiro1,2)
	ultimotiro2= Shape.new()
	ultimotiro2:clear()
	ultimotiro2:setLineStyle((distanciaEntrePuntos/(13))*-1+30, 0x6f6f82, 0.2)
	ultimotiro2:beginPath()
	ultimotiro2:moveTo(x1,y1)
	ultimotiro2:lineTo(x2,y2)
	ultimotiro2:endPath()
	self:addChildAt(ultimotiro2,2)
		--define strength of slingshot
		local strength = 1
		--calculate force vector based on strength 
		--and distance of pull
		local xVect = (x1-x2)*strength
		local yVect = (y1-y2)*strength
		--applye impulse to target
		caramelo.body:applyLinearImpulse(xVect, yVect, caramelo:getX(), caramelo:getY())
end
--//----------------------------------------------------------------//	UPDATE
function Juego:onEnterFrame(event)

	if pause==false and stage.win==0 then
		x,y=caramelo:getPosition()
		BDPerdiste = dataSaver.loadValue("BDPerdiste")
		if soltado==true and salidoDePantalla==false and (x < -50 or x > 1010 or y > 690 ) and transicion==false then
		salidoDePantalla=true
		sonidoTriste:play()
		catTriste=gato3:new()
		self:addChild(catTriste)
		local meta1X
		local meta1Y
		meta1X,meta1Y=meta[1]:getPosition()
		catTriste:setPosition(meta1X,meta1Y)
		meta[1]:setVisible(false)
		end
		
		if BDPerdiste==0  and (y>1500 or x<-250 or x>1310) and  transicion==false then
			sonido=Sound.new("Recursos/Sonidos/sonido_morir.wav")
							if dataSaver.loadValue("efectos")==1 then
			sonido:play()	
			end
			dataSaver.saveValue("BDPerdiste", 1)
			local BDDesde = dataSaver.loadValue("BDDesde")
			local BDHasta = dataSaver.loadValue("BDHasta")	
			
			for i=1,3,1 do 
				estrella[i].body = estrellaBody[i]
				
			end		
			borrarEstrellasBotones(self)
				setObstaculos(self,BDDesde,BDHasta,world)
				setearVariables(self)
				if ultimotiro1~=nil then 
					local parent=ultimotiro1:getParent()
					if parent==self then 
						self:removeChild(ultimotiro1)
						self:removeChild(ultimotiro2)
					end
				end
				for i=1,3,1 do
				estrella[i]:setVisible(true)
				end
			
		end
			if (transicion==false) then
			animacionDeNiveles()
			end		
		world:step(1/60, 8, 3)
		for i = 1, self:getNumChildren() do
			local sprite = self:getChildAt(i)
			-- check if sprite HAS a body (ie, physical object reference we added)
			if sprite.body then
				--update position to match box2d world object's position
				--get physical body reference
				local body = sprite.body
				--get body coordinates
				local bodyX, bodyY = body:getPosition()
				if stage.win==1 then
				
				end
				--brillo:setPosition(x,y)
					sprite:setPosition(bodyX, bodyY)
					
					sprite:setRotation(body:getAngle() * 180 / math.pi)
			end
		end
	end
end
--//----------------------------------------------------------------//	Animaciones
function animacionEstrella1()
		mc1 = MovieClip.new
			{{1, 150, estrella[1], {rotation = {-20,360, "inOutSine"}}}}

		mc2 = MovieClip.new
			{{1, 150, estrella[2], {rotation = {-20,360, "inOutSine"}}}}

		mc3 = MovieClip.new
			{{1, 150, estrella[3], {rotation = {-20,360, "inOutSine"}}}}
			mc3:addEventListener(Event.COMPLETE, function()
		--animacionEstrella2()
	end, mc3)	
	
end

function animacionEstrella2()
		mc1 = MovieClip.new
			{{1, 150, estrella[1], {rotation = {20,-20, "inOutSine"}}}}

	
		mc2 = MovieClip.new
			{{1, 150, estrella[2], {rotation = {20,-20, "inOutSine"}}}}
	
		mc3 = MovieClip.new
			{{1, 150, estrella[3], {rotation = {20,-20, "inOutSine"}}}}
			mc3:addEventListener(Event.COMPLETE, function()
		animacionEstrella1()
	end, mc3)	
end


function animacionDeNiveles()
	local BDHasta = dataSaver.loadValue("BDHasta")	
	
	if (BDHasta==24) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>6 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-6 then sumMovimiento2=0.1 end
		x,y=obstaculo[2]:getPosition()
		obstaculoBody[2]:setPosition(x,y+sumMovimiento1)
		x,y=obstaculo[1]:getPosition()
		obstaculoBody[1]:setPosition(x,y-sumMovimiento1)
	end		
	
	if (BDHasta==18) then
		a=obstaculoBody[1]:getAngle()
		obstaculoBody[1]:setAngle(a+0.7*(math.pi/180))
		a=obstaculoBody[2]:getAngle()
		obstaculoBody[2]:setAngle(a+0.7*(math.pi/180))
	end
	if(BDHasta==26) then
	sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>1.6 then sumMovimiento2=-0.015 end
		if sumMovimiento1<-1.6 then sumMovimiento2=0.015 end
		x,y=obstaculo[6]:getPosition()
		obstaculoBody[6]:setPosition(x,y-sumMovimiento1)
	end
	if (BDHasta==16) then
		a=obstaculoBody[3]:getAngle()
		obstaculoBody[3]:setAngle(a+0.7*(math.pi/180))
	end
	if (BDHasta==21) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>6 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-6 then sumMovimiento2=0.1 end
		x,y=obstaculo[3]:getPosition()
		obstaculoBody[3]:setPosition(x-sumMovimiento1,y)
	end	
	if (BDHasta==13) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>8 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-8 then sumMovimiento2=0.1 end
		x,y=obstaculo[2]:getPosition()
		obstaculoBody[2]:setPosition(x-sumMovimiento1,y)
	end		
	if (BDHasta==22) then
		a=obstaculoBody[1]:getAngle()
		obstaculoBody[1]:setAngle(a-1.2*(math.pi/180))
		a=obstaculoBody[2]:getAngle()
		obstaculoBody[2]:setAngle(a+1.2*(math.pi/180))
		a=obstaculoBody[3]:getAngle()
		obstaculoBody[3]:setAngle(a+0.6*(math.pi/180))
	end
	if (BDHasta==23) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>2.8 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-2.8 then sumMovimiento2=0.1 end

		x,y=obstaculo[3]:getPosition()
		obstaculoBody[3]:setPosition(x,y-sumMovimiento1)
	end
	if (BDHasta==27) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>4.4 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-4.4 then sumMovimiento2=0.1 end
		x,y=obstaculo[1]:getPosition()
		obstaculoBody[1]:setPosition(x+sumMovimiento1,y)
		x,y=obstaculo[2]:getPosition()
		obstaculoBody[2]:setPosition(x-sumMovimiento1,y)
		x,y=obstaculo[3]:getPosition()
		obstaculoBody[3]:setPosition(x,y-sumMovimiento1/2)
		
	
	end
	
	
	if (BDHasta==20) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>6 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-6 then sumMovimiento2=0.1 end
		x,y=obstaculo[1]:getPosition()
		obstaculoBody[1]:setPosition(x-sumMovimiento1,y)
		x,y=obstaculo[2]:getPosition()
		obstaculoBody[2]:setPosition(x+sumMovimiento1,y)
	end
	
	
	if (BDHasta==25) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>4 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-4 then sumMovimiento2=0.1 end
		x,y=obstaculo[6]:getPosition()
		obstaculoBody[6]:setPosition(x-sumMovimiento1,y)
		
	end
	if (BDHasta==17) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		sumMovimiento3=sumMovimiento3+sumMovimiento4
		if sumMovimiento1>8 then sumMovimiento2=-0.2 end
		if sumMovimiento1<-8 then sumMovimiento2=0.2 end
		if sumMovimiento3>4 then sumMovimiento4=-0.1 end
		if sumMovimiento3<-4 then sumMovimiento4=0.1 end
		x,y=obstaculo[1]:getPosition()
		obstaculoBody[1]:setPosition(x+sumMovimiento1,y)
		x,y=obstaculo[2]:getPosition()
		obstaculoBody[2]:setPosition(x-sumMovimiento3,y)
		x,y=obstaculo[3]:getPosition()
		obstaculoBody[3]:setPosition(x+sumMovimiento1,y)
		
	end
	
	if (BDHasta==5) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		if sumMovimiento1>3 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-3 then sumMovimiento2=0.1 end
		x,y=estrella[1]:getPosition()
		estrellaBody[1]:setPosition(x,y+sumMovimiento1)
		x,y=estrella[2]:getPosition()
		estrellaBody[2]:setPosition(x,y+sumMovimiento1)
		
			x,y=estrella[3]:getPosition()
		estrellaBody[3]:setPosition(x,y+sumMovimiento1)
		
		
	
		
	end
	if (BDHasta==10) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		sumMovimiento3=sumMovimiento3+sumMovimiento4
		sumMovimiento5=sumMovimiento5+sumMovimiento6
		if sumMovimiento1>4 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-4 then sumMovimiento2=0.1 end
		
		if sumMovimiento3>4 then sumMovimiento4=-0.1 end
		if sumMovimiento3<-4 then sumMovimiento4=0.1 end
		
		if sumMovimiento5>4 then sumMovimiento6=-0.1 end
		if sumMovimiento5<-4 then sumMovimiento6=0.1 end
		
		x,y=estrella[1]:getPosition()
		estrellaBody[1]:setPosition(x+sumMovimiento1,y)
		
		x,y=estrella[2]:getPosition()
		estrellaBody[2]:setPosition(x+sumMovimiento3,y)
		
		x,y=estrella[3]:getPosition()
		estrellaBody[3]:setPosition(x+sumMovimiento5,y)
end
if (BDHasta==7) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		sumMovimiento3=sumMovimiento3+sumMovimiento4
		sumMovimiento5=sumMovimiento5+sumMovimiento6
		if sumMovimiento1>4 then sumMovimiento2=-0.1 end
		if sumMovimiento1<-4 then sumMovimiento2=0.1 end
		
		if sumMovimiento3>4 then sumMovimiento4=-0.1 end
		if sumMovimiento3<-4 then sumMovimiento4=0.1 end
		
		if sumMovimiento5>4 then sumMovimiento6=-0.1 end
		if sumMovimiento5<-4 then sumMovimiento6=0.1 end
		
		x,y=estrella[1]:getPosition()
		estrellaBody[1]:setPosition(x,y+sumMovimiento1)
		
		x,y=estrella[2]:getPosition()
		estrellaBody[2]:setPosition(x,y+sumMovimiento3)
		
		x,y=estrella[3]:getPosition()
		estrellaBody[3]:setPosition(x,y+sumMovimiento5)
end	
	if (BDHasta==8) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
	
		if sumMovimiento1>3 then sumMovimiento2=-0.05 end
		if sumMovimiento1<-3 then sumMovimiento2=0.05 end		
		x,y=estrella[3]:getPosition()
		estrellaBody[3]:setPosition(x,y+sumMovimiento1)
		
end	
if (BDHasta==4) then
		sumMovimiento1=sumMovimiento1+sumMovimiento2
		sumMovimiento3=sumMovimiento3+sumMovimiento4
	
		if sumMovimiento1>4 then sumMovimiento2=-0.05 end
		if sumMovimiento1<-4 then sumMovimiento2=0.05 end
		
		if sumMovimiento3>4 then sumMovimiento4=-0.05 end
		if sumMovimiento3<-4 then sumMovimiento4=0.05 end
		
		x,y=obstaculo[1]:getPosition()
		obstaculoBody[1]:setPosition(x,y+sumMovimiento1)
		
		x,y=obstaculo[2]:getPosition()
		obstaculoBody[2]:setPosition(x,y-sumMovimiento3)

		
end

	
	
	
--[[if (BDHasta=="Config") then
			a=imgDestello:getRotation()
		imgDestello:setRotation(a+2*(math.pi/180))
	
	end]]
	
	
end
