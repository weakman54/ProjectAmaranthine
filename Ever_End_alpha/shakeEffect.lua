

function shakeEffect(t, duration, targets, speed, intensity, intensityRate, after)
--  print(">>>", t, duration, targets, speed, intensity, intensityRate, after, "<<<")
  local acc = 0

  assert(duration, "shakeEffect(): must supply duration!")
  assert(targets, "shakeEffect(): must supply duration!")

  for _, target in ipairs(targets) do
    assert(t[target], "shakeEffect(): target " .. tostring(target) .. " is not an index into t!")
  end

  assert(speed, "shakeEffect(): must supply duration!")
  assert(intensity, "shakeEffect(): must supply duration!")
  assert(intensityRate, "shakeEffect(): must supply duration!")



  HUMPTimer.during(duration, function(dt)
      acc = acc + dt
      intensity = intensity + intensityRate * dt

      for _, target in ipairs(targets) do
--        print(acc, math.sin(acc), t[target])
        t[target] = t[target] + math.sin(math.pi * 2 * acc * speed + math.random()) * intensity 
      end
    end, after)
end