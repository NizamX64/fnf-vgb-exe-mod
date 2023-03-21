function onUpdatePost()
    if(getPropertyFromClass('flixel.FlxG','keys.justPressed.ESCAPE'))then
        endSong()
    end
end

function onPause()
    runTimer('pauseremove', 1.5);
    return Function_Stop;
end

function onCreatePost() 

setProperty('debugKeysChart', null); 
setProperty('debugKeysCharacter', null); 

end

function onCreate()

    setProperty("skipCountdown", true)
end
