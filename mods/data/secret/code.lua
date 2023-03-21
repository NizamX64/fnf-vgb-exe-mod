local KeyPressed = 1

local MaxKeys = 10

local Song = '??? (I have no idea for the name lol)'

local GameOverKeyPressed = false

local healthGain = 0

local healthLoss = 0

function executeSplit(inputstr, sep) --Stole this from some forum LOL

    if sep == nil then

       sep = "%s"

    end

    local t={}

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do

       table.insert(t, str)

    end

    return t

end

local SecretKey = executeSplit("S,E,C,R,E,T,S,H,H,H,.,.,.",",")

local PrevHealth = 1

function onGameOver()

    if PrevHealth > 0 and GameOverKeyPressed == true then

        setProperty('health', PrevHealth)

        return Function_Stop

    else

        return Function_Continue

    end

end

function CheckKey()

    if KeyPressed == MaxKeys then

        loadSong(Song);

        KeyPressed = 1

    end

end

MaxKeys = MaxKeys + 1

function goodNoteHit()

    PrevHealth = getProperty('health')

end

function noteMiss()

    PrevHealth = getProperty('health')

end

function onUpdate()

    for i, key in ipairs(SecretKey) do 

        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..SecretKey[KeyPressed]) then 

            if SecretKey[KeyPressed] == 'R' then

                GameOverKeyPressed = true

            else

                GameOverKeyPressed = false

            end

            KeyPressed = KeyPressed + 1

            CheckKey()

        end

    end

end