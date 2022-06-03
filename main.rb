require 'dxruby'
require_relative 'Ball'
require_relative 'Bar'

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
barLeft = Bar.new(barLX, barLY, barImage)

# right bar settings
barRX, barRY = windowW-barImage.width-50, windowH/2-barImage.height/2
barRight = Bar.new(barRX, barRY, barImage)

# playing flag
playing = false

# ball speed for debug
speed = 3
speedY = 2

# create font object
font = Font.new(32)

# score for debug
scoreR = 0
scoreL = 0

Window.loop do
    if(playing)
        ball.draw()
        barLeft.draw()
        barRight.draw()

        # get ball side location
        ballLeftX = ball.x
        ballSideY = ball.y + ball.image.height/2
        ballRightX = ballLeftX+ball.image.width

        # move ball for debug
        ball.x += speed
        ball.y += speedY

        # check hitting of ball & right bar side
        if(ballSideY>=barRight.y && ballSideY<=barRight.y+barRight.image.height && ballRightX>=barRight.x && ballRightX<=barRight.x+speed)
            speed *= -1
        end

        # check hitting of ball & left bar side
        if(ballSideY>=barLeft.y && ballSideY<=barLeft.y+barLeft.image.height && ballLeftX<=barLeft.x+barLeft.image.width && ballLeftX>=barLeft.x+barLeft.image.width+speed)
            speed *= -1
        end

        # check hitting of ball & window's top
        if(ball.y<=0)
            speedY *= -1
        end

        # check hitting of ball & window's bottom
        if(ball.y+ball.image.height>=windowH)
            speedY *= -1
        end

        # controll bars for debug
        if(barLeft.y>=0 && barLeft.y+barLeft.image.height<=windowH)
            barLeft.y += Input.y
            if(barLeft.y<0)
                barLeft.y = 0
            elsif(barLeft.y+barLeft.image.height>windowH)
                barLeft.y = windowH-barLeft.image.height
            end
        end

        if(barRight.y>=0 && barRight.y+barRight.image.height<=windowH)
            barRight.y += Input.y
            if(barRight.y<0)
                barRight.y = 0
            elsif(barRight.y+barRight.image.height>windowH)
                barRight.y = windowH-barRight.image.height
            end
        end

        if(ball.x+ball.image.width>windowW)
            scoreL += 1
            playing = false
        elsif(ball.x<0)
            scoreR += 1
            playing = false
        end
    end

    if(!playing)
        ball.x, ball.y = ballX, ballY
        barRight.x, barRight.y = barRX, barRY
        barLeft.x, barLeft.y = barLX, barLY
        ball.draw()
        barRight.draw()
        barLeft.draw()
        if(Input.key_push?(K_SPACE))
            playing = true
        end
    end
    Window.draw_font(0, 0, "#{scoreL}", font)
    Window.draw_font(windowW-32, 0, "#{scoreR}", font)
end