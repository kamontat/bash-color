# Develop
1. clone this project by `git clone https://gist.github.com/717f75e6b87606940017adf385274044.git color`
2. run `cd color`
3. write the code as what you want
    - color_constants.sh - new version of constant (using `tput`)
    - color_raw_constants.sh - old version of constant (using raw text to assign) **Move to raw branch**
        - some terminal app, might miss the color.
    - install.sh - install color script

# File description
All command below, you should run by `source` keyword (source <FILE_NAME>)
1. [color_constants.sh](./color_constants.sh) - main color script which create variable and function below.
2. [reset.sh](./reset.sh) - since sometime you might no need to output as color, run this script to do that for you.
3. [util.sh](./util.sh) - the util for loading and reseting color.
Command below, you can run by ./<FILE_NAME>
1. [log_color.sh](./log_color.sh) - showing all support color in your terminal.
    
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
1. All constant must begin with `C_`
2. All constant code, separate by `_`
3. All variable name is **UPPERCASE**
4. The color represent by number, 
    - from 0 to (belong with your terminal app and your setting)
5. The color number, support only in `foreground` / `background` only!!

## Available Charactor
1. FORGROUND            Foreground
2. BACKGROUND           background
3. BOLD                 Bold Text
4. UNDERLINE            Underlined Text
5. REVERSE              Reverse video Text (support some app / OS)
6. BLINK                Blinking Text (support some app / OS)
7. INVISIBLE            Invisible Text (support some app / OS)
8. STANDOUT             `Standout Mode` (support some app / OS)

|Special       |Constants Code|
|--------------|--------------|
|Foreground    |FG            |
|Background    |BG            |
|Bold          |BO            |
|Underline     |UL            |
|Reverse       |RV            |
|Blink         |BL            |
|Standout Mode |SM            |
|Invisible     |IV            |

### Color Code
- 1 - Red
- 2 - Green 
- 3 - Yellow 
- 4 - Blue 
- 5 - Pink 
- 7 - White  

### Example Variable Name
`C_FG_1` or `C_BG_4` or `C_RV` or `C_IV`.

## Reset Variable
The reset will start with `RE_` and end with code below
1. RESET_ALL            reset all type of text
2. RESET_UNDERLINE      reset only underline
3. RESET_STANDOUT_MODE  reset only stand-out mode 

|Reset Code    |Constants Code|
|--------------|--------------|
|All           |AL            |
|Underline     |UL            |
|Standout      |SM            |

### Example Reset
`C_RE_AL` for reset all modify code

# Extra Function
I create extra function that you can use it, with color integation. (it's might show not the same color in different app / OS)
1. error - **red** color
2. warning - **yellow**
3. debug - **white**
4. info - **green**
5. alert - **pink**

# Extra Variable
`C_COMPLETE`: int -> possible is **0** and more
    - where greater than 0, meaning color setup is successful, you can use color as you wish
        - and C_COMPLETE is the number of bit color that your app/OS support.
    - 0 meaning fail, you might need color_raw_constants instead.

### Example Usage
all variable can be nested, without same type, for example you can add `fg` and `bg` together (see more in [color_constants.sh](./color_constants.sh) script in **test** mode), or add `underline` and `blink` and `fg` and `bg` together also allowable.

