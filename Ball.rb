class ball > Sprite
    def initialize(image)
     @ball = image
     @speedX = rand(3)+1
     @speedY = rand(3)+1
     super
    end

    def draw
      Sprite.draw(@ball)
    end

    def move
        @ball.x



end
