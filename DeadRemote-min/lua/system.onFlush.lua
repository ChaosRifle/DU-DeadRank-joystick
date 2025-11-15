if PLAYER_ID ~= 11654 then
  --system.print('not graaf')
  rollInput = system.getAxisValue(0)
  pitchInput = system.getAxisValue(1)
  yawInput = -1 * system.getAxisValue(2)

  Nav.axisCommandManager:setThrottleCommand(axisCommandId.longitudinal, system.getAxisValue(3))
  Nav.axisCommandManager:setThrottleCommand(axisCommandId.lateral, system.getAxisValue(4))
  Nav.axisCommandManager:setThrottleCommand(axisCommandId.vertical, system.getAxisValue(5))
else
    --system.print('graaf detected')
end

profile(runFlush,'runFlush')
