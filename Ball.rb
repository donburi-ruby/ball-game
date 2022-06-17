class Ball < Sprite
  attr_accessor :speedX, :speedY
    def initialize(x, y, image)
     @ball = image
     @speedX = 0
     @speedY = 0
     setSpeed()
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
      @speedX += @speedX<0 ? -1 :1
      @speedY = 0
      while(@speedY==0)
        @speedY = rand(0..8)-4
      end
    end

    def boundY
      @speedY *= -1
    end

    def setSpeed
      @speedX = 1
      # while(@speedX==0)
      #   @speedX = rand(0..6)-3
      # end
      @speedY = 1
      # while(@speedY==0)
      #   @speedY = rand(0..6)-3
      # end
    end

end
