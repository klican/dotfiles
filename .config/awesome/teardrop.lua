---------------------------------------------------------------------------
-- Drop down (quake-like) applications for the awesome window manager
--   * Updated on: Aug 24, 14:53:50 CEST 2009
---------------------------------------------------------------------------
-- Original by: Lucas de Vries <lucas_glacicle_com>
--   * http://awesome.naquadah.org/wiki/Drop-down_terminal
-- 
-- Modified by: Adrian C. <anrxc_sysphere_org>
--   * Original code turned into a module
--   * Startup notification disabled
--   * Slides in from the bottom of the screen by default
-- 
-- Licensed under the WTFPL version 2
--   * http://sam.zoy.org/wtfpl/COPYING
---------------------------------------------------------------------------
-- To use this module add:
--     require("teardrop")
-- to the top of your rc.lua and call:
--     teardrop.toggle(prog, edge, height, screen)
-- from a keybinding. 
-- 
-- Parameters: 
--   prog     - Program to run, for example: "urxvt" or "gmrun"
--   edge     - Screen edge (optional), 1 to drop down from the top of the
--              screen, by default it slides in from the bottom
--   height   - Height (optional), in absolute pixels when > 1 or a height
--              percentage when < 1, 0.25 (25% of the screen) by default
--   screen   - Screen (optional)
---------------------------------------------------------------------------

-- Grab environment
local pairs = pairs
local awful = require("awful")
local capi = {
    mouse = mouse,
    client = client,
    screen = screen
}


-- Teardrop: Drop down (quake-like) applications for the awesome window manager
module("teardrop")


local dropdown = {}

-- Drop down (quake-like) application toggle
-- 
-- Create a new window for the drop-down application when it doesn't
-- exist, or toggle between hidden and visible states if one does
-- exist.
function toggle(prog, edge, height, screen)
    if screen == nil then screen = capi.mouse.screen end
    if height == nil then height = 0.25 end
    if edge   == nil then edge   = 0 end

    if not dropdown[prog] then
        -- Create table
        dropdown[prog] = {}

        -- Add unmanage hook for dropdown programs
        awful.hooks.unmanage.register(function (c)
            for scr, cl in pairs(dropdown[prog]) do
                if cl == c then
                    dropdown[prog][scr] = nil
                end
            end
        end)
    end

    if not dropdown[prog][screen] then
        spawnw = function (c)
            -- Store client
            dropdown[prog][screen] = c

            -- Float client
            awful.client.floating.set(c, true)

            -- Get screen geometry
            screengeom = capi.screen[screen].workarea

            -- Calculate height
            if height < 1 then
                height = screengeom.height * height
            end

            -- Screen edge
            if edge < 1 then
                -- Slide in from the bottom of the screen
                --   * screen height (resolution-wibox)+wibox size-term height
                screenedge = screengeom.height + screengeom.y - height
            else
                -- Drop down from the top of the screen
                --   * not covering the wibox
                --screenedge = screengeom.y
                --   * covering the wibox
                screenedge = screengeom.y - screengeom.y
            end

            -- Resize client
            c:geometry({
                x = screengeom.x,
                y = screenedge,
                width = screengeom.width,
                height = height
            })

            -- Mark application as ontop
            c.ontop = true
            c.above = true

            -- Focus and raise client
            c:raise()
            capi.client.focus = c

            -- Remove hook
            awful.hooks.manage.unregister(spawnw)
        end

        -- Add hook
        awful.hooks.manage.register(spawnw)

        -- Spawn program
        awful.util.spawn(prog, false)
    else
        -- Get client
        c = dropdown[prog][screen]

        -- Switch the client to the current workspace
        awful.client.movetotag(awful.tag.selected(screen), c)

        -- Focus and raise if not hidden
        if c.hide then
            c.hide = false
            c:raise()
            capi.client.focus = c
        else
            c.hide = true
        end
    end
end
