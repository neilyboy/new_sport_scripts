## Team Selection
![image](https://github.com/neilyboy/new_sport_scripts/assets/9546844/9b1c1ba0-3125-4c1b-b959-3c6072bf3425)

This tool was written to help with OBS studio layouts. I may call for a single 'home.png' or 'away.png' multiple times for diffent scenes. This allows me to source all of the images in one directory. The goal was to allow for quick additions to new teams that may pop up in a tournament. I am able to quickly source a team logo (upscale it if needed - [Upscayl](https://www.upscayl.org/)) and export as a transparent 500x500px image.

This script will populate a few bits of dynamic content that I use often in my OBS layouts. It will first make a copy of the team logo and save it as either home.png or away.png (I use these on my score-bug, final-score and halftime scenes).
It will then create 4 text files based on the selected home and away team. 
- away_team_city.txt is everything before the "-" in the file name (same for home team).
- away_team_mascot.txt is everything after the "-" in hte file name (same for home team).
It will then allow the user to select a team color. I use this in a few different places on my layouts as well (stretch to fit different areas - next to team name in my score-bug etc.) It will save two different 10x10px png files.
- away_color.png
- home_color.png

> [!NOTE]
> Files must be named city-mascot.png (I have exported all team logos as 500x500px PNG files - Example: "Metamora-Redbirds.png")
Run script from root of team logo directory. 


Two folders are created /logo as well as /text

### File Outputs
**text directory:** 
- away_team_city.txt
- away_team_mascot.txt
- home_team_city.txt
- home_team_mascot.txt
  
**logo directory:**
- away.png
- away_color.png
- home.png
- home_color.png

I call to these text files in many places in my scenes/layouts. Again the goal was to allow for quick and easy ability to add a team quickly with little effort.
