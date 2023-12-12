<details>
<summary>Team Selection Tool</summary>
  
<p align="center">
<img src="https://github.com/neilyboy/new_sport_scripts/assets/9546844/ec6b4e16-9a84-469e-b78f-e36c6c9ec917" />
</p>

This tool was written to help with OBS studio layouts. I may call for a single 'home.png' or 'away.png' multiple times for diffent scenes. This allows me to source all of the images in one directory. The goal was to allow for quick additions to new teams that may pop up in a tournament. I am able to quickly source a team logo, upscale it if needed - [Upscayl](https://www.upscayl.org/), remove background [Adobe Express](https://new.express.adobe.com/tools/remove-background) and export as a transparent 500x500px image.

This script will populate a few bits of dynamic content that I use often in my OBS layouts. It will first make a copy of the team logo and save it as either home.png or away.png (I use these on my score-bug, final-score and halftime scenes).
It will then create 4 text files based on the selected home and away team. 
- away_team_city.txt is everything before the "-" in the file name (same for home team).
- away_team_mascot.txt is everything after the "-" in hte file name (same for home team).

It will then allow the user to select a team color. I use this in a few different places on my layouts as well (stretch to fit different areas - next to team name in my score-bug etc.) It will save two different 10x10px png files.
- away_color.png
- home_color.png

Two folders are created a "logo" and "text" directory

### File Outputs

| \text |  |
| :---         |     :---:      |
| xxxx_team_city.txt   | Town or City Name (Everything before the "-" in the filename)     |
| xxxx_team_mascot.txt     | School Mascot (Everything after the "-" in the filename)       |

| \logo |  |
| :---         |     :---:      |
| xxxx.png   | home or away png of selected team logo     |
| xxxx_color.png     | home or away 10x10 png image of selected team color       |


> I typically have a directory for each sport (football, basketball, etc.) inside that diretory I typically create a directory called 'Teams' which is where I store all of my png team logos.
> This file must be ran from the root of this directory (where to store your .png logo files)


> > [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.
> Files must be named city-mascot.png (I have exported all team logos as 500x500px PNG files - Example: "Metamora-Redbirds.png")

</details>

