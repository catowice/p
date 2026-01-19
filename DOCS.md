quick docs

```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/catowice/p/refs/heads/main/library.lua'))() -- returns Menu
UILib:ShowDemoMenu()
```

# Menu
```lua
Menu:SetWatermarkEnabled(watermarkEnabled: boolean)
Menu:SetMenuTitle(newTitle: string)
Menu:SetMenuSize(newSize: Vector2)
Menu:SetMenuPosition(newPos: Vector2)
Menu:CenterMenu()
Menu:Tab(tabName: string) -> Tab
Menu:Notification(text: string, duration: number)
Menu:CreateSettingsTab(customName: string) -> settingsTab: Tab, menuSection: Section, themingSection: Section
Menu:ShowDemoMenu()
Menu:Unload()
```

# Tab
```lua
Menu:Section(sectionName: string) -> Section
```

# Section
```lua
Section:Toggle(label: string, value: boolean, callback: function) -> Item
Section:Slider(label: string, value: number, step: number, min: number, max: number, appendix: string, callback: function) -> Item
Section:Dropdown(label: string, value: table, choices: table, multi: boolean, callback: function) -> Item
Section:Button(label: string, callback: function) -> Item
```

# Item
```lua
-- supports: Toggle
Item:AddColorpicker(label: string, value: Color3, callback: function) -> Item
Item:AddKeybind(value: string, mode: string, canChange: boolean, callback: function) -> Item

-- if item takes in a value
Item:Set(value: any)
```
