--- @sync entry
return {
	entry = function()
		local h = cx.active.current.hovered
		if h and h.cha.is_dir then
			ya.emit("enter", { hovered = true })
		elseif h and h:is_selected() then
			ya.emit("open", {})
		else
			ya.emit("open", { hovered = true })
		end
	end,
}
