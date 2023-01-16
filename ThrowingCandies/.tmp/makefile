LUAC = luac

all: .tmp/scenemanager.lua.bin .tmp/button.lua.bin .tmp/dataServer.lua.bin .tmp/gato1.lua.bin .tmp/gato4.lua.bin .tmp/gato2.lua.bin .tmp/gato3.lua.bin .tmp/gatoMP.lua.bin .tmp/pataMP.lua.bin .tmp/niveles.lua.bin .tmp/Juego.lua.bin .tmp/main.lua.bin

.tmp/scenemanager.lua.bin: Clases/scenemanager.lua
	$(LUAC) -o ".tmp/scenemanager.lua.bin" "Clases/scenemanager.lua"

.tmp/button.lua.bin: Clases/button.lua
	$(LUAC) -o ".tmp/button.lua.bin" "Clases/button.lua"

.tmp/dataServer.lua.bin: Clases/dataServer.lua
	$(LUAC) -o ".tmp/dataServer.lua.bin" "Clases/dataServer.lua"

.tmp/gato1.lua.bin: Animacion/gato1.lua
	$(LUAC) -o ".tmp/gato1.lua.bin" "Animacion/gato1.lua"

.tmp/gato4.lua.bin: Animacion/gato4.lua
	$(LUAC) -o ".tmp/gato4.lua.bin" "Animacion/gato4.lua"

.tmp/gato2.lua.bin: Animacion/gato2.lua
	$(LUAC) -o ".tmp/gato2.lua.bin" "Animacion/gato2.lua"

.tmp/gato3.lua.bin: Animacion/gato3.lua
	$(LUAC) -o ".tmp/gato3.lua.bin" "Animacion/gato3.lua"

.tmp/gatoMP.lua.bin: Animacion/gatoMP.lua
	$(LUAC) -o ".tmp/gatoMP.lua.bin" "Animacion/gatoMP.lua"

.tmp/pataMP.lua.bin: Animacion/pataMP.lua
	$(LUAC) -o ".tmp/pataMP.lua.bin" "Animacion/pataMP.lua"

.tmp/niveles.lua.bin: niveles.lua
	$(LUAC) -o ".tmp/niveles.lua.bin" "niveles.lua"

.tmp/Juego.lua.bin: Juego.lua
	$(LUAC) -o ".tmp/Juego.lua.bin" "Juego.lua"

.tmp/main.lua.bin: main.lua
	$(LUAC) -o ".tmp/main.lua.bin" "main.lua"

