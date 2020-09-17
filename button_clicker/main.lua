
function love.load()




 number =0


 button={}-- tables are indexed at one


 button.x=100


 button.y=100


 button.size=50







 score=0


 timer=10


 gamestate=1







 myFont=love.graphics.newFont(40)


end







function love.update(dt) -- 60fps
--dt stands for delta time which wil update per frame

   if gamestate==2 then


     if timer>0 then


     timer=(timer-dt)


     end







     if timer<0 then


       timer=0


       score=0


       timer=10


       gamestate=1


     end


   end


end







function love.draw() --everything that the player sees







if(gamestate==2) then


drawCircle(button.size,button.x,button.y)


end


drawScore()







love.graphics.print("Timer: "..math.ceil(timer), 300,0) --".." append







if gamestate==1 then


  love.graphics.printf("Button Clicker!", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")


end







end







function drawCircle(radius,posx,posy)


 love.graphics.setColor(255,0,0)


 love.graphics.circle("fill",posx,posy,radius)


end







function drawScore()


 love.graphics.setColor(255,255,255)


 love.graphics.setFont(myFont)


 love.graphics.print("Score: "..score)


end







function love.mousepressed( x, y, b, istouch ) --override


 if b==1 and gamestate==2 then


     if distanceBetween(x,y,button.x,button.y)< button.size then


       score = score+1


       button.x=math.random(button.size, love.graphics.getWidth()-button.size)


       button.y=math.random(button.size, love.graphics.getHeight()-button.size)


     end


 end







 if gamestate==1 then


   gamestate=2


 end


end







function distanceBetween(x,y,x1,y1)


 return math.sqrt(math.pow((y-y1), 2)+math.pow((x-x1), 2))


end

