
local TheBox = {}
TheBox.color = {255, 0, 0}
TheBox.pts   = {
  300, 300,
  1700, 400,
  1600, 800,
  200, 900,
}

function TheBox:tl(setx, sety)
  self.pts[1] = setx or self.pts[1]
  self.pts[2] = sety or self.pts[2]

  return self.pts[1], self.pts[2]
end



return TheBox