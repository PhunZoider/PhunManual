PhunManual = {
    name = "PhunManual",
    inied = false,
    commands = {},
    events = {},
    settings = {},
    ui = {}
}

local Core = PhunManual
Core.settings = SandboxVars[Core.name] or {}

for _, event in pairs(Core.events or {}) do
    if not Events[event] then
        LuaEventManager.AddEvent(event)
    end
end

function Core:ini()
    if not self.inied then
        self.inied = true
        self.data = ModData.getOrCreate(self.name)
    end
end

function Core:debug(...)

    local args = {...}
    for i, v in ipairs(args) do
        if type(v) == "table" then
            self:printTable(v)
        else
            print(tostring(v))
        end
    end

end

function Core:printTable(t, indent)
    indent = indent or ""
    for key, value in pairs(t or {}) do
        if type(value) == "table" then
            print(indent .. key .. ":")
            Core:printTable(value, indent .. "  ")
        elseif type(value) ~= "function" then
            print(indent .. key .. ": " .. tostring(value))
        end
    end
end

