require 'dxruby'
require_relative 'Player'
#テスト
x = 200
y = 150
enemy_image = Image.load('./yellowBall.png')
enemy = Player.new(x, y, enemy_image)

Window.loop do
    Sprite.draw(enemy)
end