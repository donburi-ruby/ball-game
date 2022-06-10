class Bar < Sprite

    #iniialize the value of score
    def initialize
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

class leftBar < Bar

    #update the movement for left side bar
    def update

        if (Input.key_push?(K_W)){
            self.y += 1 #when the 'w' key is pressed, move upward
        }
        elsif (Input.key_push?(K_S)) {
            self.y += -1 #when the 'S' key is pressed, move downward
        }
        end
    end

class rightBar < Bar

    #update the movement of right side bar 
    def update
        if (Input.key_push?(K_O)) {
            self.y += -1 #when the 'O' key is pressed, the bar move upward
        }
        elsif (Input.key_push?(K_L)) {
        self.y += 1 #when the 'L' key is pressed, the bar move downward
        }
        end
    end
        
