

function shakeEffect(t, duration, targets, speed, intensity, intensityRate, after)

  local acc = 0

  HUMPTimer.during(duration, function(dt)
      acc = acc + dt
      intensity = intensity + intensityRate * dt

      for _, target in ipairs(targets) do
        print(acc, math.sin(acc), t[target])
        t[target] = t[target] + math.sin(math.pi * 2 * acc * speed) * intensity 
      end
    end, after)
end