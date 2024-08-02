-- minimalist_speedometer1

menu.register_callback("OnScriptsLoaded", function()
    local t = {
        km = 3.6,
        mm = 2.23694,
        m = true,
        r = false,
        d = "",
        v = function(p) return p:get_velocity() end,
        f = string.format,
        s = sleep,
        --[[F2]]speedometerToggle = menu.register_hotkey(113, function() t.r = not t.r end),
        --[[F3]]metricToggle = menu.register_hotkey(114, function() t.m = not t.m end)
    }
    while true do
        if localplayer == nil then return end
        if t.r then
            local p = localplayer
            if p:is_in_vehicle() then
                local v = p:get_current_vehicle()
                local ms = t.v(v)
                if t.m then
                    local kph = ms * t.km
                    t.d = t.f("%3s KPH", kph)
                else
                    local mph = ms * t.mm
                    t.d = t.f("%3s MPH", mph)
                end
                v:set_plate_text(t.d)
            else
                local ms = t.v(p)
                if t.m then
                    local kph = ms * t.km
                    t.d = t.f("%3s KPH", kph)
                else
                    local mph = ms * t.mm
                    t.d = t.f("%3s MPH", mph)
                end
                print("Current Speed: " .. t.d)
            end
            t.s(0.025)
        else
            t.s(1)
        end
    end
end)
