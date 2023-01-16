obstaculosAgarrados=false
function setObstaculos(self,desde,hasta,world)
	print (desde,hasta)
	hideBanner()
	stage.hasta=hasta
	transicion=true
	dataSaver.saveValue("BDDesde", desde)
	dataSaver.saveValue("BDHasta", hasta)
	local BDDesde = dataSaver.loadValue("BDDesde")
	local BDHasta = dataSaver.loadValue("BDHasta")

	if obstaculosAgarrados==false then
	--trampa
	if 1==2 then
	print ("SETEANDO: agarradas_en_nivel_X en 3.")
		for i=1,20,1 do
				
				dataSaver.saveValue("agarradas_en_nivel_"..i, 3)
		end
	end
	
		fondo = Bitmap.new(Texture.new('Recursos/Fondos/bg_MP_MN.jpg'))
		MusicaJuego=Sound.new('Recursos/Sonidos/FG.mp3')
		MusicaJuegoChanel = MusicaJuego:play(500,true,true)
		MusicaFondo=Sound.new('Recursos/Sonidos/Sk8board.mp3')
		MusicaFondoChanel = MusicaFondo:play()
		if dataSaver.loadValue("musica")==1 then
			MusicaFondoChanel:setVolume(0.05)
		else
			MusicaFondoChanel:setVolume(0)
		end
		fondo:setVisible(false)
		fondo:setAnchorPoint(0.5,0.5)
		fondo:setPosition(480,320)
		self:addChildAt(fondo,1)
	--//------------------------------------------------------------------ Obstaculos
		obstaculosAgarrados=true
		obstaculo={}
		obstaculoBody={}
		obstaculoShape={}
		obstaculoFixture={}
		for i = 1, 5, 1 do
			obstaculo[i]=Bitmap.new(Texture.new("Recursos/Juego/ob_05.png"))
			obstaculo[i]:setVisible(false)
			obstaculo[i]:setAnchorPoint(0.5,0.5)
			obstaculo[i]:setScale(0.75,0.75) 
			obstaculoBody[i] = world:createBody{type = b2.STATIC_BODY}
			obstaculoBody[i].name="obstaculo_"..i
			obstaculoBody[i]:setPosition(obstaculo[i]:getX(), obstaculo[i]:getY())
			obstaculoBody[i]:setAngle(obstaculo[i]:getRotation())
			obstaculoShape[i] = b2.PolygonShape.new()
			obstaculoShape[i]:setAsBox(obstaculo[i]:getWidth()/2.07, obstaculo[i]:getHeight()/3)
			obstaculoFixture[i] = obstaculoBody[i]:createFixture{shape = obstaculoShape[i], density = 1.0, friction = 1, restitution = 0}
			obstaculoFixture[i]:setSensor(true)
			obstaculo[i].body = obstaculoBody[i]
			obstaculo[i].body.type = "obstaculo"
			self:addChild(obstaculo[i])
		end
		obstaculo[6]=Bitmap.new(Texture.new("Recursos/Juego/circulo.png"))
		obstaculo[6]:setVisible(false)
		obstaculo[6]:setAnchorPoint(0.5,0.5)
		obstaculo[6]:setScale(0.75,0.75)
		obstaculoBody[6] = world:createBody{type = b2.STATIC_BODY}
		obstaculoBody[6].name="obstaculo_"..6
		obstaculoBody[6]:setPosition(obstaculo[6]:getX(), obstaculo[6]:getY())
		obstaculoBody[6]:setAngle(obstaculo[6]:getRotation())
		obstaculoShape[6] = b2.CircleShape.new(0, 0, obstaculo[6]:getWidth()/2)
		obstaculoFixture[6] = obstaculoBody[6]:createFixture{shape = obstaculoShape[6], density = 1.0, friction = 1, restitution = 0.5}
		obstaculoFixture[6]:setSensor(true)
		obstaculo[6].body = obstaculoBody[6]
		obstaculo[6].body.type = "obstaculo"
		self:addChild(obstaculo[6])
	--//------------------------------------------------------------------ Estrellas
		estrella={}
		estrellaBody={}
		estrellaShape={}
		estrellaFixture={}
		estrellaRadius={}
		for i = 1, 3, 1 do
			estrella[i]=Bitmap.new(Texture.new("Recursos/Juego/estrella_01.png"))
			estrella[i]:setVisible(false)
			estrella[i]:setAnchorPoint(0.5,0.5)
			estrella[i]:setScale(0.5,0.5)
			estrellaRadius[i]=estrella[i]:getWidth()/4
			estrellaBody[i] = world:createBody{type = b2.STATIC_BODY}
			estrellaBody[i].name="estrella_"..i
			estrellaBody[i]:setPosition(estrella[i]:getX(), estrella[i]:getY())
			estrellaBody[i]:setAngle(estrella[i]:getRotation())
			estrellaShape[i] = b2.CircleShape.new(0, 0, estrellaRadius[i])
			estrellaFixture[i] = estrellaBody[i]:createFixture{shape = estrellaShape[i], density = 1.0, friction = 1, restitution = 0.3}
			estrellaFixture[i]:setSensor(true)
			estrella[i].body = estrellaBody[i]
			estrella[i].body.type = "estrella"
			self:addChild(estrella[i])
		end
	--//------------------------------------------------------------------ Metas
		meta={}
		metaBody={}
		metaShape={}
		metaFixture={}
		metaRadius={}
		for i = 2, 1, -1 do
			if i==1 then scale=3 
				meta[i] = gato1.new() end
			if i==2 then 
				scale=1.4 var="_" 
				meta[i] = Bitmap.new(Texture.new("Recursos/Juego/base_01.png")) 
				meta[i]:setAnchorPoint(0.53,-0.76)
			end
			meta[i]:setPosition(-100,-100)
			metaRadius[i]=meta[i]:getWidth()/4
			metaBody[i] = world:createBody{type = b2.STATIC_BODY}
			metaBody[i].name="meta_"..i
			metaBody[i]:setPosition(meta[i]:getX(), meta[i]:getY())
			metaBody[i]:setAngle(meta[i]:getRotation())
			metaShape[i] = b2.CircleShape.new(0, 0, metaRadius[i]*scale)
			metaFixture[i] = metaBody[i]:createFixture{shape = metaShape[i], density = 1.0, friction = 1, restitution = 0.5}
			metaFixture[i]:setSensor(true)
			meta[i].body = metaBody[i]
			meta[i].body.type = "meta"
			self:addChild(meta[i])
		end
		
	GatoAbriendoBoca=gato2:new()
	GatoAbriendoBoca:setVisible(false)
	self:addChild(GatoAbriendoBoca)
	GatoAbriendoBoca:agregarUpdate()
	
	GatoComiendo=gato4:new()
	self:addChild(GatoComiendo)
		
	--//------------------------------------------------------------------ Caramelo
		caramelo = Bitmap.new(Texture.new("Recursos/Juego/p_1.png"))
		caramelo:setAnchorPoint(0.5,0.5)
		carameloRadius = caramelo:getWidth()/2
		carameloBody = world:createBody{type = b2.DYNAMIC_BODY}
		caramelo:setPosition(1060,-100)
		carameloBody.name="caramelo"
		carameloBody:setPosition(caramelo:getX(), caramelo:getY())
		carameloShape = b2.CircleShape.new(0, 0, carameloRadius)
		caramelofixture = carameloBody:createFixture{shape = carameloShape, density = 1.0, friction = 0.5, restitution = 0.8}
		caramelo.body = carameloBody
		caramelo.body.type = "caramelo"
		self:addChild(caramelo)
	--//------------------------------------------------------------------ Agarre	
		imagenagarre = Bitmap.new(Texture.new('Recursos/Juego/agarre.png'))
		imagenagarre:setAnchorPoint(0.5,0.5)
		imagenagarre:setScale(0.5)
		self:addChild(imagenagarre)
		
		fuente= Font.new("Recursos/Fuentes/pipedream.txt", "Recursos/Fuentes/pipedream.png")
		labelLevel = TextField.new(fuente, hasta)
		labelLevel:setScale(1)
		local lcw=labelLevel:getWidth()
		lcw=lcw/2
		labelLevel:setPosition(687,72)
		labelLevel:setTextColor(0xffffff)
		labelLevel:setScale(0.65)
		labelLevel:setAlpha(0.58)
		self:addChild(labelLevel)
	end
--//------------------------------------------------------------------ obstaculosAgarrados==false <-





--//------------------------------------------------------------------ Iniciar Posiciones ->
	for i = 1, 6, 1 do
		obstaculoBody[i]:setPosition(-100,-100)
		obstaculoBody[i]:setAngle(0)
		obstaculoFixture[i]:setSensor(true)
	end
	for i = 1, 3, 1 do
		estrellaBody[i]:setPosition(-100,-100)
		estrellaBody[i]:setAngle(0)
	end
	for i = 1, 2, 1 do
		metaBody[i]:setPosition(-100,-100)
	end
	if hasta=="MenuNiveles" or hasta=="MenuPrincipal" then
	carameloBody:setPosition(1060,-100)
	imagenagarre:setPosition(1060,-100)
	end
	meta[1]:setVisible(true)
	GatoComiendo:setPosition(-100,-100)
	GatoComiendo:setVisible(false)
--//------------------------------------------------------------------ Iniciar Posiciones <-





--//------------------------------------------------------------------ Scenes ->
	

	layerNegra= Shape.new()
	layerNegra:setFillStyle(Shape.SOLID, 0x000000, 1)
	layerNegra:beginPath()
	layerNegra:moveTo(0,0)
	layerNegra:lineTo(960, 0)
	layerNegra:lineTo(960, 640)
	layerNegra:lineTo(0, 640)
	layerNegra:lineTo(0, 0)
	layerNegra:endPath()
	layerNegra:setPosition(0, 0)
	self:addChild(layerNegra)
	cargando = Bitmap.new(Texture.new("Recursos/Otros/cargando_09.png"))
	cargando:setAnchorPoint(0.5,0.5)
	cargando:setScale(0.8,0.8)
	
	--HOLA
	
	cargando:setPosition(480,320)
	self:addChild(cargando)
	str_boton="loading_"..dataSaver.loadValue("idioma") 
	loading = Bitmap.new(Texture.new("Recursos/BotonesTexto/"..str_boton..".png"))
	loading:setAnchorPoint(0.5,0.5)
	loading:setPosition(480,396)
	self:addChild(loading)
	local duracion=15
	if desde==0 then
		duracion=0
	end
	mcrotate= MovieClip.new
	{{1, 70, cargando, {rotation = {0,60,"OutSine" }}}}
	mc = MovieClip.new
	{{1, duracion, cargando, {alpha = {0,1,"outSine" }}}}
	mc1 = MovieClip.new 
	{{1, duracion, layerNegra, {alpha = {0,1,"outSine" }}}}--0,1
	mc1:addEventListener(Event.COMPLETE, function()
	fondo:setVisible(true)
	mc2= MovieClip.new
	{{1, 35, cargando, {x = {480,480,"inOutSine" }}}}
	mc2:addEventListener(Event.COMPLETE, function()


--//------------------------------------------------------------------ Menu Principal
	if hasta=="MenuPrincipal" then
		fondo:setTexture(Texture.new('Recursos/Fondos/bg_MP2.jpg'))
		if desde=="Config" then
			self:removeChild(BotonMenuConfigPrincipal)
			for i=1,5,1 do
				botonesEnConfig[i]:removeFromParent()
				botonesEnConfig[i]=nil
				img1BotonesEnConfig[i] = nil
				img2BotonesEnConfig[i] =nil
			end
			flag:removeFromParent()
			flag=nil
			checkMusica:removeFromParent()
			checkEfectos:removeFromParent()
			checkMusica=nil
			checkEfectos=nil
			if resetPresionado ==1 or resetPresionado==2 then
			mensajeReset:removeFromParent()
			mensajeReset=nil
			end

		end
		if desde=="Confirm" then
			for i=1,3,1 do
				BotonesEnConfirm[i]:removeFromParent()
				BotonesEnConfirm[i]=nil
				img1BotonesEnConfirm[i] = nil
				img2BotonesEnConfirm[i] =nil
			end

		end

		if desde=="MenuNiveles" then
			self:removeChild(BotonMenuNivelesPrincipal)
			for i=1,27,1 do	
				numerosDeNiveles[i]:removeFromParent()
				numerosDeNiveles[i]=nil
				capturadasPorNivel[i]:removeFromParent()
				capturadasPorNivel[i]=nil
				botonNivel[i]:removeFromParent()
				botonNiveles1[i]=nil
				botonNiveles2[i]=nil
				botonNivel[i]=nil
				end
				for i=1,3,1 do
				botonCaja[i]:removeFromParent()
				botonCaja[i]=nil
				botonCaja1[i]=nil
				botonCaja2[i]=nil
				carameloCaja[i]:removeFromParent()
				carameloCaja[i]=nil
				end
				if candado ~= nil then
				candado:removeFromParent()
				faltantesCaja2:removeFromParent()
				end
				if candado2 ~= nil then
				candado2:removeFromParent()
				faltantesCaja3:removeFromParent()
				end
				if labelTotalAgarradas ~= nil then
					labelTotalAgarradas:removeFromParent()
					labelTotalAgarradas=nil
				end
				if estrellaTotalAgarradas ~= nil then
					estrellaTotalAgarradas:removeFromParent()
					estrellaTotalAgarradas=nil
				end
				
		end
		if desde=="Creditos" then
			if creditos~= nil then
				creditos:removeFromParent()
				creditos=nil
			end
			if creditos~= nil then
				creditos:removeFromParent()
				creditos=nil
			end
			if BotonCreditosPrincipal~= nil then
				BotonCreditosPrincipal:removeFromParent()
				BotonCreditosPrincipal=nil
				img1BotonCreditosPrincipal=nil
				img2BotonCreditosPrincipal=nil
			end
		end
		
		GatoMenuPrincipal=gatoMP:new()
		GatoMenuPrincipal:setPosition(467,420)
		self:addChild(GatoMenuPrincipal)
		GatoPataMenuPrincipal=pataMP:new()
		GatoPataMenuPrincipal:setPosition(550,469)
		self:addChild(GatoPataMenuPrincipal)

		
		img1BotonMenuNiveles = Bitmap.new(Texture.new('Recursos/Otros/boton_nivel01.png'))
		img2BotonMenuNiveles = Bitmap.new(Texture.new('Recursos/Otros/boton_nivel01.png'))
		img1BotonMenuNiveles:setScale(1,1)
		img2BotonMenuNiveles:setScale(1.06,1.06)
		img1BotonMenuNiveles:setAnchorPoint(0.5,0.5)
		img2BotonMenuNiveles:setAnchorPoint(0.5,0.5)
		BotonMenuNiveles = Button.new(img1BotonMenuNiveles, img2BotonMenuNiveles)
		self:addChild(BotonMenuNiveles)
		BotonMenuNiveles:setPosition(820	,550)
		BotonMenuNiveles:addEventListener("click",
		function() 
			if transicion==false then
				if dataSaver.loadValue("efectos")==1 then
				self.sonido:play()
				end
				transicion=true
					desde ="MenuPrincipal"
					hasta="MenuNiveles" 
					setObstaculos(self,desde,hasta,world)
					setearVariables(self)
			end
		end ) 

		img1BotonMenuConfig = Bitmap.new(Texture.new('Recursos/Otros/boton_config01.png'))
		img2BotonMenuConfig = Bitmap.new(Texture.new('Recursos/Otros/boton_config01.png'))
		img2BotonMenuConfig:setScale(1.06,1.06)
		img1BotonMenuConfig:setAnchorPoint(0.5,0.5)
		img2BotonMenuConfig:setAnchorPoint(0.5,0.5)
		BotonMenuConfig = Button.new(img1BotonMenuConfig, img2BotonMenuConfig)
		self:addChild(BotonMenuConfig)
		BotonMenuConfig:setPosition(720	,550)
		BotonMenuConfig:addEventListener("click",
		function() 
			if transicion==false then
				if dataSaver.loadValue("efectos")==1 then
self.sonido:play()
end
				transicion=true
					desde ="MenuPrincipal"
					hasta="Config" 
					setObstaculos(self,desde,hasta,world)
					setearVariables(self)
			end
		end ) 
			
		
		
	end
--//------------------------------------------------------------------ Menu Niveles
	if hasta=="MenuNiveles" then
	showBanner()
		fondo:setTexture(Texture.new('Recursos/Fondos/bg_MP_MN.jpg'))
		if desde=="MenuPrincipal" then
			self:removeChild(BotonMenuNiveles)
			self:removeChild(BotonMenuConfig)
			GatoMenuPrincipal:removeFromParent()
			GatoPataMenuPrincipal:removeFromParent()
		end
		if dataSaver.loadValue("musica")==1 then
		if  MusicaFondoChanel:isPlaying()==false then
		MusicaFondoChanel=MusicaFondo:play()
		
			MusicaFondoChanel:setVolume(0.05)
		end
			
			
		else
			MusicaFondoChanel:setVolume(0)
		end
		caja=1
		moviendoCaja=false
		botonNiveles1={}
		botonNiveles2={}
		botonNivel={}
		botonNivelY={}
		capturadasPorNivel={}
		x_capturadasPorNivel={}
		numerosDeNiveles={}
		x=160
		y=180
		local TotalAgarradas=0
		--PONER LOS 27 NIVELES
		for i=1,27,1 do
		if i==10 then  y=y+164 end
		if i==19 then  y=y+164 end
			if i==4 or i==7  or i==10  or i==13  or i==16  or i==19 or i==22  or i==25      then
			y=y+140
			x=160
			end
			if i<=9 then imgCaja=1 end
			if i>9 and i <=18 then imgCaja=2 end
			if i>18 then imgCaja=3 end
			if dataSaver.loadValue("agarradas_en_nivel_"..i) ~= nil then
				TotalAgarradas=TotalAgarradas+dataSaver.loadValue("agarradas_en_nivel_"..i)
			end
			capturadasPorNivel[i]=Bitmap.new(Texture.new('Recursos/MenuNiveles/capturadas_0'..dataSaver.loadValue("agarradas_en_nivel_"..i)..'.png'))
			botonNiveles1[i]=Bitmap.new(Texture.new('Recursos/MenuNiveles/nivelCaja'..imgCaja..'.png'))
			botonNiveles2[i]=Bitmap.new(Texture.new('Recursos/MenuNiveles/nivelCaja'..imgCaja..'.png'))
			botonNiveles1[i]:setAnchorPoint(0.5,0.5)
			botonNiveles2[i]:setAnchorPoint(0.5,0.5)
			botonNiveles1[i]:setScale(0.95,0.95)
			botonNiveles2[i]:setScale(1.01,1.01)
			botonNivel[i] = Button.new(botonNiveles1[i], botonNiveles2[i])
			self:addChild(botonNivel[i])
			
			
			
			capturadasPorNivel[i]:setAnchorPoint(0.5,0.5)
			capturadasPorNivel[i]:setScale(0.65,0.65)
			capturadasPorNivel[i]:setPosition(x+70,y)
			x_capturadasPorNivel[i]=x+70
			self:addChild(capturadasPorNivel[i])
			
			numerosDeNiveles[i] = TextField.new(fuente, i)
			numerosDeNiveles[i]:setScale(0.75)
			local lcw=numerosDeNiveles[i]:getWidth()
			lcw=lcw/2
			local lch=numerosDeNiveles[i]:getHeight()
			lch=lch/2
			numerosDeNiveles[i]:setPosition(x-lcw,y+lch)
			numerosDeNiveles[i]:setTextColor(0xffffff)--6b6da6--efebf4
			self:addChild(numerosDeNiveles[i]);
		
			
			botonNivel[i]:setPosition(x,y)
			botonNivelY[i]=y
			x=x+200
			botonNivel[i]:addEventListener("click",
			function() 
			
				if transicion==false and moviendoCaja==false then
					if dataSaver.loadValue("efectos")==1 then
				self.sonido:play()
				end
					transicion=true
					MusicaFondoChanel:stop()
					desde ="MenuNiveles"
					hasta=i
					setObstaculos(self,desde,hasta,world)
					setearVariables(self)
					for i2=1,27,1 do
						numerosDeNiveles[i2]:removeFromParent()
						numerosDeNiveles[i2]=nil
						capturadasPorNivel[i2]:removeFromParent()
						capturadasPorNivel[i2]=nil
						botonNivel[i2]:removeFromParent()
						botonNiveles1[i2]=nil
						botonNiveles2[i2]=nil
						botonNivel[i2]=nil
					end
					for i3=1,3,1 do
						botonCaja[i3]:removeFromParent()
						botonCaja[i3]=nil
						botonCaja1[i3]=nil
						botonCaja2[i3]=nil
						carameloCaja[i3]:removeFromParent()
						carameloCaja[i3]=nil
						
					end
				end
			end ) 
		end
		--PONER LAS 3 CAJAS
		self.TotalAgarradas=TotalAgarradas
		botonCaja1={}
		botonCaja2={}
		botonCaja={}
		carameloCaja={}
		x=820
		y=150
		for i=1,3,1 do
			botonCaja1[i]=Bitmap.new(Texture.new('Recursos/MenuNiveles/nivelCaja'..i..'.png'))
			botonCaja2[i]=Bitmap.new(Texture.new('Recursos/MenuNiveles/nivelCaja'..i..'.png'))
			botonCaja1[i]:setAnchorPoint(0.5,0.5)
			botonCaja2[i]:setAnchorPoint(0.5,0.5)
			botonCaja1[i]:setScale(1.2,1.2)
			botonCaja2[i]:setScale(1.26,1.26)
			botonCaja[i] = Button.new(botonCaja1[i], botonCaja2[i])
			self:addChild(botonCaja[i])
			
			carameloCaja[i]=Bitmap.new(Texture.new('Recursos/Juego/p_'..i..'.png'))
			self:addChild(carameloCaja[i])
			carameloCaja[i]:setPosition(x,y)
			carameloCaja[i]:setAnchorPoint(0.5,0.5)
			
			
			if i==2 and TotalAgarradas<22 then
			candado=Bitmap.new(Texture.new('Recursos/MenuNiveles/candado.png'))
			self:addChild(candado)
			candado:setPosition(x,y-15)
			candado:setAnchorPoint(0.5,0.5)
			faltantesCaja2= TextField.new(fuente, TotalAgarradas.."/22")
			faltantesCaja2:setScale(0.66)
			local lcw=faltantesCaja2:getWidth()
			lcw=lcw/2
			local lch=faltantesCaja2:getHeight()
			lch=lch/2
			faltantesCaja2:setPosition(x-lcw,y+lch+35)
			faltantesCaja2:setTextColor(0xda5049)
			self:addChild(faltantesCaja2);
		
			end
			
			
			if i==3 and TotalAgarradas<45 then
				candado2=Bitmap.new(Texture.new('Recursos/MenuNiveles/candado.png'))
				self:addChild(candado2)
				candado2:setPosition(x,y-15)
				candado2:setAnchorPoint(0.5,0.5)
				faltantesCaja3= TextField.new(fuente, TotalAgarradas.."/45")
				faltantesCaja3:setScale(0.66)
				local lcw=faltantesCaja3:getWidth()
				lcw=lcw/2
				local lch=faltantesCaja3:getHeight()
				lch=lch/2
				faltantesCaja3:setPosition(x-lcw,y+lch+35)
				faltantesCaja3:setTextColor(0xda5049)
				self:addChild(faltantesCaja3);
			
			end
			
			botonCaja[i]:setPosition(x,y)
			
			y=y+140
			botonCaja[i]:addEventListener("click",
			function() 
			print(transicion)
			print(moviendoCaja)
			if transicion==false and moviendoCaja==false then
				--POOSICIONO
					scrollNiveles(i,caja,capturadasPorNivel,x_capturadasPorNivel,botonNivel,botonNivelY)
				--POOSICIONO
					print(i)
				
					if (i==1 and caja==1) or (i==2 and caja==2) or (i==3 and caja==3) then
						if dataSaver.loadValue("efectos")==1 then
					self.sonido:play()
					end
						return
					end
					
					if i==2 and TotalAgarradas<22 then
					if dataSaver.loadValue("efectos")==1 then
					self.error:play()
					end
					return
					end
					
					if i==3 and TotalAgarradas<45 then
					if dataSaver.loadValue("efectos")==1 then
					self.error:play()
					end
					return
					end
					
					moviendoCaja=true
					if dataSaver.loadValue("efectos")==1 then
					self.sonido:play()
					end
					print(i,caja)
					
					if i==1 and caja==2 then posicion=640-height end
					if i==1 and caja==3 then posicion=1280-height-height  end
					
					if i==2 and caja==1 then posicion=-640+height end
					if i==2 and caja==3 then posicion=640-height end
					
					if i==3 and caja==1 then posicion=-1280+height+height end
					if i==3 and caja==2 then posicion=-640+height end
					
					caja=i
					mc7={}
					mc5={}
					mc8={}

					for i=1,27,1 do
						local lch=numerosDeNiveles[i]:getHeight()
						lch=lch/2
						mc8[i]= MovieClip.new
						{{1, 75, numerosDeNiveles[i], {y = {botonNivelY[i]+lch,botonNivelY[i]+posicion+lch,"inOutSine" }}}}
						mc7[i]= MovieClip.new
						{{1, 75, capturadasPorNivel[i], {y = {botonNivelY[i],botonNivelY[i]+posicion,"inOutSine" }}}}
						mc5[i]= MovieClip.new
						{{1, 75, botonNivel[i], {y = {botonNivelY[i],botonNivelY[i]+posicion,"inOutSine" }}}}
						if i==27 then
						mc5[i]:addEventListener(Event.COMPLETE, 
						function()
						--TAMBIEN
						scrollNiveles(i,caja,capturadasPorNivel,x_capturadasPorNivel,botonNivel,botonNivelY)
						--TAMBIEN
							botonNivelY[i]=botonNivel[i]:getY()
							moviendoCaja=false
						end, mc5[i])
						end
					end
					
				end				
			end ) 
		end
		img1BotonMenuNivelesPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img2BotonMenuNivelesPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img1BotonMenuNivelesPrincipal:setScale(1,1)
		img2BotonMenuNivelesPrincipal:setScale(1.06,1.06)
		img1BotonMenuNivelesPrincipal:setAnchorPoint(0.5,0.5)
		img2BotonMenuNivelesPrincipal:setAnchorPoint(0.5,0.5)
		BotonMenuNivelesPrincipal = Button.new(img1BotonMenuNivelesPrincipal, img2BotonMenuNivelesPrincipal)
		self:addChild(BotonMenuNivelesPrincipal)
		BotonMenuNivelesPrincipal:setPosition(820	,550)
		BotonMenuNivelesPrincipal:addEventListener("click",
		function()
			if transicion==false and moviendoCaja==false then
				if dataSaver.loadValue("efectos")==1 then
					self.sonido:play()
				end
				transicion=true
				desde ="MenuNiveles"
				hasta="MenuPrincipal" 
		
				setObstaculos(self,desde,hasta,world)
				setearVariables(self)
			end
		end ) 

		estrellaTotalAgarradas=Bitmap.new(Texture.new('Recursos/Juego/estrella_03.png'))
		estrellaTotalAgarradas:setAnchorPoint(0.5,0.5)
		estrellaTotalAgarradas:setPosition(56,550)
		self:addChild(estrellaTotalAgarradas)
		labelTotalAgarradas = TextField.new(fuente, TotalAgarradas)
		labelTotalAgarradas:setScale(0.5)
		labelTotalAgarradas:setTextColor(0xffffff)
		lcw=labelTotalAgarradas:getWidth()
		lcw=lcw/2
		lch=labelTotalAgarradas:getHeight()
		lch=lch/2
		labelTotalAgarradas:setPosition(56-lcw,550+lch)
		self:addChild(labelTotalAgarradas)
		
	end
--//------------------------------------------------------------------ Menu CONFIG
	if hasta=="Config" then
			--banner:show()
		fondo:setTexture(Texture.new('Recursos/Fondos/bg_Config.jpg'))
		if desde=="MenuPrincipal" then
			self:removeChild(BotonMenuNiveles)
			self:removeChild(BotonMenuConfig)
			GatoMenuPrincipal:removeFromParent()
			GatoPataMenuPrincipal:removeFromParent()
		end
		if desde=="Config" then
			self:removeChild(BotonMenuConfigPrincipal)
			flag:removeFromParent()
			flag=nil

			for i=1,5,1 do
			botonesEnConfig[i]:removeFromParent()
			botonesEnConfig[i]=nil
			img1BotonesEnConfig[i] = nil
			img2BotonesEnConfig[i] =nil
			end
			checkMusica:removeFromParent()
			checkEfectos:removeFromParent()
			checkMusica=nil
			checkEfectos=nil
			if resetPresionado ==1 or resetPresionado==2 then
				mensajeReset:removeFromParent()
				mensajeReset=nil
			end
		end
		
		if desde=="Confirm" then
			for i=1,3,1 do
				BotonesEnConfirm[i]:removeFromParent()
				BotonesEnConfirm[i]=nil
				img1BotonesEnConfirm[i] = nil
				img2BotonesEnConfirm[i] =nil
			end

		end
		if desde=="About" then
			BotonMenuAboutPrincipal:removeFromParent()
			imgBy:removeFromParent()

		end
		resetPresionado=0


		img1BotonMenuConfigPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img2BotonMenuConfigPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img1BotonMenuConfigPrincipal:setScale(1,1)
		img2BotonMenuConfigPrincipal:setScale(1.06,1.06)
		img1BotonMenuConfigPrincipal:setAnchorPoint(0.5,0.5)
		img2BotonMenuConfigPrincipal:setAnchorPoint(0.5,0.5)
		BotonMenuConfigPrincipal = Button.new(img1BotonMenuConfigPrincipal, img2BotonMenuConfigPrincipal)
		self:addChild(BotonMenuConfigPrincipal)
		BotonMenuConfigPrincipal:setPosition(820	,550)
		BotonMenuConfigPrincipal:addEventListener("click",
		function()
			if transicion==false  then
				if dataSaver.loadValue("efectos")==1 then
				self.sonido:play()
				end
				transicion=true
				desde ="Config"
				hasta="MenuPrincipal" 
				setObstaculos(self,desde,hasta,world)
				setearVariables(self)
			end
		end ) 
		img1BotonesEnConfig={}
		img2BotonesEnConfig={}
		botonesEnConfig={}
		for i=1,5,1 do
			if i==1 then y=-180 str_boton="language_"..dataSaver.loadValue("idioma") end
			if i==2 then y=-90 str_boton="music_"..dataSaver.loadValue("idioma") end
			if i==3 then y=0 str_boton="effects_"..dataSaver.loadValue("idioma") end
			if i==4 then y=90 str_boton="aboutus_"..dataSaver.loadValue("idioma") end
			if i==5 then y=180 str_boton="reset_"..dataSaver.loadValue("idioma") end
			
			img1BotonesEnConfig[i] = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
			img2BotonesEnConfig[i]  = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
			img2BotonesEnConfig[i] :setScale(1.06,1.06)
			img1BotonesEnConfig[i] :setAnchorPoint(0.5,0.5)
			img2BotonesEnConfig[i] :setAnchorPoint(0.5,0.5)
			botonesEnConfig[i]  = Button.new(img1BotonesEnConfig[i], img2BotonesEnConfig[i])
			self:addChild(botonesEnConfig[i])
			botonesEnConfig[i]:setPosition(300	,320+y)
			if i==1 then 
				str_boton="flag_"..dataSaver.loadValue("idioma") 
				flag= Bitmap.new(Texture.new('Recursos/Otros/'..str_boton..'.png'))
				flag:setAnchorPoint(0.5,0.5)
				self:addChild(flag)
				flag:setPosition(660,320+y)
			end
			if i==2 then 
				str_boton="agree"..dataSaver.loadValue("musica")
				checkMusica= Bitmap.new(Texture.new('Recursos/Otros/'..str_boton..'.png'))
				checkMusica:setAnchorPoint(0.5,0.5)
				self:addChild(checkMusica)
				checkMusica:setPosition(660,320+y)
			end
			if i==3 then 
				str_boton="agree"..dataSaver.loadValue("efectos")
				checkEfectos= Bitmap.new(Texture.new('Recursos/Otros/'..str_boton..'.png'))
				checkEfectos:setAnchorPoint(0.5,0.5)
				self:addChild(checkEfectos)
				checkEfectos:setPosition(660,320+y)
			end
						
			botonesEnConfig[i]:addEventListener("click",
				function() 
				print(resetPresionado)
					if transicion==false then
						if dataSaver.loadValue("efectos")==1 then
						self.sonido:play()
						end
						if i==1 then -- -- -- -- -- -- -- -- -1
							if dataSaver.loadValue("idioma")=="es" then
								dataSaver.saveValue("idioma", "en")
							else
								dataSaver.saveValue("idioma", "es")
							end
							desde="Config"
							hasta="Config"
							setObstaculos(self,desde,hasta,world)
							setearVariables(self)
						end
						if i==5 then -- -- -- -- -- -- -- -- -2
						if transicion==false  then
								transicion=true
								desde ="Config"
								hasta="Confirm" 
								setObstaculos(self,desde,hasta,world)
								setearVariables(self)
							end
						end
				
						if i==4 then -- -- -- -- -- -- -- -- -3

							if transicion==false  then
								transicion=true
								desde ="Config"
								hasta="About" 
								setObstaculos(self,desde,hasta,world)
								setearVariables(self)
							end

						end
						if i==2 then -- -- -- -- -- -- -- -- -4
							if dataSaver.loadValue("musica")==1 then
								MusicaFondoChanel:stop()
								dataSaver.saveValue("musica", 0)
								MusicaFondoChanel:setVolume(0)
							else
								dataSaver.saveValue("musica", 1)
								MusicaFondoChanel=MusicaFondo:play()
								MusicaFondoChanel:setVolume(0.05)
							end
							str_boton="agree"..dataSaver.loadValue("musica")
							checkMusica:setTexture(Texture.new('Recursos/Otros/'..str_boton..'.png'))
						end
						if i==3 then -- -- -- -- -- -- -- -- -5
							if dataSaver.loadValue("efectos")==1 then
								dataSaver.saveValue("efectos", 0)
							else
								dataSaver.saveValue("efectos", 1)
							end
							str_boton="agree"..dataSaver.loadValue("efectos")
							checkEfectos:setTexture(Texture.new('Recursos/Otros/'..str_boton..'.png'))
						end
	
					end 

			end ) 
							
		end
	end
--//------------------------------------------------------------------ Menu Confirm Reset
if hasta=="Confirm" then
	banner:show()
	if desde=="Config" then
		self:removeChild(BotonMenuConfigPrincipal)
		for i=1,5,1 do
			botonesEnConfig[i]:removeFromParent()
			botonesEnConfig[i]=nil
			img1BotonesEnConfig[i] = nil
			img2BotonesEnConfig[i] =nil
		end
		flag:removeFromParent()
		flag=nil
		checkMusica:removeFromParent()
		checkEfectos:removeFromParent()
		checkMusica=nil
		checkEfectos=nil
		if resetPresionado ==1 or resetPresionado==2 then
			mensajeReset:removeFromParent()
			mensajeReset=nil
		end
	end

	img1BotonesEnConfirm={}
	img2BotonesEnConfirm={}
	BotonesEnConfirm={}
	for i=1,3,1 do
		if i==1 then y=-120 str_boton="reset_"..dataSaver.loadValue("idioma") end
		if i==2 then y=30 str_boton="confirm_"..dataSaver.loadValue("idioma") end
		if i==3 then y=120 str_boton="cancel_"..dataSaver.loadValue("idioma") end

		img1BotonesEnConfirm[i] = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
		img2BotonesEnConfirm[i]  = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
		if i==2 or i==3 then
		img2BotonesEnConfirm[i] :setScale(1.06,1.06)
		end
		img1BotonesEnConfirm[i] :setAnchorPoint(0.5,0.5)
		img2BotonesEnConfirm[i] :setAnchorPoint(0.5,0.5)
		BotonesEnConfirm[i]  = Button.new(img1BotonesEnConfirm[i], img2BotonesEnConfirm[i])
		self:addChild(BotonesEnConfirm[i])
		BotonesEnConfirm[i]:setPosition(480	,320+y)
		BotonesEnConfirm[i]:addEventListener("click",
			function() 
				if transicion==false and (i==2 or i==3)then
					if dataSaver.loadValue("efectos")==1 then
					self.sonido:play()
					end
					
					if i==2 then -- -- -- -- -- -- -- -- -2
						if transicion==false  then
							transicion=true
							print ("RESTART")
							for i=1,27,1 do
								dataSaver.saveValue("agarradas_en_nivel_"..i, 0)
							end
							desde ="Confirm"
							hasta="MenuPrincipal" 
							setObstaculos(self,desde,hasta,world)
							setearVariables(self)
						end
					end
					if i==3 then -- -- -- -- -- -- -- -- -3
					print(i)
						if transicion==false  then
						print(i)
							transicion=true
							desde ="Confirm"
							hasta="Config" 
							setObstaculos(self,desde,hasta,world)
							setearVariables(self)
						end
					end
				end 
		end)
	end
end
--//------------------------------------------------------------------ Menu About
	if hasta=="About" then
		banner:show()
		if desde=="Config" then
			self:removeChild(BotonMenuConfigPrincipal)
			for i=1,5,1 do
				botonesEnConfig[i]:removeFromParent()
				botonesEnConfig[i]=nil
				img1BotonesEnConfig[i] = nil
				img2BotonesEnConfig[i] =nil
			end

			flag:removeFromParent()
			flag=nil
			checkMusica:removeFromParent()
			checkEfectos:removeFromParent()
			checkMusica=nil
			checkEfectos=nil
			if resetPresionado ==1 or resetPresionado==2 then
				mensajeReset:removeFromParent()
				mensajeReset=nil
			end
		end
		imgBy=Bitmap.new(Texture.new('Recursos/Fondos/by_'..dataSaver.loadValue("idioma")..'.png'))
		imgBy:setAnchorPoint(0.5,0.5)
		imgBy:setPosition(480,330)
		self:addChild(imgBy)
		
		img1BotonMenuAboutPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img2BotonMenuAboutPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img1BotonMenuAboutPrincipal:setScale(1,1)
		img2BotonMenuAboutPrincipal:setScale(1.06,1.03)
		img1BotonMenuAboutPrincipal:setAnchorPoint(0.5,0.5)
		img2BotonMenuAboutPrincipal:setAnchorPoint(0.5,0.5)
		BotonMenuAboutPrincipal = Button.new(img1BotonMenuAboutPrincipal, img2BotonMenuAboutPrincipal)
		self:addChild(BotonMenuAboutPrincipal)
		BotonMenuAboutPrincipal:setPosition(820	,550)
		BotonMenuAboutPrincipal:addEventListener("click",
		function()
			if transicion==false  then
				if dataSaver.loadValue("efectos")==1 then
					self.sonido:play()
				end
				transicion=true
				desde ="About"
				hasta="Config" 
				setObstaculos(self,desde,hasta,world)
				setearVariables(self)
			end
		end ) 
		
		
	end
--//------------------------------------------------------------------ Botones En Juego
	if (hasta==1 or hasta==2 or hasta==3 or hasta==4 or hasta==5 or hasta==6 or hasta==7 or hasta==8 or hasta==9 or hasta==10 or hasta==11 or hasta==12 or hasta==13 or hasta==14 or hasta==15 or hasta==16 or hasta==17 or hasta==18 or hasta==19 or hasta==20 or hasta==21 or hasta==22 or hasta==23 or hasta==24 or hasta==25 or hasta==26 or hasta==27) and desde ~= hasta then
	
		if desde=="MenuNiveles" then
		BotonMenuNivelesPrincipal:removeFromParent()
			--self:removeChild(BotonMenuNivelesPrincipal)
				if candado ~= nil then
				candado:removeFromParent()
				faltantesCaja2:removeFromParent()
				end
				if candado2 ~= nil then
				candado2:removeFromParent()
				faltantesCaja3:removeFromParent()
				end
				if labelTotalAgarradas ~= nil then
					labelTotalAgarradas:removeFromParent()
					labelTotalAgarradas=nil
				end
				if estrellaTotalAgarradas ~= nil then
					estrellaTotalAgarradas:removeFromParent()
					estrellaTotalAgarradas=nil
				end
			
		end
	
		if dataSaver.loadValue("musica")==1 then
			if  MusicaJuegoChanel:isPlaying()==false   then
				MusicaJuegoChanel:setPosition(80)
				MusicaJuegoChanel:setVolume(0.05)
				MusicaJuegoChanel:setPaused(false)	
			end
		end
		labelLevel:setText(hasta)
		labelLevel:setVisible(true)
		caramelo:setVisible(true)
		imagenagarre:setVisible(true)
		play1 = Bitmap.new(Texture.new('Recursos/Otros/boton_menu01.png'))
		play2 = Bitmap.new(Texture.new('Recursos/Otros/boton_menu01.png'))
		play2:setScale(1.06,1.06)
		play1:setAnchorPoint(0.5,0.5)
		play2:setAnchorPoint(0.5,0.5)
		botonplay = Button.new(play1, play2)
		self:addChild(botonplay)
		botonplay:setPosition(800,55)

		reload1 = Bitmap.new(Texture.new('Recursos/Otros/reload_01.png'))
		reload2 = Bitmap.new(Texture.new('Recursos/Otros/reload_01.png'))
		reload1:setScale(1.06,1.06)
		reload2:setAnchorPoint(0.5,0.5)
		reload1:setAnchorPoint(0.5,0.5)
		reload2:setAnchorPoint(0.5,0.5)
		botonreload = Button.new(reload1, reload2)
		self:addChild(botonreload)
		botonreload:setPosition(900,55)
		botonplay:addEventListener("click",
			function() 
			print(stage.win)
			if stage.win==0 and transicion==false then
				if pause==false then
					if dataSaver.loadValue("efectos")==1 then
				self.sonido:play()
				end
					pause=true
					showBanner()
					--MORADA	0xd605ef
					layerNegraPause= Shape.new()
					layerNegraPause:setFillStyle(Shape.SOLID, 0x000000, 1)
					layerNegraPause:beginPath()
					layerNegraPause:moveTo(0,0)
					layerNegraPause:lineTo(960, 0)
					layerNegraPause:lineTo(960, 640)
					layerNegraPause:lineTo(0, 640)
					layerNegraPause:lineTo(0, 0)
					layerNegraPause:endPath()
					layerNegraPause:setPosition(0, 0)
					self:addChild(layerNegraPause)
					img1BotonesPause={}
					img2BotonesPause={}
					botonesPause={}
					for i=1,3,1 do
				
						if i==1 then y=-105 str_boton="resume_"..dataSaver.loadValue("idioma")  end
						if i==2 then y=0 str_boton="reload_"..dataSaver.loadValue("idioma")  end
						if i==3 then y=105 str_boton="mainmenu_"..dataSaver.loadValue("idioma")  end
						img1BotonesPause[i] = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
						img2BotonesPause[i]  = Bitmap.new(Texture.new('Recursos/BotonesTexto/'..str_boton..'.png'))
						img2BotonesPause[i] :setScale(1.06,1.06)
						img1BotonesPause[i] :setAnchorPoint(0.5,0.5)
						img2BotonesPause[i] :setAnchorPoint(0.5,0.5)
						botonesPause[i]  = Button.new(img1BotonesPause[i], img2BotonesPause[i])
						self:addChild(botonesPause[i])
						botonesPause[i]:setPosition(480	,320+y)
						botonesPause[i]:addEventListener("click",
						function() 
							if dataSaver.loadValue("efectos")==1 then
self.sonido:play()
end
							if i==1 then
							hideBanner()
								for j=1,3,1 do
									self:removeChild(botonesPause[j])
									pause=false
									
									layerNegraPause:removeFromParent()
								end
							end
							if i==2 then
								if transicion==false then
									for j=1,3,1 do
										self:removeChild(botonesPause[j])
										pause=false
										--layerNegraPause:removeFromParent()
										local mcLNR = MovieClip.new
										{{1, 5, layerNegraPause, {alpha = {0.75,0,"outSine" }}}}
										mcLNR:addEventListener(Event.COMPLETE, function()
										layerNegraPause:removeFromParent()
										end, mcLNR)
										
									end
									transicion=true
									for j=1,3,1 do
										estrella[j].body = estrellaBody[j]
									end
									borrarEstrellasBotones(self)
									setObstaculos(self,desde,hasta,world)
									setearVariables(self)
									if ultimotiro1~=nil then 
										local parent=ultimotiro1:getParent()
										if parent==self then 
											self:removeChild(ultimotiro1)
											self:removeChild(ultimotiro2)
										end
									end
									for j=1,3,1 do
										estrella[j]:setVisible(true)
									end
									x,y=caramelo.body:getPosition()
									imagenagarre:setPosition(x,y)
								end
							end
							if i==3 then
								if  MusicaJuegoChanel:isPlaying()==true   then
									MusicaJuegoChanel:setPaused(true)
								end
		
							
							
							
							
								for j=1,3,1 do
									self:removeChild(botonesPause[j])
									pause=false
									--layerNegraPause:removeFromParent()
									local mcLNM = MovieClip.new
										{{1, 5, layerNegraPause, {alpha = {0.75,0,"outSine" }}}}
										mcLNM:addEventListener(Event.COMPLETE, function()
										layerNegraPause:removeFromParent()
										end, mcLNM)
										
								end
								for i=1,3,1 do
									estrella[i].body = estrellaBody[i]
								end
								
								borrarEstrellasBotones(self)
								hasta="MenuNiveles"
								setObstaculos(self,desde,hasta,world)
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
								x,y=caramelo.body:getPosition()
								imagenagarre:setPosition(x,y)
							end
						end ) 
					end
					mcPause = MovieClip.new
					{{1, 15, layerNegraPause, {alpha = {0,0.75,"outSine" }}}}
				else
					pause=false
					hideBanner()
					self:removeChild(layerNegraPause)
					for i=1,3,1 do
						self:removeChild(botonesPause[i])
					end
				end
			end
		end)
	

		botonreload:addEventListener("click",
			function() 
				if transicion==false and pause==false then
					transicion=true
					if dataSaver.loadValue("efectos")==1 then
self.sonido:play()
end
					for i=1,3,1 do
						estrella[i].body = estrellaBody[i]
				
					end
					borrarEstrellasBotones(self)
					setObstaculos(self,desde,hasta,world)
					setearVariables(self)
					caramelo:setVisible(false)
					imagenagarre:setVisible(false)
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
					x,y=caramelo.body:getPosition()
					imagenagarre:setPosition(x,y)
				end
			end)
			estrella2={}
		for i = 1, 3, 1 do
			if i==1 then x=537 y=55 end
			if i==2 then x=587 y=55 end
			if i==3 then x=637 y=55 end
			estrella2[i] = Bitmap.new(Texture.new("Recursos/Juego/estrella_02.png"))
			estrella2[i]:setAnchorPoint(0.5,0.5)
			estrella2[i]:setPosition(x,y)
			self:addChild(estrella2[i])
		end
		meta[1]:agregarUpdate()
	end
--//------------------------------------------------------------------
	sumMovimiento1=0
	sumMovimiento2=0.1
	sumMovimiento3=0
	sumMovimiento4=0.1
		if hasta==1 or hasta==2 or hasta==3 or hasta==4 or hasta==5 or hasta==6 or hasta==7 or hasta==8 or hasta==9 then
			fondo:setTexture(Texture.new('Recursos/Fondos/bg_N1_N9.jpg'))
			caramelo:setTexture(Texture.new('Recursos/Juego/p_1.png'))
		end
		if hasta==10 or hasta==11 or hasta==12 or hasta==13 or hasta==14 or hasta==15 or hasta==16 or hasta==17 or hasta==18 then
			fondo:setTexture(Texture.new('Recursos/Fondos/bg_N10_N18.jpg'))
			caramelo:setTexture(Texture.new('Recursos/Juego/p_2.png'))
		end
		if  hasta==19 or hasta==20 or hasta==21 or hasta==22 or hasta==23 or hasta==24 or hasta==25 or hasta==26 or hasta==27 then
			fondo:setTexture(Texture.new('Recursos/Fondos/bg_N19_N27.jpg'))
			caramelo:setTexture(Texture.new('Recursos/Juego/p_3.png'))
		end
--//------------------------------------------------------------------ NIVEL 1
	if hasta==1 then
		for i = 1, 2, 1 do
			if i==1 then x=115*2 y=186 a=-25/360 as= -5 end
			if i==2 then x=204*2 y=540 a=80/360 as= 12 end
			obstaculoFixture[i]:setSensor(false)
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
		end
		for i = 1, 3, 1 do
			if i==1 then x=130*2 y=240 end
			if i==2 then x=222*2 y=460 end
			if i==3 then x=314*2 y=340 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(100,450)
		imagenagarre:setPosition(100,450)
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(764,500)
		end
	end
--//------------------------------------------------------------------ NIVEL 2	
	if hasta==2 then
		for i = 1, 4, 1 do
			if i==4 then x=122*2 y=244*2 a=47*(math.pi/180) end
			if i==3 then x=387*2 y=100*2 a=116*(math.pi/180) end
			if i==1 then x=466*2 y=226*2 a=123*(math.pi/180) end
			if i==2 then x=290*2 y=290*2 a=26*(math.pi/180) end
			obstaculoFixture[i]:setSensor(false)
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
		end
		for i = 1, 3, 1 do
			if i==1 then x=147*2 y=209*2 end
			if i==2 then x=310*2 y=175*2 end
			if i==3 then x=345*2 y=63*2 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(177*2,75*2)
		imagenagarre:setPosition(177*2,75*2)

		for i = 1, 2, 1 do
			metaBody[i]:setPosition(379*2,247*2)
		end
		
	end
--//------------------------------------------------------------------ NIVEL 3
	if hasta==3 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 3, 1 do
			if i==1 then x=740 y=420 a=135*(math.pi/180) end	
			if i==2 then x=257 y=420 a=45*(math.pi/180) end
			if i==3 then x=257	y=172 a=135*(math.pi/180) end	
			if i==4 then x=773 y=332 a=350*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=479 y=380 end
			if i==2 then x=289 y=401 end
			if i==3 then x=407 y=265 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(480,500)
		end
		carameloBody:setPosition(669,172)
		imagenagarre:setPosition(669,172)
	end
--//------------------------------------------------------------------ NIVEL 4
if hasta==4	 then
		sumMovimiento1=0
		sumMovimiento2=0.05
		sumMovimiento3=0
		sumMovimiento4=0.05
		for i = 1, 2,1 do
			if i==1 then x=350 y=170 a=90*(math.pi/180) end	
			if i==2 then x=550 y=470 a=15*(math.pi/180) end
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=489 y=175 end
			if i==2 then x=635 y=239 end
			if i==3 then x=721 y=331 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(810,441)
		end
		carameloBody:setPosition(161,214)
		imagenagarre:setPosition(161,214)
	end
--//------------------------------------------------------------------ NIVEL 5
	if hasta==5 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		sumMovimiento3=0
		sumMovimiento4=0.1
		for i = 1,1,1 do
			if i==1 then x=590 y=210 a=58*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=419 y=461 end
			if i==2 then x=597 y=363 end
			if i==3 then x=734 y=317 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(871,288)
		end
		carameloBody:setPosition(328,439)
		imagenagarre:setPosition(328,439)
	end
--//------------------------------------------------------------------ NIVEL 6
if hasta==6 then
		for i = 1, 3,1 do
			if i==1 then x=240 y=301 a=95*(math.pi/180) end	
			if i==2 then x=575 y=510 a=0*(math.pi/180) end
			if i==3 then x=780 y=265 a=125*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=324 y=372 end
			if i==2 then x=573 y=339 end
			if i==3 then x=756 y=208 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(314,502)
		end
		carameloBody:setPosition(134,335)
		imagenagarre:setPosition(134,335)
	end


--//------------------------------------------------------------------ NIVEL 7
if hasta==7	 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		sumMovimiento3=0
		sumMovimiento4=0.2
		sumMovimiento5=0
		sumMovimiento6=0.4
		for i = 1, 2,1 do
			if i==1 then x=838 y=237 a=95*(math.pi/180) end	
			if i==2 then x=123 y=193 a=85*(math.pi/180) end
			if i==3 then x=680 y=315 a=160*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=176 y=190 end
			if i==2 then x=473 y=143 end
			if i==3 then x=783 y=215 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(646,477)
		end
		carameloBody:setPosition(357,407)
		imagenagarre:setPosition(357,407)
	end
--//------------------------------------------------------------------ NIVEL 8
if hasta==8	 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 2,1 do
			if i==1 then x=719 y=532 a=150*(math.pi/180) end	
			if i==2 then x=99 y=343 a=85*(math.pi/180) end
			if i==3 then x=680 y=315 a=160*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=153 y=273 end
			if i==2 then x=694 y=489 end
			if i==3 then x=415 y=400 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(391,211)
		end
		carameloBody:setPosition(670,200)
		imagenagarre:setPosition(670,200)
	end




--//------------------------------------------------------------------ NIVEL 9
	if hasta==9 then
		for i = 1, 2, 1 do
			if i==1 then x=352 y=512 a=20*(math.pi/180) end
			if i==2 then x=654 y=178 a=175*(math.pi/180) end
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=402 y=456 end
			if i==2 then x=522 y=340 end
			if i==3 then x=670 y=232 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(172,426)
		imagenagarre:setPosition(172,426)

		for i = 1, 2, 1 do
			metaBody[i]:setPosition(834,404)
		end
	end

--//------------------------------------------------------------------ NIVEL 10
	if hasta==10	 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		sumMovimiento3=0
		sumMovimiento4=0.2
		sumMovimiento5=0
		sumMovimiento6=0.4
		for i = 1, 3, 1 do
			if i==1 then x=357 y=191 end
			if i==2 then x=267 y=392 end
			if i==3 then x=309 y=280 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(215,531)
		end
		carameloBody:setPosition(800,190)
		imagenagarre:setPosition(800,190)
	end

--//------------------------------------------------------------------ NIVEL 11
	if hasta==11 then
	for i = 1, 4, 1 do
		if i==1 then x=70*2 y=450 a=35*(math.pi/180) end
		if i==2 then x=300*2 y=450 a=135*(math.pi/180) end
		if i==3 then x=200*2 y=200 a=300*(math.pi/180) end
		if i==4 then x=450*2 y=268*2 a=331*(math.pi/180) end
		obstaculoFixture[i]:setSensor(false)
		obstaculoBody[i]:setPosition(x,y)
		obstaculoBody[i]:setAngle(a)
	end
	for i = 1, 3, 1 do
		if i==1 then x=478 y=460 end
		if i==2 then x=188 y=432 end
		if i==3 then x=176 y=264 end
		estrellaBody[i]:setPosition(x,y)
	end
	carameloBody:setPosition(353*2,137*2)
	imagenagarre:setPosition(353*2,137*2)
	for i = 1, 2, 1 do
		metaBody[i]:setPosition(185*2,500)
	end
end
--//------------------------------------------------------------------ NIVEL 12
	if hasta==12 then
		for i = 1, 4, 1 do
			if i==1 then x=840 y=320 a=90*(math.pi/180) end
			if i==2 then x=230 y=540 a=170*(math.pi/180) end	
			---if i==3 then x=315 y=200 a=90*(math.pi/180) end
			if i==4 then x=535 y=279 a=45*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=700 y=516 end
			if i==2 then x=346 y=155 end
			if i==3 then x=692 y=191 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(200,220)
		end
		carameloBody:setPosition(785,420)
		imagenagarre:setPosition(785,420)
	end
--//------------------------------------------------------------------ NIVEL 13
	if hasta==13 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		obstaculoBody[2]:setPosition(805,350)
		obstaculoFixture[2]:setSensor(false)
		obstaculoBody[2]:setAngle(17*(math.pi/180))
		obstaculoBody[1]:setPosition(604,521)
		obstaculoBody[1]:setAngle(90*(math.pi/180))
		obstaculoFixture[1]:setSensor(false)
		for i = 1, 3, 1 do
			if i==1 then x=234 y=228 end
			if i==2 then x=447 y=180 end
			if i==3 then x=628 y=199 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(785,564)
		end
		carameloBody:setPosition(480,452)
		imagenagarre:setPosition(480,452)
	end

--//------------------------------------------------------------------ NIVEL 14
	if hasta==14 then
		for i = 1, 3, 1 do
			if i==1 then x=746 y=230 a=50*(math.pi/180) end
			if i==2 then x=222*2 y=366 a=349*(math.pi/180) end
			if i==3 then x=55*2 y=290 a=86*(math.pi/180) end
					obstaculoFixture[i]:setSensor(false)
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
		end
		for i = 1, 3, 1 do
			if i==1 then x=462 y=152 end
			if i==2 then x=182 y=246 end
			if i==3 then x=366 y=310 end
			estrellaBody[i]:setPosition(x,y)
						--estrella[i].body=nil
		end
		carameloBody:setPosition(724,480)
		imagenagarre:setPosition(724,480)

		for i = 1, 2, 1 do
			metaBody[i]:setPosition(235,503)
		end
	end
--//------------------------------------------------------------------ NIVEL 15
	if hasta==15 then
		for i = 1, 4, 1 do
			if i==1 then x=100 y=300 a=90*(math.pi/180) end
			if i==2 then x=300 y=350 a=90*(math.pi/180) end	
			if i==3 then x=500 y=400 a=90*(math.pi/180) end
			if i==4 then x=700 y=450 a=90*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=300 y=180 end
			if i==2 then x=500 y=230 end
			if i==3 then x=700 y=280 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(858,483)
		end
		
		carameloBody:setPosition(190,411)
		imagenagarre:setPosition(190,411)
	end

--//------------------------------------------------------------------ NIVEL 16
	if hasta==16 then
		for i = 1, 3, 1 do
			if i==1 then x=480 y=140 a=0*(math.pi/180) end
			if i==2 then x=244 y=566 a=0*(math.pi/180) end	
			if i==3 then x=198 y=245 a=135*(math.pi/180) end
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=193 y=370 end
			if i==2 then x=244 y=490 end
			if i==3 then x=511 y=360 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(800,490)
		end
		carameloBody:setPosition(370,341)
		imagenagarre:setPosition(370,341)
	end
--//------------------------------------------------------------------ NIVEL 17
	if hasta==17 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		sumMovimiento3=0
		sumMovimiento4=0.1
		for i = 1, 3,1 do
			if i==1 then x=100 y=150 a=0*(math.pi/180) end	
			if i==2 then x=400 y=250 a=15*(math.pi/180) end
			if i==3 then x=300 y=350 a=350*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=362 y=188 end
			if i==2 then x=466 y=298 end
			if i==3 then x=570 y=408 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(600,532)
		end
		carameloBody:setPosition(782,402)
		imagenagarre:setPosition(782,402)
	end

--//------------------------------------------------------------------ NIVEL 18
	if hasta==18 then
		x=480 y=320
		obstaculoBody[1]:setPosition(x,y)
		obstaculoBody[2]:setPosition(x,y)
		obstaculoFixture[1]:setSensor(false)
		obstaculoFixture[2]:setSensor(false)
		obstaculoBody[2]:setAngle(90*(math.pi/180))
		for i = 1, 3, 1 do
			if i==1 then x=316 y=312 end
			if i==2 then x=494 y=246 end
			if i==3 then x=620 y=366 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(200,440)
		imagenagarre:setPosition(200,440)
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(690,524)
		end
	end
--//------------------------------------------------------------------ NIVEL 19
	if hasta==19 then
		obstaculoBody[6]:setPosition(182,506)
		obstaculoFixture[6]:setSensor(false)
		for i = 1, 3, 1 do
			if i==1 then x=294 y=382 end
			if i==2 then x=494 y=290 end
			if i==3 then x=690 y=382 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(490,150)
		imagenagarre:setPosition(490,150)
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(790,525)
		end
	end

--//------------------------------------------------------------------ NIVEL 20
	if hasta==20 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 3, 1 do
			if i==1 then x=740 y=188 a=0*(math.pi/180) end	
			if i==2 then x=374 y=250 a=0*(math.pi/180) end
			if i==3 then x=207	y=180 a=300*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=547 y=216 end
			if i==2 then x=325 y=318 end
			if i==3 then x=325 y=377 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(323,523)
		end
		carameloBody:setPosition(787,372)
		imagenagarre:setPosition(787,372)
	end
--//------------------------------------------------------------------ NIVEL 21
	if hasta==21 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 3, 1 do
			if i==1 then x=480 y=605 a=0*(math.pi/180) end
			if i==2 then x=127 y=528 a=45*(math.pi/180) end	
			if i==3 then x=480 y=320 a=25*(math.pi/180) end
			if i==4 then x=535 y=279 a=45*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=102 y=275 end
			if i==2 then x=508 y=308 end
			if i==3 then x=708 y=324 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(834,396)
		end
		carameloBody:setPosition(712,533)
		imagenagarre:setPosition(712,533)
	end

--//------------------------------------------------------------------ NIVEL 22
	if hasta==22 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 4, 1 do
			if i==1 then x=400 y=250 a=0*(math.pi/180) end
			if i==2 then x=620 y=250 a=0*(math.pi/180) end	
			if i==3 then x=193 y=367 a=0*(math.pi/180) end
			if i==4 then x=388 y=568 a=15*(math.pi/180) end	
			if i==5 then x=500 y=515 a=10*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=230 y=330 end
			if i==2 then x=413 y=477 end
			if i==3 then x=506 y=300 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(647,446)
		end
		carameloBody:setPosition(788,188)
		imagenagarre:setPosition(788,188)
	end


--//------------------------------------------------------------------ NIVEL 23
if hasta==23 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 2, 5, 1 do
			if i==2 then x=470 y=260 a=5*(math.pi/180) end	
			if i==3 then x=380 y=410 a=5*(math.pi/180) end	
			if i==4 then x=235 y=342 a=280*(math.pi/180) end	
			if i==5 then x=652 y=458 a=0*(math.pi/180) end
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=700 y=404 end
			if i==2 then x=471 y=204 end
			if i==3 then x=312 y=338 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(860,542)
		end
		carameloBody:setPosition(142,415)
		imagenagarre:setPosition(142,415)
	end
--//------------------------------------------------------------------ NIVEL 24
	if hasta==24 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 2, 1 do
			if i==1 then x=678 y=460 a=90*(math.pi/180) end
			if i==2 then x=440 y=140 a=90*(math.pi/180) end
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=610 y=124 end
			if i==2 then x=510 y=276 end
			if i==3 then x=610 y=410 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(172,326)
		imagenagarre:setPosition(172,326)
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(560,546)
		end
	end

--//------------------------------------------------------------------ NIVEL 25
	if hasta==25 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 6, 4, -1 do
			if i==6 then x=495 y=450 a=0*(math.pi/180) end	
			if i==5 then x=473 y=175 a=0*(math.pi/180) end
			if i==4 then x=724	y=297 a=300*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end	
		for i = 1, 3, 1 do
			if i==1 then x=471 y=334 end
			if i==2 then x=471 y=106 end
			if i==3 then x=677 y=267 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(198,552)
		end
		carameloBody:setPosition(150,347)
		imagenagarre:setPosition(150,347)
	end
--//------------------------------------------------------------------ NIVEL 26
	if hasta==26 then
		sumMovimiento2=0.015
		obstaculoBody[1]:setPosition(202,344)
		obstaculoBody[6]:setPosition(746,500)
		obstaculoFixture[1]:setSensor(false)
		obstaculoFixture[6]:setSensor(false)
		for i = 1, 3, 1 do
			if i==1 then x=591 y=327 end
			if i==2 then x=389 y=378 end
			if i==3 then x=485 y=185 end
			estrellaBody[i]:setPosition(x,y)
		end
		carameloBody:setPosition(200,468)
		imagenagarre:setPosition(200,468)
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(200,220)
		end
	end


--//------------------------------------------------------------------ NIVEL 27
	if hasta==27 then
		sumMovimiento1=0
		sumMovimiento2=0.1
		for i = 1, 4, 1 do
			if i==1 then x=380 y=240 a=75*(math.pi/180) end	
			if i==2 then x=580 y=240 a=105*(math.pi/180) end
			if i==3 then x=460 y=605 a=29*(math.pi/180) end	
			if i==4 then x=773 y=332 a=350*(math.pi/180) end	
			obstaculoBody[i]:setPosition(x,y)
			obstaculoBody[i]:setAngle(a)
			obstaculoFixture[i]:setSensor(false)
		end
		for i = 1, 3, 1 do
			if i==1 then x=764 y=280 end
			if i==2 then x=480 y=328 end
			if i==3 then x=480 y=502 end
			estrellaBody[i]:setPosition(x,y)
		end
		for i = 1, 2, 1 do
			metaBody[i]:setPosition(826,444)
		end
		carameloBody:setPosition(142,415)
		imagenagarre:setPosition(142,415)
	end






--//------------------------------------------------------------------ Nivel Creditos
if hasta=="Creditos" then

		carameloBody:setPosition(1060,-100)
		imagenagarre:setPosition(1060,-100)
		creditos=Bitmap.new(Texture.new("Recursos/Otros/creditos_"..dataSaver.loadValue("idioma") ..".png"))
		creditos:setAnchorPoint(0.5,0.5)
		creditos:setPosition(480,320)
		self:addChild(creditos)
		img1BotonCreditosPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img2BotonCreditosPrincipal = Bitmap.new(Texture.new('Recursos/Otros/boton_atr01.png'))
		img1BotonCreditosPrincipal:setScale(1,1)
		img2BotonCreditosPrincipal:setScale(1.06,1.03)
		img1BotonCreditosPrincipal:setAnchorPoint(0.5,0.5)
		img2BotonCreditosPrincipal:setAnchorPoint(0.5,0.5)
		BotonCreditosPrincipal = Button.new(img1BotonCreditosPrincipal, img2BotonCreditosPrincipal)
		self:addChild(BotonCreditosPrincipal)
		BotonCreditosPrincipal:setPosition(820	,550)
		BotonCreditosPrincipal:addEventListener("click",
		function()
			if transicion==false  then
				if dataSaver.loadValue("efectos")==1 then
					self.sonido:play()
				end
				if  MusicaJuegoChanel:isPlaying()==true   then
									MusicaJuegoChanel:setPaused(true)
				end
				transicion=true
				desde ="Creditos"
				hasta="MenuPrincipal" 
				setObstaculos(self,desde,hasta,world)
				setearVariables(self)
			end
		end ) 
		
end
--//------------------------------------------------------------------ FIN
	salidoDePantalla=false

	mc3 = MovieClip.new
	{{1, 10, cargando, {alpha = {1,0,"outSine" }}}}
	mc3 = MovieClip.new
	{{1, 10, loading, {alpha = {1,0,"outSine" }}}}
	mc4 = MovieClip.new
	{{1, 15, layerNegra, {alpha = {1,0,"outSine" }}}}
	mc4:addEventListener(Event.COMPLETE, function()
	cargando:removeFromParent()
	loading:removeFromParent()
	layerNegra:removeFromParent()
	dataSaver.saveValue("BDPerdiste", 0)
	BDPerdiste = dataSaver.loadValue("BDPerdiste")
	transicion=false
	
	end, mc4)
	end, mc2)
	end, mc1)
end


function borrarEstrellasBotones(self)
	if botonplay ~= nil then
	play1=nil
	play2=nil
	self:removeChild(botonplay)
	botonplay=nil
	reload1=nil
	reload2=nil
	self:removeChild(botonreload)
	botonreload=nil
	end
	for i = 1, 3, 1 do
	if estrella2[i] ~= nil then
		self:removeChild(estrella2[i])
		estrella2[i] = nil
	end
	end
			

end



function scrollNiveles(i,caja,capturadasPorNivel,x_capturadasPorNivel,botonNivel,botonNivelY)
	if caja==1 then 

		x1=160
		y1=180
		for k=1,27,1 do
		if k==10 then  y1=y1+164 end
		if k==19 then  y1=y1+164 end
			if k==4 or k==7  or k==10  or k==13  or k==16  or k==19 or k==22  or k==25  then
				y1=y1+140
				x1=160
			end	

			local lcw=numerosDeNiveles[k]:getWidth()
			lcw=lcw/2
			local lch=numerosDeNiveles[k]:getHeight()
			lch=lch/2
			numerosDeNiveles[k]:setPosition(x1-lcw,y1+lch)
			capturadasPorNivel[k]:setPosition(x_capturadasPorNivel[k],y1)
			botonNivel[k]:setPosition(x1,y1)

			botonNivelY[k]=y1
			x1=x1+200
		end
	end

	height=botonNivel[i]:getHeight()/2
	if caja==2 then 
		print("2")
		x1=160
		y1=180-640+height
		for k=1,27,1 do
		if k==10 then  y1=y1+164 end
		if k==19 then  y1=y1+164 end
			if k==4 or k==7  or k==10  or k==13  or k==16  or k==19 or k==22  or k==25  then
				y1=y1+140
				x1=160
			end	
			
				local lcw=numerosDeNiveles[k]:getWidth()
			lcw=lcw/2
			local lch=numerosDeNiveles[k]:getHeight()
			lch=lch/2
			numerosDeNiveles[k]:setPosition(x1-lcw,y1+lch)
		capturadasPorNivel[k]:setPosition(x_capturadasPorNivel[k],y1)
		botonNivel[k]:setPosition(x1,y1)
		botonNivelY[k]=y1
		x1=x1+200
		end
	end
	
	if caja==3 then 
		print("3")
		x1=160
		y1=180-1280+height+height
		for k=1,27,1 do
		if k==10 then  y1=y1+164 end
		if k==19 then  y1=y1+164 end
			if k==4 or k==7  or k==10  or k==13  or k==16  or k==19 or k==22  or k==25  then
			y1=y1+140
			x1=160
			end	
			
			local lcw=numerosDeNiveles[k]:getWidth()
			lcw=lcw/2
			local lch=numerosDeNiveles[k]:getHeight()
			lch=lch/2
			numerosDeNiveles[k]:setPosition(x1-lcw,y1+lch)
			capturadasPorNivel[k]:setPosition(x_capturadasPorNivel[k],y1)
			botonNivel[k]:setPosition(x1,y1)
			botonNivelY[k]=y1
			x1=x1+200
		end
	end
end



function reload_win(i,self,desde,hasta)

if transicion==false then
					transicion=true
					
					for i=1,3,1 do
						estrella[i].body = estrellaBody[i]
				
					end
					borrarEstrellasBotones(self)
					setObstaculos(self,desde,hasta,world)
					setearVariables(self)
					caramelo:setVisible(false)
					imagenagarre:setVisible(false)
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
					x,y=caramelo.body:getPosition()
					imagenagarre:setPosition(x,y)
				end
end