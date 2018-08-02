local sx,sy = guiGetScreenSize()
local px,py = 1366,768
local x,y = (sx/px),(sy/py)
fastFont = dxCreateFont("fonts/fast_food.ttf",14)

function isMouseInPosition (x,y,width,height)
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

local fastList = {
-- Lanche / Preço / HP recuperado ao comer
-- AVISO: Só edite caso saiba o que está fazendo
-- AVISO: Não edite o nome do lanche, apenas o preço ou o HP que recupera ao comprar
{"Hamburger",17,40},
{"Pizza",55,60},
{"Fritas",15,30},
{"Refrigerante",10,40},
}

function getFastData (name)
	for i,data in ipairs(fastList) do
		if ( data[1] == name ) then
			return data[2],data[3]
		end
	end
	return false
end

function drawFastFood ()
	if ( getElementData(localPlayer,"inFast") ) then
		dxDrawRectangle(x*370,y*200, x*600, y*300, tocolor(0, 0, 0, 170), true)
		dxDrawRectangle(x*400,y*350, x*100, y*100, tocolor(0, 0, 0, 200), true)
		dxDrawRectangle(x*545,y*350, x*100, y*100, tocolor(0, 0, 0, 200), true)
		dxDrawRectangle(x*690,y*350, x*100, y*100, tocolor(0, 0, 0, 200), true)
		dxDrawRectangle(x*835,y*350, x*100, y*100, tocolor(0, 0, 0, 200), true)
		dxDrawRectangle(x*860,y*210, x*100, y*30, tocolor(0, 0, 0, 200), true)
		dxDrawImage(x*620, y*210, x*120, y*120,"images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*400,y*350, x*100, y*100,"images/burger.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*545,y*350, x*100, y*100,"images/pizza.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*690,y*350, x*100, y*100,"images/fries.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*835,y*350, x*100, y*100,"images/soda.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawText("Cancelar", x*870, y*215, x*10, y*10, tocolor(255, 255, 255, 255), 1, fastFont,"left","top", false, false, true, false, false)
		if ( isMouseInPosition(x*400,y*350, x*100, y*100) ) then
			local name = "Hamburger"
			local price,hp = getFastData(name)
			dxDrawText(name, x*400, y*240, x*10, y*10, tocolor(255, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText("R$ "..tostring(price)..",00", x*400, y*270, x*10, y*10, tocolor(0, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText(tostring(hp).." HP", x*400, y*300, x*10, y*10, tocolor(255, 0, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawRectangle(x*400,y*350, x*100, y*100, tocolor(255, 255, 255, 120), true)
		elseif ( isMouseInPosition(x*545,y*350, x*100, y*100) ) then
			local name = "Pizza"
			local price,hp = getFastData(name)
			dxDrawText(name, x*400, y*240, x*10, y*10, tocolor(255, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText("R$ "..tostring(price)..",00", x*400, y*270, x*10, y*10, tocolor(0, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText(tostring(hp).." HP", x*400, y*300, x*10, y*10, tocolor(255, 0, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawRectangle(x*545,y*350, x*100, y*100, tocolor(255, 255, 255, 120), true)
		elseif ( isMouseInPosition(x*690,y*350, x*100, y*100) ) then
			local name = "Fritas"
			local price,hp = getFastData(name)
			dxDrawText(name, x*400, y*240, x*10, y*10, tocolor(255, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText("R$ "..tostring(price)..",00", x*400, y*270, x*10, y*10, tocolor(0, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText(tostring(hp).." HP", x*400, y*300, x*10, y*10, tocolor(255, 0, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawRectangle(x*690,y*350, x*100, y*100, tocolor(255, 255, 255, 120), true)
		elseif ( isMouseInPosition(x*835,y*350, x*100, y*100) ) then
			local name = "Refrigerante"
			local price,hp = getFastData(name)
			dxDrawText(name, x*400, y*240, x*10, y*10, tocolor(255, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText("R$ "..tostring(price)..",00", x*400, y*270, x*10, y*10, tocolor(0, 255, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawText(tostring(hp).." HP", x*400, y*300, x*10, y*10, tocolor(255, 0, 0, 255), 1, fastFont,"left","top", false, false, true, false, false)
			dxDrawRectangle(x*835,y*350, x*100, y*100, tocolor(255, 255, 255, 120), true)
		elseif ( isMouseInPosition(x*860,y*210, x*100, y*30) ) then
			dxDrawRectangle(x*860,y*210, x*100, y*30, tocolor(255, 255, 255, 120), true)
		end
	end
end

function fastClick (btn,state)
	if ( getElementData(localPlayer,"inFast") ) then
		if ( btn == "left" ) and ( state == "down" ) then
			if ( isMouseInPosition(x*400,y*350, x*100, y*100) ) then
				local price,hp = getFastData("Hamburger")
				triggerServerEvent("buyFastFood",localPlayer,price,hp)
			elseif ( isMouseInPosition(x*545,y*350, x*100, y*100) ) then
				local price,hp = getFastData("Pizza")
				triggerServerEvent("buyFastFood",localPlayer,price,hp)
			elseif ( isMouseInPosition(x*690,y*350, x*100, y*100) ) then
				local price,hp = getFastData("Fritas")
				triggerServerEvent("buyFastFood",localPlayer,price,hp)
			elseif ( isMouseInPosition(x*835,y*350, x*100, y*100) ) then
				local price,hp = getFastData("Refrigerante")
				triggerServerEvent("buyFastFood",localPlayer,price,hp)
			elseif ( isMouseInPosition(x*860,y*210, x*100, y*30) ) then
				disableFastFood()
			end
		end
	end
end

function enableFastFood ()
	setElementData(localPlayer,"inFast",true)
	addEventHandler("onClientRender",getRootElement(),drawFastFood)
	addEventHandler("onClientClick",getRootElement(),fastClick)
	showCursor(true)
end
addEvent("enableFastFood",true)
addEventHandler("enableFastFood",getRootElement(),enableFastFood)

function disableFastFood ()
	setElementData(localPlayer,"inFast",false)
	removeEventHandler("onClientRender",getRootElement(),drawFastFood)
	removeEventHandler("onClientClick",getRootElement(),fastClick)
	showCursor(false)
end
addEvent("disableFastFood",true)
addEventHandler("disableFastFood",getRootElement(),disableFastFood)