local baseDamage = weapon_1.getBaseDamage()
local AT = system.getItem(weapon_1.getAmmo())
AT = tostring(AT['name']):lower()
if string.find(AT,'antimatter') then AT = 'Antimatter'
elseif string.find(AT,'electromagnetic') then AT = 'ElectroMagnetic'
elseif string.find(AT,'kinetic') then AT = 'Kinetic'
elseif string.find(AT,'thermic') then AT = 'Thermic'
end

if printCombatLog then 
    system.print(string.format('Hit %s for %.0f damage',radar_1.getConstructName(targetId),damage))
    system.print(string.format('%.0f%% resist against %s',(1-damage/baseDamage)*100,AT))
    system.print()
end

if dmgTracker[tostring(targetId)] then 
    dmgTracker[tostring(targetId)] = dmgTracker[tostring(targetId)] + damage
else
    dmgTracker[tostring(targetId)] = damage
end

local ts = system.getArkTime()
if dpsTracker[string.format('%.0f',ts/10)] then
    dpsTracker[string.format('%.0f',ts/10)] = dpsTracker[string.format('%.0f',ts/10)] + damage
    dpsChart[1] = dpsTracker[string.format('%.0f',ts/10)]
else
    dpsTracker[string.format('%.0f',(ts-10)/10)] = nil
    dpsTracker[string.format('%.0f',ts/10)] = damage
    table.insert(dpsChart,1,damage)
end