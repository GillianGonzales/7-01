-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created By Gillian Gonzales
-- Created On April 17 2018
--
-- This program will simple touch code for one and the comprehensive
-----------------------------------------------------------------------------------------

--Changing Background
display.setDefault("background", 1, 1, 1 )


local Ninja = display.newImage( "./assets/sprites/Ninja.png")
Ninja.x = display.contentCenterX - 600
Ninja.y = display.contentCenterY
Ninja.id = "Ninja person"

local Robot = display.newImage( "./assets/sprites/Robot.png" )
Robot.x = display.contentCenterX + 600
Robot.y = display.contentCenterY  
Robot.id = "Robot person"
 
local function onNinjaTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

 
function Robot:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

Robot:addEventListener( "touch", Robot )

Ninja:addEventListener( "touch", onNinjaTouched )
