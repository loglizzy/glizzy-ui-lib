#how to use
```html
<library> Window(<string> title)
  <Window> Toggle(<string> text, <function> callback)
    <Toggle> Enabled()
  
  <Window> Slider(<string> text, <function> callback>, <table> options {<number> min, <number> max}
    <Slider> GetValue()
```
#example
```lua
local lib = 'https://raw.githubusercontent.com/loglizzy/glizzy-ui-lib/main/main.lua'
local window = lib:Window('cu gozado')

local toggle = window:Toggle('toggle', function(enabled)
    print(enabled)
end)

local slider = window:Slider('slider', function(value)
    print(value)
end, {min= 0, max= 100})

while wait() do
    print(toggle:Enabled()) -- will print true/false if toggle is enabled
    print(slider:GetValue()) -- will print the slider value
end
```
