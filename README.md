# Develop
1. clone this project by `git clone https://gist.github.com/717f75e6b87606940017adf385274044.git color`
2. run `cd color`
3. write the code as what you want
    - color_constants.sh - new version of constant (using `tput`)
    - color_raw_constants.sh - old version of constant (using raw text to assign)
        - some terminal app, might miss the color.
    - install.sh - install color script
    
# Download script Link
I make it more easier by using github release to get the link.  
The link is `https://github.com/kamontat/bash-color/releases/download/<RELEASE_VERSION>/<FILE>`
1. RELEASE_VERSION = the version number that you can find at [release tab](https://github.com/kamontat/bash-color/releases)
2. FILE = the script file, can by one of this
    - `color_constants.sh` - for newest version
    - `color_raw_constants.sh` - for raw version (this might match color in some app / OS)

# Run
- run by make install root runable make computer can run install.bash
    1. run `chmod 755 ./install.bash`
    2. run `./install.sh`
- run by `source ./install.sh`

# Instant Import
use `source` command to import this project
1. This easiest way is download this project and import link this `source ./color_constants`
2. (don't work on bash3)
```Bash
source <(curl -sL -N https://github.com/kamontat/bash-color/releases/download/v1/color_constants.sh)
```
3. (work in all commandline) 
```Bash
source /dev/stdin <<< "$(curl -sL -N https://github.com/kamontat/bash-color/releases/download/v1/color_constants.sh)"
```

# result / expected
1. make all file are root readable (755 / +x)
    - easier by run `install.sh`
    
# How to know constants?
1. Saparator is `_`
2. All is **UPPERCASE**

|color |Constants Code|
|------|--------------|
|Black |BLACK         |
|Red   |RED           |
|Green |GREEN         |
|Yellow|YELLOW        |
|Blue  |BLUE          |
|Pink  |PINK          |
|Cyan  |CYAN          |
|White |WHITE         |

## Special Charactor
1. BOLD          Bold Text
2. UNDERLINE     Underlined Text
3. REVERSE       Reverse video Text (support some app / OS)
5. BLINK         Blinking Text (support some app / OS)
6. INVISIBLE     Invisible Text (support some app / OS)
7. STANDOUT      `Standout Mode` (support some app / OS)

|Special       |Constants Code|
|--------------|--------------|
|Bold          |BO            |
|Underline     |UL            |
|Reverse       |RV            |
|Blink         |BL            |
|Standout Mode |SM            |
|Invisible     |IV            |

## Reset Variable
1. 


### Example Usage



# More
- This project have 1 file call `tester`, that will log all possible color from `0:0` => `110:110` so that many of line, Careful to use it!
