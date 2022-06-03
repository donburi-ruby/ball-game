class ball < Sprite
    def initialize(x, y, image)
     @ball = image
     @speedX = rand(3)+1
     @speedY = rand(3)+1
     super
    end

    def update
      self.x += @speedX
      self.y += @speedY
    end

end
