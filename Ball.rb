class Ball < Sprite
  attr_accessor :speedX, :speedY
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

    def setLocation(x, y)
      self.x=x 
      self.y=y
    end

    def boundX
      @speedX *= -1
    end

    def boundY
      @speedY *= -1
    end

end
