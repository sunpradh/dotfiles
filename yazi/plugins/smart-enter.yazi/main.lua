--- @sync entry
return {
	entry = function()
		local h = cx.active.current.hovered
		if h and h.cha.is_dir then
			ya.mgr_emit("enter", { hovered = true })
		elseif h and h:is_selected() then
			ya.mgr_emit("open", {})
		else
			ya.mgr_emit("open", { hovered = true })
		end
	end,
}
