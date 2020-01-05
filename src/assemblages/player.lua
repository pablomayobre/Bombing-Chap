local ImageSet = require("src.imageSet")

local imageSet = ImageSet(
	{
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f00.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f01.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f02.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f03.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f04.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f05.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f06.png"),
		love.graphics.newImage("assets/Bomberman/Back/Bman_B_f07.png"),
		flip = false,
	},
	{
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f00.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f01.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f02.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f03.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f04.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f05.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f06.png"),
		love.graphics.newImage("assets/Bomberman/Front/Bman_F_f07.png"),
		flip = false,
	},
	{
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f00.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f01.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f02.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f03.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f04.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f05.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f06.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f07.png"),
		flip = true,
	},
	{
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f00.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f01.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f02.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f03.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f04.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f05.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f06.png"),
		love.graphics.newImage("assets/Bomberman/Side/Bman_F_f07.png"),
		flip = false,
	},
	Vector(32, 96)
)

local Player = Assemblage(function(e, position)
	e
	:give(Components.position, Vector(position and position.x or 0, position and position.y or 0))
    :give(Components.controllable, Assemblages.bomb, true)
    :give(Components.facing, "down")
    :give(Components.texture, imageSet)
end)

return Player