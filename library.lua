--[[

    please see DOCS.md
    made by @nulare on discord :)

]]

UILib = {
    _font_face = Drawing.Fonts.UI,
    _font_size = 13,
    _drawings = {},
    _tree = {},
    _menu_open = true,
    _menu_toggled_at = 0,
    _watermark_enabled = true,
    _notifications = {},
    _notifications_spawned = 0,
    _open_tab = nil,
    _tab_change_at = 0,
    _inputs = {['m1']={id=0x01,held=false,click=false},['m2']={id=0x02,held=false,click=false},['mb']={id=0x04,held=false,click=false},['unbound']={id=0x08,held=false,click=false},['tab']={id=0x09,held=false,click=false},['enter']={id=0x0D,held=false,click=false},['shift']={id=0x10,held=false,click=false},['ctrl']={id=0x11,held=false,click=false},['alt']={id=0x12,held=false,click=false},['pause']={id=0x13,held=false,click=false},['capslock']={id=0x14,held=false,click=false},['esc']={id=0x1B,held=false,click=false},['space']={id=0x20,held=false,click=false},['pageup']={id=0x21,held=false,click=false},['pagedown']={id=0x22,held=false,click=false},['end']={id=0x23,held=false,click=false},['home']={id=0x24,held=false,click=false},['left']={id=0x25,held=false,click=false},['up']={id=0x26,held=false,click=false},['right']={id=0x27,held=false,click=false},['down']={id=0x28,held=false,click=false},['insert']={id=0x2D,held=false,click=false},['delete']={id=0x2E,held=false,click=false},['0']={id=0x30,held=false,click=false},['1']={id=0x31,held=false,click=false},['2']={id=0x32,held=false,click=false},['3']={id=0x33,held=false,click=false},['4']={id=0x34,held=false,click=false},['5']={id=0x35,held=false,click=false},['6']={id=0x36,held=false,click=false},['7']={id=0x37,held=false,click=false},['8']={id=0x38,held=false,click=false},['9']={id=0x39,held=false,click=false},['a']={id=0x41,held=false,click=false},['b']={id=0x42,held=false,click=false},['c']={id=0x43,held=false,click=false},['d']={id=0x44,held=false,click=false},['e']={id=0x45,held=false,click=false},['f']={id=0x46,held=false,click=false},['g']={id=0x47,held=false,click=false},['h']={id=0x48,held=false,click=false},['i']={id=0x49,held=false,click=false},['j']={id=0x4A,held=false,click=false},['k']={id=0x4B,held=false,click=false},['l']={id=0x4C,held=false,click=false},['m']={id=0x4D,held=false,click=false},['n']={id=0x4E,held=false,click=false},['o']={id=0x4F,held=false,click=false},['p']={id=0x50,held=false,click=false},['q']={id=0x51,held=false,click=false},['r']={id=0x52,held=false,click=false},['s']={id=0x53,held=false,click=false},['t']={id=0x54,held=false,click=false},['u']={id=0x55,held=false,click=false},['v']={id=0x56,held=false,click=false},['w']={id=0x57,held=false,click=false},['x']={id=0x58,held=false,click=false},['y']={id=0x59,held=false,click=false},['z']={id=0x5A,held=false,click=false},['numpad0']={id=0x60,held=false,click=false},['numpad1']={id=0x61,held=false,click=false},['numpad2']={id=0x62,held=false,click=false},['numpad3']={id=0x63,held=false,click=false},['numpad4']={id=0x64,held=false,click=false},['numpad5']={id=0x65,held=false,click=false},['numpad6']={id=0x66,held=false,click=false},['numpad7']={id=0x67,held=false,click=false},['numpad8']={id=0x68,held=false,click=false},['numpad9']={id=0x69,held=false,click=false},['multiply']={id=0x6A,held=false,click=false},['add']={id=0x6B,held=false,click=false},['separator']={id=0x6C,held=false,click=false},['subtract']={id=0x6D,held=false,click=false},['decimal']={id=0x6E,held=false,click=false},['divide']={id=0x6F,held=false,click=false},['f1']={id=0x70,held=false,click=false},['f2']={id=0x71,held=false,click=false},['f3']={id=0x72,held=false,click=false},['f4']={id=0x73,held=false,click=false},['f5']={id=0x74,held=false,click=false},['f6']={id=0x75,held=false,click=false},['f7']={id=0x76,held=false,click=false},['f8']={id=0x77,held=false,click=false},['f9']={id=0x78,held=false,click=false},['f10']={id=0x79,held=false,click=false},['f11']={id=0x7A,held=false,click=false},['f12']={id=0x7B,held=false,click=false},['numlock']={id=0x90,held=false,click=false},['scrolllock']={id=0x91,held=false,click=false},['lshift']={id=0xA0,held=false,click=false},['rshift']={id=0xA1,held=false,click=false},['lctrl']={id=0xA2,held=false,click=false},['rctrl']={id=0xA3,held=false,click=false},['lalt']={id=0xA4,held=false,click=false},['ralt']={id=0xA5,held=false,click=false},['semicolon']={id=0xBA,held=false,click=false},['plus']={id=0xBB,held=false,click=false},['comma']={id=0xBC,held=false,click=false},['minus']={id=0xBD,held=false,click=false},['period']={id=0xBE,held=false,click=false},['slash']={id=0xBF,held=false,click=false},['tilde']={id=0xC0,held=false,click=false},['lbracket']={id=0xDB,held=false,click=false},['backslash']={id=0xDC,held=false,click=false},['rbracket']={id=0xDD,held=false,click=false},['quote']={id=0xDE,held=false,click=false}},
    _slider_drag = nil,
    _menu_drag = nil,
    _overwrite_menu_key = false,
    _menu_key = 'f1',
    _active_dropdown = nil,
    _active_colorpicker = nil,
    _copied_color = nil,

    title = 'My menu',
    w = 400,
    h = 480,
    x = 20,
    y = 100,
    _padding = 8,
    _tab_h = 40,
    _theming = {
        accent = Color3.fromRGB(0, 128, 255),
        body = Color3.fromRGB(5, 5, 5),
        text = Color3.fromRGB(255, 255, 255),
        subtext = Color3.fromRGB(120, 120, 120),
        border1 = Color3.fromRGB(40, 40, 40),
        border0 = Color3.fromRGB(32, 32, 32),
        surface1 = Color3.fromRGB(42, 42, 42),
        surface0 = Color3.fromRGB(24, 24, 24),
        crust = Color3.fromRGB(0, 0, 0),
    },
}

local function clamp(x, a, b)
    if x > b then
        return b
    elseif x < a then
        return a
    else
        return x
    end
end

local function getDictLength(dict)
    local i = 0
    for _ in pairs(dict) do
        i = i + 1
    end
    return i
end

local function rgbToHsv(r, g, b)
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, v = 0, 0, max
    local d = max - min

    if max ~= 0 then
        s = d / max
    end

    if d == 0 then
        h = 0
    else
        if max == r then
            h = (g - b) / d
            if g < b then
                h = h + 6
            end
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    return h, s, v
end

do
    function UILib:_KeyIDToName(keyId)
        for keyName, key in pairs(self._inputs) do
            if key.id == keyId then
                return keyName
            end
        end

        return nil
    end

    function UILib:_IsKeyPressed(keycode)
        return self._inputs[keycode].click
    end

    function UILib:_IsKeyHeld(keycode)
        return self._inputs[keycode].held
    end

    function UILib:_GetScreenSize()
        local screenSize = Vector2.new(1920, 1080)

        local camera = workspace.CurrentCamera
        if camera and camera.ViewportSize then
            screenSize = camera.ViewportSize
        end

        return screenSize
    end

    function UILib:_GetMousePos()
        local mousePos = Vector2.new()

        local myPlayer = game:GetService('Players').LocalPlayer
        if myPlayer then
            local myMouse = myPlayer:GetMouse()
            if myMouse then
                mousePos = Vector2.new(myMouse.X, myMouse.Y) 
            end
        end

        return mousePos
    end

    function UILib:_IsMouseWithinBounds(origin, size)
        local mousePos = self:_GetMousePos()
        return mousePos.x >= origin.x and mousePos.x <= origin.x + size.x and mousePos.y >= origin.y and mousePos.y <= origin.y + size.y
    end
end

do
    function UILib:_GetTextBounds(text, fontFace, fontSize)
        fontFace = fontFace or self._font_face
        fontSize = fontSize or self._font_size

        if fontFace == Drawing.Fonts.UI then
            return Vector2.new(#text * fontSize * 0.53846, fontSize)
        end

        return Vector2.new(#text * fontSize, fontSize)
    end

    function UILib:_Lerp(a, b, t)
        return a + (b - a) * t
    end

    function UILib:_Draw(drawId, drawType, drawColor, drawZIndex, ...)
        local draw = self._drawings[drawId]

        if drawType == 'rect' then
            if not draw then
                self._drawings[drawId] = Drawing.new('Square')
                return self:_Draw(drawId, drawType, drawColor, drawZIndex, ...)
            end

            local rectPosition, rectSize, rectFilled = ...

            draw.Position = rectPosition
            draw.Size = rectSize
            draw.Filled = rectFilled
        elseif drawType == 'text' then
            if not draw then
                self._drawings[drawId] = Drawing.new('Text')
                return self:_Draw(drawId, drawType, drawColor, drawZIndex, ...)
            end

            local textPosition, textContent, textOutline, textAlign, textSize, textFontFace = ...

            
            if textAlign == 'center' then
                draw.Center = true
                draw.Position = textPosition
            elseif textAlign == 'right' then

            else
                draw.Position = textPosition
            end

            draw.Text = textContent
            draw.Outline = textOutline
            draw.Font = textFontFace or self._font_face
            draw.Size = textSize or self._font_size
        elseif drawType == 'line' then
            if not draw then
                self._drawings[drawId] = Drawing.new('Line')
                return self:_Draw(drawId, drawType, drawColor, drawZIndex, ...)
            end

            local lineFrom, lineTo, lineThickness = ...

            draw.From = lineFrom
            draw.To = lineTo
            draw.Filled = lineThickness or 1
        elseif drawType == 'triangle' then
            if not draw then
                self._drawings[drawId] = Drawing.new('Triangle')
                return self:_Draw(drawId, drawType, drawColor, drawZIndex, ...)
            end

            local triangleFilled, trianglePointA, trianglePointB, trianglePointC = ...

            draw.Filled = triangleFilled
            draw.PointA = trianglePointA
            draw.PointB = trianglePointB
            draw.PointC = trianglePointC
        elseif drawType == 'gradient' then
            local args = {...}

            if #args == 4 then
                local firstColor = args[4]
                local tintColor = self._theming.crust

                table.insert(args, Color3.new(
                    self:_Lerp(firstColor.R, tintColor.R, 0.5),
                    self:_Lerp(firstColor.G, tintColor.G, 0.5),
                    self:_Lerp(firstColor.B, tintColor.B, 0.5)
                ))
            end

            local gradientDirection = args[1]
            local gradientOrigin = args[2]
            local gradientSize = args[3]

            local numSegments = (#args - 3) - 1
            local lod = 26

            for i = 4, #args-1 do
                local currentColor = args[i]
                local nextColor = args[i+1]

                local segmentLengthX = gradientSize.x / numSegments
                local segmentLengthY = gradientSize.y / numSegments

                for j = 1, lod do
                    local t = (j-1) / (lod-1)
                    local targetColor = Color3.new(
                        self:_Lerp(currentColor.R, nextColor.R, t),
                        self:_Lerp(currentColor.G, nextColor.G, t),
                        self:_Lerp(currentColor.B, nextColor.B, t)
                    )

                    local targetAlpha = self:_Lerp(currentColor.A or 1, nextColor.A or 1, t)

                    local segmentPosition, segmentSize
                    if gradientDirection == 'horizontal' then
                        segmentSize = Vector2.new(segmentLengthX / lod, gradientSize.y)
                        segmentPosition = Vector2.new(
                            gradientOrigin.x + (i-4) * segmentLengthX + (j-1) * segmentSize.x,
                            gradientOrigin.y
                        )
                    elseif gradientDirection == 'vertical' then
                        segmentSize = Vector2.new(gradientSize.x, segmentLengthY / lod)
                        segmentPosition = Vector2.new(
                            gradientOrigin.x,
                            gradientOrigin.y + (i-4) * segmentLengthY + (j-1) * segmentSize.y
                        )
                    end

                    local segmentDrawId = drawId .. '_' .. tostring(i) .. '_' .. tostring(j)
                    self:_Draw(segmentDrawId, 'rect', targetColor, drawZIndex, segmentPosition, segmentSize, true)
                    self:_SetOpacity(segmentDrawId, targetAlpha)
                end
            end

            return
        end

        draw.Color = drawColor
        draw.ZIndex = drawZIndex
        draw.Visible = true
    end

    function UILib:_RemoveDraw(drawId)
        local drawObject = self._drawings[drawId]
        if drawObject then
            drawObject:Remove()
        end
    end

    function UILib:_Undraw(drawId)
        local drawObject = self._drawings[drawId]
        if drawObject then
            drawObject.Visible = false
        end
    end

    function UILib:_SetOpacity(drawId, opacity)
        local drawObject = self._drawings[drawId]
        if drawObject then
            drawObject.Transparency = opacity
        end
    end

    function UILib:_RemoveDrawStartsWith(drawId)
        for drawName, _drawObject in pairs(self._drawings) do
            if drawName:sub(1, #drawId) == drawId then
                UILib:_RemoveDraw(drawName)
            end
        end
    end

    function UILib:_UndrawStartsWith(drawId)
        for drawName, _drawObject in pairs(self._drawings) do
            if drawName:sub(1, #drawId) == drawId then
                UILib:_Undraw(drawName)
            end
        end
    end

    function UILib:_SetOpacityStartsWith(drawId, opacity)
        for drawName, _drawObject in pairs(self._drawings) do
            if drawName:sub(1, #drawId) == drawId then
                UILib:_SetOpacity(drawName, opacity)
            end
        end
    end
end

do
    function UILib:_SpawnColorpicker(position, label, value, callback)
        local h, s, v = 0, 0, 0
        if value then
            h, s, v = rgbToHsv(value.R, value.G, value.B)
        end

        local item = {
            position = position or Vector2.new(self.x + self.w + self._padding, self.y),
            label = label,
            callback = callback,
            _h = h or 0,
            _s = s or 0,
            _v = v or 0,
            _spawned_at = os.clock()
        }

        self._active_colorpicker = item
    end

    function UILib:_RemoveColorpicker()
        self._active_colorpicker = nil
        self:_UndrawStartsWith('colorpicker_')
    end

    function UILib:_SpawnDropdown(position, width, value, choices, multi, callback)
        local item = {
            position = position,
            width = width,
            value = value,
            choices = choices,
            multi = multi,
            callback = callback,
            _spawned_at = os.clock()
        }

        self._active_dropdown = item
    end

    function UILib:_RemoveDropdown()
        self._active_dropdown = nil
        self:_UndrawStartsWith('dropdown_')
    end

    function UILib:_Toggle(tabName, sectionName, label, value, callback)
        local itemId = #self._tree[tabName]._items[sectionName]._items + 1
        local item = {
            type_ = 'toggle',
            label = label,
            value = value,
            callback = callback
        }

        table.insert(self._tree[tabName]._items[sectionName]._items, item)

        return {
            Set = function(_, newValue)
                self._tree[tabName]._items[sectionName]._items[itemId].value = newValue

                if self._tree[tabName]._items[sectionName]._items[itemId].callback then
                    self._tree[tabName]._items[sectionName]._items[itemId].callback(newValue)
                end
            end,
            AddKeybind = function(_, value, mode, canChange, callback)
                local item = {
                    value = value,
                    callback = callback,
                    mode = mode or 'Hold',
                    canChange = canChange or true,
                    _listening = false,
                    _listening_start = 0
                }

                self._tree[tabName]._items[sectionName]._items[itemId].keybind = item

                return {
                    Set = function(_, newValue, newMode)
                        local mode = newMode or self._tree[tabName]._items[sectionName]._items[itemId].keybind.mode

                        self._tree[tabName]._items[sectionName]._items[itemId].keybind.value = newValue
                        self._tree[tabName]._items[sectionName]._items[itemId].keybind.mode = mode

                        if self._tree[tabName]._items[sectionName]._items[itemId].keybind.callback then
                            self._tree[tabName]._items[sectionName]._items[itemId].keybind.callback(newValue, mode)
                        end
                    end
                }
            end,
            AddColorpicker = function(_, label, value, overwrite, callback)
                local item = {
                    label = label,
                    value = value or self._theming.accent,
                    overwrite = overwrite,
                    callback = callback
                }

                self._tree[tabName]._items[sectionName]._items[itemId].colorpicker = item

                return {
                    Set = function(_, newValue)
                        self._tree[tabName]._items[sectionName]._items[itemId].colorpicker.value = newValue

                        if self._tree[tabName]._items[sectionName]._items[itemId].colorpicker.callback then
                            self._tree[tabName]._items[sectionName]._items[itemId].colorpicker.callback(newValue)
                        end
                    end
                }
            end
        }
    end

    function UILib:_Slider(tabName, sectionName, label, value, step, min, max, suffix, callback)
        local itemId = #self._tree[tabName]._items[sectionName]._items + 1
        local item = {
            type_ = 'slider',
            label = label,
            value = value,
            step = step,
            min = min,
            max = max,
            suffix = suffix or '',
            callback = callback
        }

        table.insert(self._tree[tabName]._items[sectionName]._items, item)

        return {
            Set = function(_, newValue)
                self._tree[tabName]._items[sectionName]._items[itemId].value = newValue

                if self._tree[tabName]._items[sectionName]._items[itemId].callback then
                    self._tree[tabName]._items[sectionName]._items[itemId].callback(newValue)
                end
            end
        }
    end

    function UILib:_Dropdown(tabName, sectionName, label, value, choices, multi, callback)
        local itemId = #self._tree[tabName]._items[sectionName]._items + 1
        local item = {
            type_ = 'dropdown',
            label = label,
            value = value,
            choices = choices,
            multi = multi,
            callback = callback
        }

        table.insert(self._tree[tabName]._items[sectionName]._items, item)

        return {
            Set = function(_, newValue)
                self._tree[tabName]._items[sectionName]._items[itemId].value = newValue

                if self._tree[tabName]._items[sectionName]._items[itemId].callback then
                     self._tree[tabName]._items[sectionName]._items[itemId].callback(newValue)
                end
            end
        }
    end

    function UILib:_Button(tabName, sectionName, label, callback)
        local itemId = #self._tree[tabName]._items[sectionName]._items + 1
        local item = {
            type_ = 'button',
            label = label,
            callback = callback
        }

        table.insert(self._tree[tabName]._items[sectionName]._items, item)

        return {}
    end

    function UILib:_Section(tabName, sectionName)
        self._tree[tabName]._items[sectionName] = {
            _items = {}
        }

        return {
            Toggle = function(_, ...)
                return self:_Toggle(tabName, sectionName, ...)
            end,
            Slider = function(_, ...)
                return self:_Slider(tabName, sectionName, ...)
            end,
            Dropdown = function(_, ...)
                return self:_Dropdown(tabName, sectionName, ...)
            end,
            Button = function(_, ...)
                return self:_Button(tabName, sectionName, ...)
            end,
        }
    end

    function UILib:GetMenuSize()
        return Vector2.new(self.w, self.h)
    end

    function UILib:SetWatermarkEnabled(value)
        self._watermark_enabled = value
    end

    function UILib:SetMenuTitle(newTitle)
        self.title = newTitle
    end

    function UILib:SetMenuPosition(newPos)
        self.x = newPos.x or self.x
        self.y = newPos.y or self.y
    end

    function UILib:SetMenuSize(newSize)
        self.w = newSize.x or self.x
        self.h = newSize.y or self.y
    end

    function UILib:CenterMenu()
        local screenSize = self:_GetScreenSize()
        local menuSize = self:GetMenuSize()

        self:SetMenuPosition(Vector2.new(screenSize.x/2 - menuSize.x/2, screenSize.y/2 - menuSize.y/2))
    end

    function UILib:Notification(text, time)
        local item = {
            text = text,
            time = time,
            _id = self._notifications_spawned,
            _spawned_at = os.clock()
        }

        table.insert(self._notifications, item)
        self._notifications_spawned = self._notifications_spawned + 1
    end

    function UILib:Tab(tabName)
        self._tree[tabName] = {
            _items = {}
        }

        if not self._open_tab then
            self._open_tab = tabName
        end

        return {
            Section = function(_, sectionName)
                return self:_Section(tabName, sectionName)
            end
        }
    end

    function UILib:CreateSettingsTab(customName)
        local settingsTab = self:Tab(customName or 'Menu')

        local menuSection = settingsTab:Section('Menu')
        local menuKey = menuSection:Toggle('Ov. menu key', self._overwrite_menu_key, function(newValue)
            self._overwrite_menu_key = newValue
        end)
        menuKey:AddKeybind(self._menu_key, 'Hold', false, function(newValue)
            self._menu_key = self:_KeyIDToName(newValue)
        end)
        menuSection:Toggle('Watermark', true, function(newValue)
            self:SetWatermarkEnabled(newValue)
        end)

        local themingSection = settingsTab:Section('Theming')

        local themes = {'Default', 'Gamesense', 'Bitchbot'}
        local themingTextColor, themingBodyColor, themingAccentColor, themingSubtextColor, themingBorder0Color, themingBorder1Color, themingSurface0Color, themingSurface1Color, themingCrustColor
        local themingTheme = themingSection:Dropdown('Theme', themes[1], themes, false, function(newValue)
            if not newValue then
                return
            end

            local theme = newValue[1]
            if theme == themes[1] then
                -- default
                themingAccentColor:Set(Color3.fromRGB(0, 128, 255))
                themingBodyColor:Set(Color3.fromRGB(5, 5, 5))
                themingTextColor:Set(Color3.fromRGB(255, 255, 255))
                themingSubtextColor:Set(Color3.fromRGB(120, 120, 120))
                themingBorder1Color:Set(Color3.fromRGB(40, 40, 40))
                themingBorder0Color:Set(Color3.fromRGB(32, 32, 32))
                themingSurface1Color:Set(Color3.fromRGB(42, 42, 42))
                themingSurface0Color:Set(Color3.fromRGB(24, 24, 24))
                themingCrustColor:Set(Color3.fromRGB(0, 0, 0))
            elseif theme == themes[2] then
                -- gamesense
                themingAccentColor:Set(Color3.fromRGB(114, 178, 21))
                themingBodyColor:Set(Color3.fromRGB(0, 0, 0))
                themingTextColor:Set(Color3.fromRGB(144, 144, 144))
                themingSubtextColor:Set(Color3.fromRGB(59, 59, 59))
                themingBorder1Color:Set(Color3.fromRGB(60, 60, 60))
                themingBorder0Color:Set(Color3.fromRGB(48, 48, 48))
                themingSurface1Color:Set(Color3.fromRGB(45, 45, 45))
                themingSurface0Color:Set(Color3.fromRGB(26, 26, 26))
                themingCrustColor:Set(Color3.fromRGB(0, 0, 0))
            elseif theme == themes[3] then
                -- bitchbot
                themingAccentColor:Set(Color3.fromRGB(120, 85, 147))
                themingBodyColor:Set(Color3.fromRGB(31, 31, 31))
                themingTextColor:Set(Color3.fromRGB(202, 201, 201))
                themingSubtextColor:Set(Color3.fromRGB(100, 100, 100))
                themingBorder1Color:Set(Color3.fromRGB(53, 52, 52))
                themingBorder0Color:Set(Color3.fromRGB(53, 52, 52))
                themingSurface1Color:Set(Color3.fromRGB(41, 42, 40))
                themingSurface0Color:Set(Color3.fromRGB(41, 42, 40))
                themingCrustColor:Set(Color3.fromRGB(0, 0, 0))
            end
        end)

        local themingText = themingSection:Toggle('Text color')
        themingTextColor = themingText:AddColorpicker('Text color', self._theming.text, true, function(newValue)
            self._theming.text = newValue
        end)
        local themingBody = themingSection:Toggle('Body color')
        themingBodyColor = themingBody:AddColorpicker('Body color', self._theming.body, true, function(newValue)
            self._theming.body = newValue
        end)

        local themingAccent = themingSection:Toggle('Accent color')
        themingAccentColor = themingAccent:AddColorpicker('Accent color', self._theming.accent, true, function(newValue)
            self._theming.accent = newValue
        end)

        local themingSubtext = themingSection:Toggle('Subtext color')
        themingSubtextColor = themingSubtext:AddColorpicker('Subtext color', self._theming.subtext, true, function(newValue)
            self._theming.subtext = newValue
        end)

        local themingBorder0 = themingSection:Toggle('Border 0 color')
        themingBorder0Color = themingBorder0:AddColorpicker('Border 0 color', self._theming.border0, true, function(newValue)
            self._theming.border0 = newValue
        end)

        local themingBorder1 = themingSection:Toggle('Border 1 color')
        themingBorder1Color = themingBorder1:AddColorpicker('Border 1 color', self._theming.border1, true, function(newValue)
            self._theming.border1 = newValue
        end)

        local themingSurface0 = themingSection:Toggle('Surface 0 color')
        themingSurface0Color = themingSurface0:AddColorpicker('Surface 0 color', self._theming.surface0, true, function(newValue)
            self._theming.surface0 = newValue
        end)

        local themingSurface1 = themingSection:Toggle('Surface 1 color')
        themingSurface1Color = themingSurface1:AddColorpicker('Surface 1 color', self._theming.surface1, true, function(newValue)
            self._theming.surface1 = newValue
        end)

        local themingCrust = themingSection:Toggle('Crust color')
        themingCrustColor = themingCrust:AddColorpicker('Crust color', self._theming.crust, true, function(newValue)
            self._theming.crust = newValue
        end)

        themingTheme:Set({'Default'})

        return settingsTab, menuSection, themingSection
    end

    function UILib:Unload()
        self:_RemoveDrawStartsWith('')
        setrobloxinput(true)
    end

    function UILib:Step()
        -- input processing
        setrobloxinput(not self._menu_open)
        for keycode, inputData in pairs(self._inputs) do
            local keycodeId = inputData.id
            local interacted = iskeypressed(keycodeId)
            if isrbxactive() and interacted then
                if inputData.held == false and inputData.click == false then
                    self._inputs[keycode].click = true
                else
                    self._inputs[keycode].click = false
                end

                self._inputs[keycode].held = true
            else
                self._inputs[keycode].click = false
                self._inputs[keycode].held = false
            end
        end

        local clickFrame = self:_IsKeyPressed('m1')
        local mouseHeld = self:_IsKeyHeld('m1')
        local ctxFrame = self:_IsKeyPressed('m2')
        local menuKeyPressed = self:_IsKeyPressed(self._overwrite_menu_key and self._menu_key or 'f1')

        if menuKeyPressed then
            self._menu_open = not self._menu_open
            self._menu_toggled_at = os.clock()
        end

        -- draw watermark
        local watermarkPos = Vector2.new(20, 20)
        local watermarkSize = self:_GetTextBounds(self.title) + Vector2.new(self._padding * 2, self._padding * 2)
        if self._watermark_enabled then
            self:_Draw('watermark_crust', 'rect', self._theming.crust, 102, watermarkPos, watermarkSize, false)
            self:_Draw('watermark_border', 'rect', self._theming.border0, 102, watermarkPos + Vector2.new(1, 1), watermarkSize - Vector2.new(2, 2), false)
            self:_Draw('watermark_accent', 'line', self._theming.accent, 103, watermarkPos + Vector2.new(2, 2), watermarkPos + Vector2.new(watermarkSize.x - 2, 2))
            self:_Draw('watermark_body', 'gradient', nil, 101, 'vertical', watermarkPos + Vector2.new(2, 2), watermarkSize - Vector2.new(4, 4), self._theming.surface0)
            self:_Draw('watermark_text', 'text', self._theming.text, 103, watermarkPos + Vector2.new(self._padding, self._padding + 2), self.title, true)
        else
            self:_UndrawStartsWith('watermark_')
        end

        -- ... and notifications
        local notificationsOrigin = watermarkPos + (self._watermark_enabled and Vector2.new(0, watermarkSize.y + self._padding) or Vector2.new(0, 0))
        local totalNotificationsHeight = 0
        for notificationIter, notification in ipairs(self._notifications) do
            local shouldFade = os.clock() > notification._spawned_at + notification.time
            local notificationText = notification.text
            local notificationTextSize = self:_GetTextBounds(notificationText)
                                    
            local t = math.max(0, math.min(notification._spawned_at - os.clock() + (shouldFade and notification.time + 1 or 1), 1))
            local notificationFade = math.abs((shouldFade and 0 or 1) - (t * t * (3 - 2 * t)))

            local notificationDrawId = 'notification_' .. notification._id
            local notificationSize = Vector2.new(notificationTextSize.x + self._padding * 2, notificationTextSize.y + self._padding * 2)
            local notificationOrigin = notificationsOrigin + Vector2.new((-notificationSize.x - 50) * (1 - notificationFade), totalNotificationsHeight)

            local progressPercent = math.min((os.clock() - notification._spawned_at)/notification.time, 1)
            self:_Draw(notificationDrawId .. '_crust', 'rect', self._theming.crust, 102, notificationOrigin, notificationSize, false)
            self:_Draw(notificationDrawId .. '_border', 'rect', self._theming.border0, 102, notificationOrigin + Vector2.new(1, 1), notificationSize - Vector2.new(2, 2), false)
            self:_Draw(notificationDrawId .. '_progress', 'gradient', nil, 103, 'horizontal', notificationOrigin + Vector2.new(2, notificationSize.y - 4), Vector2.new(notificationSize.x * progressPercent - 6, 2), {R=0, G=0, B=0, A=0}, self._theming.accent)
            self:_Draw(notificationDrawId .. '_body', 'gradient', nil, 101, 'vertical', notificationOrigin + Vector2.new(2, 2), notificationSize - Vector2.new(4, 4), self._theming.surface0)
            self:_Draw(notificationDrawId .. '_text', 'text', self._theming.text, 103, notificationOrigin + Vector2.new(self._padding, self._padding + 2), notificationText, true)
            self:_SetOpacityStartsWith(notificationDrawId, notificationFade)

            totalNotificationsHeight = totalNotificationsHeight + (notificationTextSize.y + self._padding * 3) * notificationFade

            if os.clock() - 1 > notification._spawned_at + notification.time then
                self:_RemoveDrawStartsWith(notificationDrawId)
                table.remove(self._notifications, notificationIter)
            end
        end

        if self._menu_open then
            -- drag the menu
            if mouseHeld and self._menu_drag then
                local mousePos = self:_GetMousePos()
                self.x = mousePos.x - self._menu_drag.x
                self.y = mousePos.y - self._menu_drag.y
            else
                self._menu_drag = nil
            end

            -- draw the dropdown
            local dropdown = self._active_dropdown
            if dropdown then
                local dropdownFade =  1 - (dropdown._spawned_at - (os.clock() - 0.25)) / 0.25
                if dropdownFade < 1.1 then
                    self:_SetOpacityStartsWith('dropdown_', clamp(dropdownFade, 0, 1))
                end

                local shouldCancel = true
                local dropdownOrigin = dropdown.position
                local totalHeight = self._padding
                for i = 1, #dropdown.choices do
                    local choice = dropdown.choices[i]
                    local choiceFoundIndex = table.find(dropdown.value, choice)
                    local labelSize = self:_GetTextBounds(choice)

                    local choiceOrigin = Vector2.new(dropdownOrigin.x + self._padding, dropdownOrigin.y + totalHeight)
                    local choiceSize = Vector2.new(dropdown.width, labelSize.y)

                    local isHoveringChoice = self:_IsMouseWithinBounds(choiceOrigin, choiceSize)
                    if isHoveringChoice and clickFrame then
                        shouldCancel = not dropdown.multi

                        if dropdown.multi then
                            if choiceFoundIndex then
                                table.remove(dropdown.value, choiceFoundIndex)
                            else
                                table.insert(dropdown.value, choice)
                            end
                        else
                            dropdown.value = {choice}
                        end

                        if dropdown.callback then
                            dropdown.callback(dropdown.value)
                        end
                    end

                    local choiceColor = choiceFoundIndex and self._theming.accent or self._theming.subtext
                    self:_Draw('dropdown_choice_' .. tostring(i), 'text', choiceColor, 102, choiceOrigin, choice, true)

                    totalHeight = totalHeight + labelSize.y + self._padding
                end

                self:_Draw('dropdown_crust', 'rect', self._theming.crust, 100, dropdownOrigin, Vector2.new(dropdown.width, totalHeight), false)
                self:_Draw('dropdown_body', 'rect', self._theming.surface0, 101, dropdownOrigin + Vector2.new(1, 1), Vector2.new(dropdown.width - 2, totalHeight - 2), true)

                if clickFrame and shouldCancel then
                    self:_RemoveDropdown()
                end

                clickFrame = false
            end

            -- draw the colorpicker
            local colorpicker = self._active_colorpicker
            if colorpicker then
                local colorpickerFade =  1 - (colorpicker._spawned_at - (os.clock() - 0.25)) / 0.25
                if colorpickerFade < 1.1 then
                    self:_SetOpacityStartsWith('colorpicker_', clamp(colorpickerFade, 0, 1))
                end

                local shouldCancel = true
                local colorpickerSize = Vector2.new(200, 200)
                local colorpickerOrigin = colorpicker.position

                local colorpickerTitle = colorpicker.label
                local colorpickerTitleSize = self:_GetTextBounds(colorpickerTitle)

                self:_Draw('colorpicker_crust', 'rect', self._theming.crust, 100, colorpickerOrigin, colorpickerSize, false)
                self:_Draw('colorpicker_body', 'rect', self._theming.surface0, 101, colorpickerOrigin + Vector2.new(1, 1), colorpickerSize - Vector2.new(2, 2), true)
                self:_Draw('colorpicker_body_border_outer', 'rect', self._theming.border1, 103, colorpickerOrigin + Vector2.new(1, 1), colorpickerSize - Vector2.new(2, 2), false)
                self:_Draw('colorpicker_title', 'text', self._theming.text, 104, colorpickerOrigin + Vector2.new(self._padding + 1, self._padding + 2), colorpickerTitle, true)
                    
                local palleteContentPos = colorpickerOrigin + Vector2.new(self._padding + 2, self._padding + colorpickerTitleSize.y + 6)
                local palleteContentSize = colorpickerSize - Vector2.new(self._padding * 2 + 4, self._padding * 3 + colorpickerTitleSize.y)

                self:_Draw('colorpicker_body_border_inner', 'rect', self._theming.border1, 103, palleteContentPos - Vector2.new(1, 1), palleteContentSize + Vector2.new(2, 2), false)
                self:_Draw('colorpicker_body_content', 'rect', self._theming.body, 105, palleteContentPos, palleteContentSize, true)

                local mousePos = self:_GetMousePos()
                local palleteSize = palleteContentSize - Vector2.new(self._padding * 2, self._padding * 2)
                local hueSize = Vector2.new(palleteSize.x, 10)
                palleteSize = palleteSize - Vector2.new(0, hueSize.y + self._padding)
                local palletePos = palleteContentPos + Vector2.new(self._padding, self._padding)
                local huePos = palletePos + Vector2.new(0, palleteSize.y + self._padding)

                -- hue interaction
                if self:_IsMouseWithinBounds(huePos, hueSize) and mouseHeld then
                    local x = clamp((mousePos.x - huePos.x) / hueSize.x, 0, 1)
                    colorpicker._h = x

                    shouldCancel = false
                end

                -- palette interaction
                if self:_IsMouseWithinBounds(palletePos, palleteSize) and mouseHeld then
                    local sx = clamp((mousePos.x - palletePos.x) / palleteSize.x, 0, 1)
                    local vy = clamp((mousePos.y - palletePos.y) / palleteSize.y, 0, 1)

                    colorpicker._s = sx
                    colorpicker._v = 1 - vy

                    shouldCancel = false
                end

                -- palette hue tint
                local hueColor = Color3.fromHSV(colorpicker._h, 1, 1)
                self:_Draw('colorpicker_pallete_color', 'gradient', nil, 110, 'horizontal', palletePos, palleteSize, Color3.fromRGB(255, 255, 255), hueColor)
                self:_Draw('colorpicker_pallete_fade', 'gradient', nil, 111, 'vertical', palletePos, palleteSize, {R=0, G=0, B=0, A=0}, {R=0, G=0, B=0, A=1})

                self:_Draw('colorpicker_pallete_hue', 'gradient', nil, 111, 'horizontal', huePos, hueSize,
                    Color3.fromRGB(255, 0, 0),
                    Color3.fromRGB(255, 255, 0),
                    Color3.fromRGB(0, 255, 0),
                    Color3.fromRGB(0, 255, 255),
                    Color3.fromRGB(0, 0, 255),
                    Color3.fromRGB(255, 0, 255),
                    Color3.fromRGB(255, 0, 0)
                )

                local newColor = Color3.fromHSV(colorpicker._h, colorpicker._s, colorpicker._v)
                if colorpicker.callback then
                    colorpicker.callback(newColor)
                end

                if clickFrame and shouldCancel then
                    self:_RemoveColorpicker()
                end

                clickFrame = false
            end

            -- menu contents
            local menuTitleSize = self:_GetTextBounds(self.title)

            -- body outer
            self:_Draw('menu_crust', 'rect', self._theming.crust, 1, Vector2.new(self.x, self.y), Vector2.new(self.w, self.h), false)
            self:_Draw('menu_body', 'rect', self._theming.surface0, 2, Vector2.new(self.x + 1, self.y + 1), Vector2.new(self.w - 2, self.h - 2), true)
            self:_Draw('menu_body_border_outer', 'rect', self._theming.border1, 3, Vector2.new(self.x + 1, self.y + 1), Vector2.new(self.w - 2, self.h - 2), false)
            self:_Draw('menu_title', 'text', self._theming.text, 4, Vector2.new(self.x + self._padding + 1, self.y + self._padding + 2), self.title, true)
            self:_Draw('menu_accent_gradient', 'gradient', nil, 4, 'horizontal', Vector2.new(self.x + 2, self.y + 2), Vector2.new(self.w - 4, 2), self._theming.surface0, self._theming.accent, self._theming.surface0)

            -- body inner
            local bodyContentPos = Vector2.new(self.x + self._padding + 2, self.y + self._padding + menuTitleSize.y + 6)
            local bodyContentSize = Vector2.new(self.w - self._padding * 2 - 4, self.h - self._padding * 2 - menuTitleSize.y - 8)

            self:_Draw('menu_body_border_inner', 'rect', self._theming.border1, 11, bodyContentPos - Vector2.new(1, 1), bodyContentSize + Vector2.new(2, 2), false)
            self:_Draw('menu_body_content', 'rect', self._theming.body, 10, bodyContentPos, bodyContentSize, true)

            -- tabs
            local tabIter = 0
            local tabCount = getDictLength(self._tree)
            for tabName, tabContent in pairs(self._tree) do
                -- tab buttons
                local tabDrawId = 'menu_tab_' .. tostring(tabIter)
                local tabSize = Vector2.new(bodyContentSize.x / tabCount, self._tab_h)
                local tabPosition = Vector2.new(bodyContentPos.x + tabSize.x * tabIter, bodyContentPos.y)
                local isOpen = self._open_tab == tabName

                if not isOpen then
                    self:_Draw(tabDrawId .. '_backdrop', 'gradient', nil, 11, 'vertical', tabPosition, tabSize, self._theming.surface1)
                    self:_Draw(tabDrawId .. '_border_b', 'rect', self._theming.border1, 13, tabPosition + Vector2.new(0, tabSize.y), Vector2.new(tabSize.x, 1), true)
                else
                    self:_UndrawStartsWith(tabDrawId .. '_backdrop')
                    self:_Undraw(tabDrawId .. '_border_b')
                end

                self:_Draw(tabDrawId .. '_text', 'text', self._theming.text, 13, tabPosition + Vector2.new(tabSize.x/2, tabSize.y/2), tabName, true, 'center')
                
                if tabIter ~= tabCount-1 then
                    self:_Draw(tabDrawId .. '_border_r', 'rect', self._theming.border1, 12, tabPosition + Vector2.new(tabSize.x, 0), Vector2.new(1, tabSize.y + 1), true)
                end

                if not isOpen and clickFrame and self:_IsMouseWithinBounds(tabPosition, tabSize) then
                    self._open_tab = tabName
                    self._tab_change_at = os.clock()
                end

                -- tab content
                local sectionFade = 1 - (self._tab_change_at - (os.clock() - 0.25)) / 0.25
                if sectionFade < 1.1 then
                    self:_SetOpacityStartsWith('menu_section_', clamp(sectionFade, 0, 1))
                end

                local sectionCount = getDictLength(tabContent._items)
                local sectionIter = 0
                local sectionWidth = bodyContentSize.x/2 - self._padding * 1.5
                local totalSectionHeightR = self._padding * 1.5
                local totalSectionHeightL = self._padding * 1.5
                for sectionName, sectionContent in pairs(tabContent._items) do
                    local sectionDrawId = 'menu_section_' .. tostring(sectionIter) .. '_' .. tostring(tabIter)
                    local isLastSection = sectionIter >= sectionCount-2
                    local isSectionMirror = sectionIter % 2 == 1

                    local sectionTitleSize = self:_GetTextBounds(sectionName)

                    local sectionPos = Vector2.new(bodyContentPos.x + self._padding, bodyContentPos.y + tabSize.y)
                    local sectionHeight = self._padding + sectionTitleSize.y/2

                    if isSectionMirror then
                        sectionPos = sectionPos + Vector2.new(sectionWidth + self._padding, totalSectionHeightR + sectionTitleSize.y/2)
                    else
                        sectionPos = sectionPos + Vector2.new(0, totalSectionHeightL + sectionTitleSize.y/2)
                    end

                    if isOpen then
                        -- section items
                        self:_Draw(sectionDrawId .. '_title', 'text', self._theming.text, 20, sectionPos + Vector2.new(self._padding, -menuTitleSize.y/2), sectionName, true)          

                        for sectionItemIter, sectionItem in ipairs(sectionContent._items) do
                            local sectionItemId = sectionDrawId .. '_item_' .. tostring(sectionItemIter)
                            local sectionItemOrigin = Vector2.new(sectionPos.x + self._padding, sectionPos.y + sectionHeight)
                            local itemType = sectionItem.type_
                            local itemValue = sectionItem.value
                            local itemCallback = sectionItem.callback

                            if itemType == 'toggle' then
                                local tickOrigin = sectionItemOrigin
                                local tickSize = Vector2.new(self._font_size, self._font_size)

                                local itemKeybind = sectionItem.keybind
                                local itemColorpicker = sectionItem.colorpicker
                                if itemKeybind then
                                    local keybindText = '[' .. (itemKeybind._listening and '...' or ((itemKeybind.value or '-'):upper())) .. ']'
                                    local keybindLabelSize = self:_GetTextBounds(keybindText, nil, 10)

                                    local keybindSize = Vector2.new(keybindLabelSize.x - 2, tickSize.y)
                                    local keybindOrigin = sectionItemOrigin + Vector2.new(sectionWidth - keybindSize.x - self._padding * 2, 2)

                                    local isHoveringKeybind = self:_IsMouseWithinBounds(keybindOrigin, keybindSize)
                                    if isHoveringKeybind then
                                        if clickFrame then
                                            itemKeybind._listening = true
                                            itemKeybind._listening_start = os.clock()

                                            clickFrame = false
                                        elseif ctxFrame and itemKeybind.canChange then
                                            self:_SpawnDropdown(self:_GetMousePos(), 60, {itemKeybind.mode}, {'Hold', 'Toggle', 'Always'}, false, function(newValue)
                                                itemKeybind.mode = newValue[1]

                                                if itemKeybind.callback then
                                                    itemKeybind.callback(self._inputs[itemKeybind.value] and self._inputs[itemKeybind.value].id or nil, newValue[1])
                                                end
                                            end)
                                            
                                            ctxFrame = false
                                        end
                                    end

                                    if itemKeybind._listening then
                                        for keyName, key in pairs(self._inputs) do
                                            if self:_IsKeyPressed(keyName) then
                                                if keyName ~= 'm1' or os.clock() - itemKeybind._listening_start > 0.2 then
                                                    local newValue = keyName ~= 'unbound' and keyName

                                                    if itemKeybind.callback and self._inputs[newValue] then
                                                        itemKeybind.callback(key.id, itemKeybind.mode)
                                                    end

                                                    itemKeybind.value = newValue
                                                    itemKeybind._listening = false
                                                end
                                            end
                                        end
                                    end

                                    local keybindColor = itemKeybind.value and self._theming.text or self._theming.subtext
                                    self:_Draw(sectionItemId .. '_keybind', 'text', keybindColor, 20, keybindOrigin, keybindText, true, 'left', 10)
                                elseif itemColorpicker then
                                    local colorpickerSize = Vector2.new(tickSize.x * 2, tickSize.y)
                                    local colorpickerOrigin = sectionItemOrigin + Vector2.new(sectionWidth - self._padding * 2 - colorpickerSize.x)

                                    local isHoveringColorpicker = self:_IsMouseWithinBounds(colorpickerOrigin, colorpickerSize)
                                    if isHoveringColorpicker then
                                        if clickFrame then
                                            self:_SpawnColorpicker(nil, itemColorpicker.label, itemColorpicker.value, function(newValue)
                                                itemColorpicker.value = newValue

                                                if itemColorpicker.callback then
                                                    itemColorpicker.callback(newValue)
                                                end
                                            end)

                                            clickFrame = false
                                        elseif ctxFrame then
                                            self:_SpawnDropdown(self:_GetMousePos(), 60, {}, {'Copy', 'Paste'}, false, function(newValue)
                                                if newValue[1] == 'Copy' then
                                                    self._copied_color = itemColorpicker.value
                                                elseif newValue[1] == 'Paste' then
                                                    if self._copied_color then
                                                        itemColorpicker.value = self._copied_color

                                                        if itemColorpicker.callback then
                                                            itemColorpicker.callback(self._copied_color)
                                                        end
                                                    else
                                                        self:Notification('Color clipboard is empty!', 5)
                                                    end
                                                end
                                            end)

                                            ctxFrame = false
                                        end
                                    end 

                                    local tickColor = itemColorpicker.value
                                    self:_Draw(sectionItemId .. '_colorpicker', 'gradient', nil, 20, 'vertical', colorpickerOrigin + Vector2.new(1, 1), colorpickerSize - Vector2.new(2, 2), tickColor)
                                    self:_Draw(sectionItemId .. '_colorpicker_border', 'rect', self._theming.crust, 21, colorpickerOrigin, colorpickerSize, false)
                                end

                                local labelColor = itemValue and self._theming.text or self._theming.subtext
                                if not itemColorpicker or not itemColorpicker.overwrite then
                                    local isHoveringTick = self:_IsMouseWithinBounds(tickOrigin, tickSize)
                                    if isHoveringTick and clickFrame then
                                        local newValue = not itemValue
                                        sectionItem.value = newValue
                                        if itemCallback then
                                            itemCallback(newValue)
                                        end

                                        clickFrame = false
                                    end

                                    local tickColor = itemValue and self._theming.accent or self._theming.surface0
                                    self:_Draw(sectionItemId .. '_tick', 'gradient', nil, 20, 'vertical', sectionItemOrigin + Vector2.new(1, 1), tickSize - Vector2.new(2, 2), tickColor)

                                    self:_Draw(sectionItemId .. '_border', 'rect', self._theming.crust, 21, sectionItemOrigin, tickSize, false)
                                else
                                    labelColor = self._theming.text
                                end
                                
                                self:_Draw(sectionItemId .. '_label', 'text', labelColor, 20, sectionItemOrigin + Vector2.new(tickSize.x + self._padding, 0), sectionItem.label, true)

                                sectionHeight = sectionHeight + self._font_size + self._padding
                            elseif itemType == 'slider' then
                                local labelSize = self:_GetTextBounds(sectionItem.label)

                                local extraPadding = self._font_size
                                local sliderOrigin = Vector2.new(sectionItemOrigin.x + extraPadding + self._padding, sectionItemOrigin.y + labelSize.y + self._padding)
                                local sliderSize = Vector2.new(sectionWidth - extraPadding * 2 - self._padding * 3, 6)

                                local newValue = itemValue
                                local isHoveringSlider = self:_IsMouseWithinBounds(sliderOrigin - Vector2.new(4, 4), sliderSize + Vector2.new(8, 8))
                                if mouseHeld then
                                    if isHoveringSlider and clickFrame then
                                        self._slider_drag = sectionItemId
                                        clickFrame = false
                                    end

                                    if mouseHeld and self._slider_drag == sectionItemId then
                                        local mouseX = self:_GetMousePos().x - sliderOrigin.x
                                        local percent = mouseX / sliderSize.x
                                        percent = clamp(percent, 0, 1)

                                        newValue = sectionItem.min + (sectionItem.max - sectionItem.min) * percent
                                        newValue = math.floor((newValue / sectionItem.step) + 0.5) * sectionItem.step
                                        newValue = clamp(newValue, sectionItem.min, sectionItem.max)
                                    end
                                else
                                    self._slider_drag = nil
                                end

                                local buttonSize = Vector2.new(self._font_size, self._font_size)
                                local decreaseOrigin = sliderOrigin - Vector2.new(extraPadding + self._padding, labelSize.y - self._padding - 1)
                                local increaseOrigin = sliderOrigin + Vector2.new(sliderSize.x + self._padding - 4, -labelSize.y + self._padding + 1)

                                self:_Draw(sectionItemId .. '_decrease', 'text', self._theming.text, 20, decreaseOrigin + Vector2.new(buttonSize.x/2, buttonSize.y/2), '-', true, 'center')
                                self:_Draw(sectionItemId .. '_increase', 'text', self._theming.text, 20, increaseOrigin + Vector2.new(buttonSize.x/2, buttonSize.y/2), '+', true, 'center')
                                if clickFrame then
                                    if self:_IsMouseWithinBounds(decreaseOrigin, buttonSize) then
                                        newValue = clamp(itemValue - sectionItem.step, sectionItem.min, sectionItem.max)
                                        clickFrame = false
                                    elseif self:_IsMouseWithinBounds(increaseOrigin, buttonSize) then
                                        newValue = clamp(itemValue + sectionItem.step, sectionItem.min, sectionItem.max)
                                        clickFrame = false
                                    end
                                end

                                if newValue ~= itemValue then
                                    sectionItem.value = newValue

                                    if itemCallback then
                                        itemCallback(newValue)
                                    end
                                end

                                local fillPercent = (itemValue - (sectionItem.min or 0)) / ((sectionItem.max or 1) - (sectionItem.min or 0))
                                local tickColor = self._theming.accent
                                self:_Draw(sectionItemId .. '_slider', 'gradient', nil, 20, 'vertical', sliderOrigin + Vector2.new(1, 1), Vector2.new(sliderSize.x * fillPercent - 2, sliderSize.y - 2), tickColor)

                                local displayedValue = tostring(itemValue) .. sectionItem.suffix
                                -- local valueSize = self:_GetTextBounds(displayedValue, nil, 12)
                                self:_Draw(sectionItemId .. '_value', 'text', self._theming.text, 22, sliderOrigin + Vector2.new(sliderSize.x * fillPercent, sliderSize.y), displayedValue, true, 'center', 12)

                                self:_Draw(sectionItemId .. '_border', 'rect', self._theming.crust, 21, sliderOrigin, sliderSize, false)
                                self:_Draw(sectionItemId .. '_label', 'text', self._theming.text, 20, sectionItemOrigin + Vector2.new(self._padding + extraPadding, 0), sectionItem.label, true)

                                sectionHeight = sectionHeight + labelSize.y + sliderSize.y + self._padding * 3
                            elseif itemType == 'dropdown' then
                                local labelSize = self:_GetTextBounds(sectionItem.label)

                                local extraPadding = self._font_size
                                local dropdownOrigin = Vector2.new(sectionItemOrigin.x + extraPadding + self._padding, sectionItemOrigin.y + labelSize.y + self._padding)
                                local dropdownSize = Vector2.new(sectionWidth - extraPadding * 2 - self._padding * 3, labelSize.y + self._padding)

                                local isHoveringDropdown = self:_IsMouseWithinBounds(dropdownOrigin, dropdownSize)
                                if clickFrame and isHoveringDropdown then
                                    self:_SpawnDropdown(dropdownOrigin + Vector2.new(0, dropdownSize.y - 1), dropdownSize.x, itemValue, sectionItem.choices, sectionItem.multi, function(newValue)
                                        sectionItem.value = newValue

                                        if itemCallback then
                                            itemCallback(newValue)
                                        end
                                    end)

                                    clickFrame = false
                                end

                                local dropdownColor = self._theming.surface0
                                self:_Draw(sectionItemId .. '_list', 'gradient', nil, 20, 'vertical', dropdownOrigin, dropdownSize, dropdownColor)
                                self:_Draw(sectionItemId .. '_arrow', 'triangle', self._theming.text, 21, true,
                                    dropdownOrigin + Vector2.new(dropdownSize.x - self._padding - 6, dropdownSize.y/2),
                                    dropdownOrigin + Vector2.new(dropdownSize.x - self._padding, dropdownSize.y/2 + 4),
                                    dropdownOrigin + Vector2.new(dropdownSize.x - self._padding, dropdownSize.y/2 - 4)
                                )

                                local displayedValue = table.concat(itemValue, ', ')
                                local valueSize = self:_GetTextBounds(displayedValue)
                                if valueSize.x > dropdownSize.x - self._padding - 10 then
                                    displayedValue = tostring(#itemValue) .. ' item' .. (#itemValue == 1 and '' or 's')
                                end

                                self:_Draw(sectionItemId .. '_value', 'text', self._theming.text, 21, dropdownOrigin + Vector2.new(self._padding, valueSize.y/2), displayedValue, true)

                                self:_Draw(sectionItemId .. '_border', 'rect', self._theming.crust, 21, dropdownOrigin, dropdownSize, false)
                                self:_Draw(sectionItemId .. '_label', 'text', self._theming.text, 20, sectionItemOrigin + Vector2.new(self._padding + extraPadding, 0), sectionItem.label, true)

                                sectionHeight = sectionHeight + labelSize.y + dropdownSize.y + self._padding * 3
                            elseif itemType == 'button' then
                                local labelSize = self:_GetTextBounds(sectionItem.label)

                                local extraPadding = self._font_size
                                local buttonOrigin = Vector2.new(sectionItemOrigin.x + extraPadding + self._padding, sectionItemOrigin.y)
                                local buttonSize = Vector2.new(sectionWidth - extraPadding * 2 - self._padding * 3, labelSize.y + self._padding)

                                local isHoveringButton = self:_IsMouseWithinBounds(buttonOrigin, buttonSize)
                                if mouseHeld then
                                    if isHoveringButton and clickFrame then
                                        self._slider_drag = sectionItemId
                                        clickFrame = false

                                        if itemCallback then
                                            itemCallback()
                                        end
                                    end
                                else
                                    self._slider_drag = nil
                                end

                                local isClicked = mouseHeld and self._slider_drag == sectionItemId
                                local buttonColor = isClicked and self._theming.crust or self._theming.surface1
                                local tintColor = isClicked and self._theming.surface1 or self._theming.crust
                                self:_Draw(sectionItemId .. '_body', 'gradient', nil, 20, 'vertical', buttonOrigin, buttonSize, buttonColor, Color3.new(
                                    self:_Lerp(buttonColor.R, tintColor.R, 0.5),
                                    self:_Lerp(buttonColor.G, tintColor.G, 0.5),
                                    self:_Lerp(buttonColor.B, tintColor.B, 0.5)
                                ))

                                self:_Draw(sectionItemId .. '_border', 'rect', self._theming.crust, 21, buttonOrigin, buttonSize, false)
                                self:_Draw(sectionItemId .. '_text', 'text', self._theming.text, 21, buttonOrigin + Vector2.new(buttonSize.x/2, buttonSize.y/2), sectionItem.label, true, 'center')

                                sectionHeight = sectionHeight + buttonSize.y + self._padding * 2
                            end
                        end

                        if isSectionMirror then
                            totalSectionHeightR = totalSectionHeightR + sectionHeight + sectionTitleSize.y/2
                        else
                            totalSectionHeightL = totalSectionHeightL + sectionHeight + sectionTitleSize.y/2
                        end

                        if isLastSection then
                            if isSectionMirror then
                                sectionHeight = bodyContentSize.y - totalSectionHeightR + sectionHeight - self._tab_h - self._padding
                            else
                                sectionHeight = bodyContentSize.y - totalSectionHeightL + sectionHeight - self._tab_h - self._padding
                            end
                        end

                        self:_Draw(sectionDrawId .. '_backdrop', 'rect', self._theming.surface0, 11, sectionPos, Vector2.new(sectionWidth, sectionHeight), true)
                        self:_Draw(sectionDrawId .. '_border', 'rect', self._theming.border0, 12, sectionPos, Vector2.new(sectionWidth, sectionHeight), false)

                        if isSectionMirror then
                            totalSectionHeightR = totalSectionHeightR + self._padding
                        else
                            totalSectionHeightL = totalSectionHeightL + self._padding
                        end
                    else
                        self:_UndrawStartsWith(sectionDrawId)
                    end

                    sectionIter = sectionIter + 1
                end

                tabIter = tabIter + 1
            end

            if clickFrame and not self._menu_drag and self:_IsMouseWithinBounds(Vector2.new(self.x, self.y), Vector2.new(self.w, self.h)) then
                local mousePos = self:_GetMousePos()
                self._menu_drag = Vector2.new(mousePos.x - self.x, mousePos.y - self.y)
            end
        else
            self:_RemoveColorpicker()
            self:_RemoveDropdown()
        end

        -- fade the menu
        local menuFade =  1 - (self._menu_toggled_at - (os.clock() - 0.25)) / 0.25
        if menuFade < 1.1 then
            self:_SetOpacityStartsWith('menu_', math.abs((self._menu_open and 0 or 1) - clamp(menuFade, 0, 1)))
        elseif not self._menu_open and menuFade > 1.1 and menuFade < 1.6 then
            self:_UndrawStartsWith('menu_')
        end
    end

    function UILib:ShowDemoMenu()
        self:SetMenuSize(Vector2.new(400, 500))
        self:CenterMenu()

        local playground = self:Tab('Playground')
        local el = playground:Section('Section 1')
        local toggleOne = el:Toggle('Toggle #1', false)
        local key = toggleOne:AddKeybind()
        local toggleTwo = el:Toggle('Toggle #2', false)
        local color = toggleTwo:AddColorpicker('ESP Color')
        local dragMe = el:Slider('Drag me', 10, 1, 1, 360, 'deg')
        local pickMe = el:Dropdown('Pick me', {'1'}, {'1', '2', '3', '4', '5', 'verybigitem'}, false)
        el:Button('Rollback', function()
            toggleOne:Set(false)
            key:Set(nil, nil)
            toggleTwo:Set()
            color:Set(Color3.fromRGB(255, 255, 255))
            dragMe:Set(100)
            pickMe:Set({'1'})
        end)

        local anims = playground:Section('Section 2')
        local shouldAnimate = false
        local animToggle = anims:Toggle('Playing', shouldAnimate, function(newValue)
            shouldAnimate = newValue
        end)
        local animSlider = anims:Slider('Meter', 0, 1, -100, 100, '%')
        anims:Button('Stop', function()
            animToggle:Set(false)
        end)

        playground:Section('Section 3')
        playground:Section('Section 4')

        self:Tab('Another tab')
        self:Tab('Tabs')

        local shouldDie = false
        local _, menuSettings = self:CreateSettingsTab()
        menuSettings:Button('Unload', function()
            shouldDie = true
        end)

        self:Notification('Done loading the script! (it took 0.03s)', 8)
        self:Notification('Press F1 to toggle the menu', 15)

        while not shouldDie do
            if shouldAnimate then
                animSlider:Set(math.floor(math.sin(os.clock() * 10) * 100))
            end

            self:Step()
        end

        self:Unload()
        return true
    end
end

return UILib