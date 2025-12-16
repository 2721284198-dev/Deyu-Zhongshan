
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/china-ui/refs/heads/main/main%20(6).lua"))()

function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    
    local length = #chars
    
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', 
            math.floor(r * 255), 
            math.floor(g * 255), 
            math.floor(b * 255), 
            chars[i])
    end
    
    return result
end

local themes = {"Dark", "Light", "Darker", "Aqua", "Amethyst"}
local currentThemeIndex = 1

local Window = WindUI:CreateWindow({
    Title = gradient("德与中山   ", Color3.fromHex("#00DBDE"), Color3.fromHex("#FC00FF")), 
    Author = gradient("加载器", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")),
    IconThemed = true,
    Folder = "德与中山",
    Size = UDim2.fromOffset(150, 100),
     Transparent = (getgenv and getgenv().TransparencyEnabled) or false,
     Theme = "Dark",
     Resizable = true,
     SideBarWidth = 150,
     BackgroundImageTransparency = 0.8,
     HideSearchBar = true,
     ScrollBarEnabled = true,
     User = {
         Enabled = true,
         Anonymous = false,
         Callback = function()
             currentThemeIndex = currentThemeIndex + 1
             if currentThemeIndex > #themes then
                 currentThemeIndex = 1
             end
             
             local newTheme = themes[currentThemeIndex]
             WindUI:SetTheme(newTheme)
            
             WindUI:Notify({
                 Title = "Theme Changed",
                 Content = "Switched to " .. newTheme .. " theme!",
                 Duration = 2,
                 Icon = "palette"
             })
             print("Switched to " .. newTheme .. " theme")
         end,
     },
 })


    
Window:EditOpenButton({
    Title = "[德与中山]",
    CornerRadius = UDim.new(0,8),
    StrokeThickness = 4,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("1E3A8A")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("118AB2")), 
        ColorSequenceKeypoint.new(1, Color3.fromHex("06D6A0")) 
    }),
    Draggable = true,
})
Window:Tag({
    Title = "破解版",
    Radius = 5,
    Color = Color3.fromHex("#FFB347"),
})
Window:SetToggleKey(Enum.KeyCode.F, true)

local MainTab = Window:Tab({ Title = "服务器选择", Icon = "info" })

local function loadScript(url, scriptName)
    WindUI:Notify({
        Title = "正在加载",
        Content = "正在加载 " .. scriptName .. "...",
        Duration = 1,
        Icon = "loading"
    })
    
    local success, result = pcall(function()
        local scriptContent = game:HttpGet(url, true)
        if scriptContent and scriptContent ~= "" then
            local func = loadstring(scriptContent)
            if func then
                func()
                return true
            else
                error("编译脚本失败")
            end
        else
            error("获取脚本内容失败或内容为空")
        end
    end)
    
    if success then
        WindUI:Notify({
            Title = "加载成功",
            Content = scriptName .. " 已成功加载！",
            Duration = 2,
            Icon = "check"
        })
    else
        WindUI:Notify({
            Title = "加载失败",
            Content = scriptName .. " 加载失败: " .. tostring(result),
            Duration = 3,
            Icon = "error"
        })
        warn("加载脚本失败 [" .. scriptName .. "]:", result)
    end
end

MainTab:Button({
    Title = "99夜",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/99%E5%A4%9C.txt", "99夜")
    end
})

MainTab:Button({
    Title = "死亡速递",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E4%BA%A1%E5%91%BD%E9%80%9F%E9%80%92.txt", "死亡速递")
    end
})

MainTab:Button({
    Title = "伐木大亨",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A8", "伐木大亨")
    end
})

MainTab:Button({
    Title = "传奇塔防",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E4%BC%A0%E5%A5%87%E5%A1%94%E9%98%B2.txt", "传奇塔防")
    end
})

MainTab:Button({
    Title = "南极洲",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E5%8D%97%E6%9E%81%E6%B4%B2.txt", "南极洲")
    end
})

MainTab:Button({
    Title = "压力",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E5%8E%8B%E5%8A%9B.txt", "压力")
    end
})

MainTab:Button({
    Title = "圣剑模拟器",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E5%9C%A3%E5%89%91%E6%A8%A1%E6%8B%9F%E5%99%A8", "圣剑模拟器")
    end
})

MainTab:Button({
    Title = "彩虹朋友",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E5%BD%A9%E8%99%B9%E6%9C%8B%E5%8F%8B", "彩虹朋友")
    end
})

MainTab:Button({
    Title = "感染者微笑",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E6%84%9F%E6%9F%93%E8%80%85%E5%BE%AE%E7%AC%91.txt", "感染者微笑")
    end
})

MainTab:Button({
    Title = "暴力区",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E6%9A%B4%E5%8A%9B%E5%8C%BA.txt", "暴力区")
    end
})

MainTab:Button({
    Title = "最强战场",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E6%9C%80%E5%BC%BA%E6%88%98%E5%9C%BA.txt", "最强战场")
    end
})

MainTab:Button({
    Title = "格蕾丝",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E6%A0%BC%E8%95%BE%E4%B8%9D.txt", "格蕾丝")
    end
})

MainTab:Button({
    Title = "死亡之死",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E6%AD%BB%E4%BA%A1%E4%B9%8B%E6%AD%BB", "死亡之死")
    end
})

MainTab:Button({
    Title = "死亡球",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E6%AD%BB%E4%BA%A1%E7%90%83.txt", "死亡球")
    end
})

MainTab:Button({
    Title = "监狱人生",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E7%9B%91%E7%8B%B1%E4%BA%BA%E7%94%9F", "监狱人生")
    end
})

MainTab:Button({
    Title = "脑叶公司",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E8%84%91%E5%8F%B6%E5%85%AC%E5%8F%B8", "脑叶公司")
    end
})

MainTab:Button({
    Title = "自然灾害",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.txt", "自然灾害")
    end
})

MainTab:Button({
    Title = "英雄战场",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E8%8B%B1%E9%9B%84%E6%88%98%E5%9C%BA.txt", "英雄战场")
    end
})

MainTab:Button({
    Title = "被遗弃",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E8%A2%AB%E9%81%97%E5%BC%83", "被遗弃")
    end
})

MainTab:Button({
    Title = "造船寻宝",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E9%80%A0%E8%88%B9%E5%AF%BB%E5%AE%9D", "造船寻宝")
    end
})

MainTab:Button({
    Title = "长途旅行",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E9%95%BF%E9%80%94%E6%97%85%E8%A1%8C", "长途旅行")
    end
})

MainTab:Button({
    Title = "零售大亨",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E9%9B%B6%E5%94%AE%E5%A4%A7%E4%BA%A8.txt", "零售大亨")
    end
})

MainTab:Button({
    Title = "鲨口逃生",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/2721284198-dev/Deyu-Zhongshan/refs/heads/main/%E9%B2%A8%E5%8F%A3%E9%80%83%E7%94%9F1", "鲨口逃生")
    end
})
