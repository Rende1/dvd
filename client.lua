local screenW, screenH  = guiGetScreenSize()

getRandomColor = function ()
    return tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255), 255)
end

local logo = {
	path = "logo.png",
	w = 150,
	h = 86,
	speed = math.random(1, 5),
}

logo.list = {
	[1] = {
		speedX = logo.speed,
		speedY = logo.speed,
		color = getRandomColor(),
		x = 0,
		y = 0,

		zone = {x = 0, y = 0, w = screenW/2, h = screenH, color = getRandomColor()},
	},
	[2] = {
		speedX = logo.speed,
		speedY = logo.speed,
		color = getRandomColor(),
		x = 0,
		y = 0,

		zone = {x = screenW/2, y = 0, w = screenW/2, h = screenH, color = getRandomColor()},
	},
}

for _,data in pairs(logo.list) do
	data.x = math.random(0, data.zone.w-logo.w)
	data.y = math.random(0, data.zone.h-logo.h)
end

addEventHandler("onClientRender", root, function ()
	for _,data in pairs(logo.list) do
		local zone = data.zone

		data.x = data.x + data.speedX
		data.y = data.y + data.speedY

		if data.x > zone.w - logo.w then
			data.x = zone.w - logo.w
			data.speedX = -logo.speed
			data.color = getRandomColor()
		elseif data.x < 0 then
			data.x = 0
			data.speedX = logo.speed
			data.color = getRandomColor()
		elseif data.y > zone.h - logo.h then
			data.y = zone.h - logo.h
			data.speedY = -logo.speed
			data.color = getRandomColor()
		elseif data.y < 0 then
			data.y = 0
			data.speedY = logo.speed
			data.color = getRandomColor()
		end

		dxDrawRectangle(zone.x, zone.y, zone.w, zone.h, zone.color)
	    dxDrawImage(data.x+zone.x, data.y+zone.y, logo.w, logo.h, logo.path, 0, 0, 0, data.color)
	end
end)
