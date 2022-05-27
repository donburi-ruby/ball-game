class Player < Sprite
    attr_accessor :score

    def initialize(x, y, image)
        @score = 0
        super
    end

    def update
        self.x += Input.x
        self.y += Input.y
    end

    def shot
        @score += 1
    end
end