require 'dxruby'
require_relative 'Ball'
require_relative 'Bar'

ENDPOINT = 10

#テスト
# Window Size 
windowH, windowW = 480, 640

# ball settings
ball_image = Image.load('./yellowBall.png')
ballX, ballY = windowW/2-ball_image.width/2, windowH/2-ball_image.height/2
ball = Ball.new(ballX, ballY, ball_image)

# bar settings
barImage = Image.new(10, 200, [255, 255, 255, 255])

# left bar settings
barLX, barLY = 50, windowH/2-barImage.height/2
barLeft = LeftBar.new(barLX, barLY, barImage)

# right bar settings
barRX, barRY = windowW-barImage.width-50, windowH/2-barImage.height/2
barRight = RightBar.new(barRX, barRY, barImage)

# playing flag
playing = false

# game finish flag
finish = false

# winner name
playerSide = "right"

# create font object
font = Font.new(32)



Window.loop do
    if(playing)
        # draw ball & bars
        ball.draw()
        barLeft.draw()
        barRight.draw()

        # get ball side location
        ballLeftX = ball.x
        ballSideY = ball.y + ball.image.height/2
        ballRightX = ballLeftX+ball.image.width

        ball.update()

        # check hitting of ball & right bar side
        if(ballSideY>=barRight.y && ballSideY<=barRight.y+barRight.image.height && ballRightX>=barRight.x && ballRightX<=barRight.x+ball.speedX)
            ball.boundX()
        end

        # check hitting of ball & left bar side
        if(ballSideY>=barLeft.y && ballSideY<=barLeft.y+barLeft.image.height && ballLeftX<=barLeft.x+barLeft.image.width && ballLeftX>=barLeft.x+barLeft.image.width+ball.speedX)
            ball.boundX()
        end

        # check hitting of ball & window's top
        if(ball.y<=0)
            ball.boundY()
        end

        # check hitting of ball & window's bottom
        if(ball.y+ball.image.height>=windowH)
            ball.boundY()
        end

        # get ball's top & bottom location
        ballVerticalX = ball.x+ball.image.width/2
        ballTopY = ball.y
        ballBottomY = ball.y+ball.image.height

        # check hitting of ball & right bar top or bottom
        if(ballVerticalX>=barRight.x && ballVerticalX<=barRight.x+barRight.image.width)
            if(ballBottomY>=barRight.y && ballBottomY<=barRight.y+ball.speedY)
                ball.boundY()
            elsif(ballTopY<=barRight.y+barRight.image.height && ballTopY>=barRight.y+barRight.image.height+ball.speedY)
                ball.boundY()
            end
        end

        # check hitting of ball & left bar top or bottom
        if(ballVerticalX>=barLeft.x && ballVerticalX<=barLeft.x+barLeft.image.width)
            if(ballBottomY>=barLeft.y && ballBottomY<=barLeft.y+ball.speedY)
                ball.boundY()
            elsif(ballTopY<=barLeft.y+barLeft.image.height && ballTopY>=barLeft.y+barLeft.image.height+ball.speedY)
                ball.boundY()
            end
        end

        # controll left bar for debug
        barLeft.update()
        # to be in window
        if(barLeft.y<0)
            barLeft.y = 0
        elsif(barLeft.y+barLeft.image.height>windowH)
            barLeft.y = windowH-barLeft.image.height
        end
        
        # controll right bar for debug
        barRight.update
        # to be in window
        if(barRight.y<0)
            barRight.y = 0
        elsif(barRight.y+barRight.image.height>windowH)
            barRight.y = windowH-barRight.image.height
        end
        
        # check scoring a goal
        if(ball.x+ball.image.width>windowW) # right goal
            barLeft.score += 1
            playing = false
            # position initializing
            ball.setLocation(ballX, ballY)
            barRight.setLocation(barRX, barRY)
            barLeft.setLocation(barLX, barLY)
            # check game end
            if(barLeft.score==ENDPOINT)
                finish = true
                playerSide = "left"
            end
        elsif(ball.x<0) # left goal
            barRight.score += 1
            playing = false
            # position initializing
            ball.setLocation(ballX, ballY)
            barRight.setLocation(barRX, barRY)
            barLeft.setLocation(barLX, barLY)
            # check game end
            if(barRight.score==ENDPOINT)
                finish = true
                playerSide = "right"
            end
        end
    end

    # intermediate between the game
    if(!playing && !finish)
        # draw ball & bars
        ball.draw()
        barRight.draw()
        barLeft.draw()
        # SPACE restart
        Window.draw_font(windowW/2-120, windowH-32, "SPACEキーで開始", font)
        if(Input.key_push?(K_SPACE))
            playing = true
            ball.setSpeed()
        end
    end

    # draw score
    Window.draw_font(0, 0, "#{barLeft.score}", font)
    Window.draw_font(windowW-32, 0, "#{barRight.score}", font)

    if(finish)
        # draw winner
        Window.draw_font(windowW/2-120, 100, "Winner    Bar "+playerSide, font)
        # draw ball & bars
        ball.draw()
        barRight.draw()
        barLeft.draw()

        Window.draw_font(windowW/2-130, windowH-96, "ESCキーでゲーム終了", font)
        Window.draw_font(windowW/2-130, windowH-32, "ENTERキーでリスタート", font)
        if(Input.key_push?(K_RETURN)) # Enter restart
            playing, finish = false, false
            barRight.score, barLeft.score = 0, 0
            ball.setSpeed()
        elsif(Input.key_push?(K_ESCAPE)) # Esc finish
            break
        end
    end
end