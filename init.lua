--Spawn mod for Minetest
--Originally written by VanessaE (I think), rewritten by cheapie
--WTFPL

local spawn_spawnpos = minetest.setting_get_pos("static_spawnpoints3")

minetest.register_chatcommand("shops", {
	params = "",
	description = "Teleport to the Shops",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		if spawn_spawnpos then
			player:setpos(spawn_spawnpos)
			return true, "Teleporting to Shops..."
		else
			return false, "The spawn point is not set!"
		end
	end,
})

minetest.register_chatcommand("setspawns3", {
	params = "",
	description = "Sets the spawn point to your current position",
	privs = { server=true },
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		local pos = player:getpos()
		local x = pos.x
		local y = pos.y
		local z = pos.z
		local pos_string = x..","..y..","..z
		local pos_string_2 = "Setting spawn point to ("..x..", "..y..", "..z..")"
		minetest.setting_set("static_spawnpoint3",pos_string)
		spawn_spawnpos = pos
		minetest.setting_save()
		return true, pos_string_2
	end,
})
