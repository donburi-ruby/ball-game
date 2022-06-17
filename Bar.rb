class Bar < Sprite
    attr_accessor :score
    @@BarSpeed = 2
    #iniialize the value of score
    def initialize(x, y, image)
        @score = 0
        super
    end

    #update the value of score
    def addScore
        score += 1
    end 

    def setLocation(x, y)
        self.x=x 
        self.y=y
    end
end   

class LeftBar < Bar

    #update the movement for left side bar
    def update

        if (Input.key_down?(K_W))
            self.y += -@@BarSpeed #when the 'w' key is pressed, move upward
        elsif (Input.key_down?(K_S))
            self.y += @@BarSpeed #when the 'S' key is pressed, move downward
        end
    end
end

class RightBar < Bar

    #update the movement of right side bar 
    def update
        if (Input.key_down?(K_O))
            self.y += -@@BarSpeed #when the 'O' key is pressed, the bar move upward
        elsif (Input.key_down?(K_L))
            self.y += @@BarSpeed #when the 'L' key is pressed, the bar move downward
        end
    end
end
