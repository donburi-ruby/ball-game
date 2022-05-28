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
bar_image = Image.new(10, 200, [255, 255, 255, 255])

# left bar settings
barlX, barlY = 50, windowH/2-bar_image.height/2
bar_left = Bar.new(barlX, barlY, bar_image)

# right bar settings
barrX, barrY = windowW-bar_image.width-50, windowH/2-bar_image.height/2
bar_right = Bar.new(barrX, barrY, bar_image)

Window.loop do
    ball.draw()
    bar_left.draw()
    bar_right.draw()
end