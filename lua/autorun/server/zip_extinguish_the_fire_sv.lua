hook.Add("OnEntityWaterLevelChanged", "ZIP_EXTINGUISH_PLAYER", function(ent)
    if not ent:IsPlayer() then return end
    if GetConVar("sv_extinguish_player"):GetBool() then
        timer.Simple(0.4, function()
            if not IsValid(ent) then return end
            if ent:IsOnFire() and ent:WaterLevel() >= 2 then
                ent:Extinguish()
            end
        end)
    end
end)

hook.Add("OnEntityWaterLevelChanged", "ZIP_EXTINGUISH_BOT", function(ent)
    if not ent:IsPlayer() or not ent:IsBot() then return end
    if GetConVar("sv_extinguish_bot"):GetBool() then
        timer.Simple(0.4, function()
            if not IsValid(ent) then return end
            if ent:IsOnFire() and ent:WaterLevel() >= 2 then
                ent:Extinguish()
            end
        end)
    end
end)

hook.Add("OnEntityWaterLevelChanged", "ZIP_EXTINGUISH_NPC", function(ent)
    if not ent:IsNPC() then return end
    if GetConVar("sv_extinguish_npc"):GetBool() then
        timer.Simple(0.4, function()
            if not IsValid(ent) then return end
            if ent:IsOnFire() and ent:WaterLevel() >= 2 then
                ent:Extinguish()
            end
        end)
    end
end)

hook.Add("OnEntityWaterLevelChanged", "ZIP_EXTINGUISH_PROP", function(ent)
    if ent:IsPlayer() or ent:IsNPC() then return end
    if GetConVar("sv_extinguish_prop"):GetBool() then
        timer.Simple(0.4, function()
            if not IsValid(ent) then return end
            if ent:IsOnFire() and ent:WaterLevel() >= 2 then
                ent:Extinguish()
            end
        end)
    end
end)

CreateConVar("sv_extinguish_player", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, "Whether or not to allow players to be turned off once in the water")
CreateConVar("sv_extinguish_bot", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, "Whether or not to allow bots to be turned off once in the water")
CreateConVar("sv_extinguish_npc", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, "Whether or not to allow npc's to be turned off once in the water")
CreateConVar("sv_extinguish_prop", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, "Whether or not to allow props to be turned off once in the water")
