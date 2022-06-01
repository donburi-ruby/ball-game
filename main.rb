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

# ball speed for debug
speed = 3

Window.loop do
    ball.draw()
    barLeft.draw()
    barRight.draw()

    # get ball side location
    ballLeftX = ball.x
    ballSideY = ball.y + ball.image.height/2
    ballRightX = ballLeftX+ball.image.width

    # move ball
    ball.x += speed

    # check hitting of ball & right bar
    if(ballSideY>=barRight.y && ballSideY<=barRight.y+barRight.image.height && ballRightX>=barRight.x && ballRightX<=barRight.x+speed)
        speed *= -1
    end

    # check hitting of ball & left bar
    if(ballSideY>=barLeft.y && ballSideY<=barLeft.y+barLeft.image.height && ballLeftX<=barLeft.x+barLeft.image.width && ballLeftX>=barLeft.x+barLeft.image.width+speed)
        speed *= -1
    end

    # controll bars for debug
    barLeft.y += Input.y
    barRight.y += Input.y
end