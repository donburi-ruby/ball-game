class Ball < Sprite
    def initialize(x, y, image)
     @ball = image
     @speedX = rand(3)+1
     @speedY = rand(3)+1
     super
    end

    def update
      self.x += 1
      self.y += 1
    end

    def setLocation(x, y)
      self.x=x 
      self.y=y
    end

    def boundX
      speedX *= -1
    end

    def boundY
      speedY *= -1
    end

end
