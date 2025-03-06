DEGREE = "\xC2\xB0"
SUBDEGREE_VALUE = 60

def float_to_dms(float)
  angle = []

  until angle.size == 3
    angle << float.floor
    float -= angle.last
    float *= SUBDEGREE_VALUE
  end

  angle
end

def dms(angle)
  degrees, minutes, seconds = float_to_dms(angle % 360)
  format("#{degrees}#{DEGREE}%02d'%02d\"", minutes, seconds)
end
