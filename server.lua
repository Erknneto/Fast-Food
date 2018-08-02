local fastPosition = {
{2398.927734375,-1892.21875,13.3828125},
{2408.7802734375,-1485.974609375,23.828125},
{2095.3427734375,-1806.9208984375,13.551473617554},
{1222.2685546875,-920.46484375,42.911834716797},
{810.734375,-1631.7177734375,13.390567779541},
{-1911.3447265625,832.095703125,35.171875},
{2113.0751953125,2215.5830078125,10.8203125},
}

for i,pos in ipairs(fastPosition) do
	local x,y,z = pos[1],pos[2],pos[3]
	marker = createMarker(x,y,z-0.875,"cylinder",3,0,255,0)
	blip = createBlip(x,y,z,10)
	setElementData(marker,"fastfood",true)
	attachElements(blip,marker)
end

function buyFastFood (price,hp)
	if ( price and hp ) then
		if ( getPlayerMoney(client) >= price ) then
			setPlayerMoney(client,(getPlayerMoney(client)) -price)
			setElementHealth(client,(getElementHealth(client)) +hp)
		else
			outputChatBox("Você não tem dinheiro para comprar isso!",client,255,0,0)
		end
	else
		outputChatBox("Não foi possivel comprar isso!",client,255,0,0)
	end
end
addEvent("buyFastFood",true)
addEventHandler("buyFastFood",getRootElement(),buyFastFood)

function onFastFoodHit (element)
	if ( getElementType(element) == "player" ) then
		if ( getElementData(source,"fastfood") ) then
			triggerClientEvent(element,"enableFastFood",element)
		end
	end
end
addEventHandler("onMarkerHit",getRootElement(),onFastFoodHit)

function onFastFoodLeave (element)
	if ( getElementType(element) == "player" ) then
		if ( getElementData(source,"fastfood") ) then
			triggerClientEvent(element,"disableFastFood",element)
		end
	end
end
addEventHandler("onMarkerLeave",getRootElement(),onFastFoodLeave)