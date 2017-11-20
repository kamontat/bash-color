# Table of Content
1. [usage](#usage)
    - [name](#utilities-name)
2. [download-link](#download-script-link)
3. [image](#imagescreenshot)
4. [development](#development)
5. [file](#file-description)
6. [constants](#how-to-know-constants)
    - [Charactor](#available-charactor) - [example](#example-variable-name)
    - [Reset](#reset-variable) - [example](#example-reset)
7. [extra function](#extra-function)
8. [extra variable](#extra-variable)
9. [example](#example-usage)


# Usage
1. download utils.sh from [release](https://github.com/kamontat/bash-color/releases) page
2. give permission to file by run `chmod +x ./color_utils.sh`
3. run command `source /dev/stdin <<(./color_utils.sh <parameters> <version>) &>/dev/null`
    - parameters 
        - load    - load color in bash
        - remove  - remove color from bash
        - clear   - clear cache from system
        - test    - run test command (check is color loaded?)
        - version - get current `bash-color` version
        - help    - help command
    - version - version from tag in Github
    
### utilities name
- `v4.2 or less` - name: **util.sh**
- `v4.4 or more` - name: **utils.sh**

# Download script Link
I make it more easier by using github release to get the link.
The link is `https://github.com/kamontat/bash-color/releases/download/<RELEASE_VERSION>/color_utils.sh` (for version 4.4 or more)

# Image/ScreenShot
click [here](./images)

# Development
1. [folk](https://github.com/kamontat/bash-color/edit/master/README.md#fork-destination-box) and clone this project to your computer
2. write the code as what you want

# File description
All command below, you should run by `source` keyword (source <FILE_NAME>)
1. [color_constants.sh](./color_constants.sh) - main color script which create variable and function below.
2. [color_reset.sh](./color_reset.sh) - unset all variable color that `color_constants.sh` created
3. [color_utils.sh](./color_utils.sh) - util for set and unset color variable. you can use only this file to execute everything in this repository
4. [color_test.sh](./color_test.sh) - choose / show / list all available color in your terminal (learn more at `color_test.sh -h`)

--------------
# Important Topic
    
# How to know constants?
1. All constant **must begin** with `C_`
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
5. REVERSE              Reverse Text (support some app / OS)
    - swap `fg` <-> `bg`
6. BLINK                Blinking Text (support some app / OS)
7. INVISIBLE            Invisible Text (support some app / OS)
8. STANDOUT             `Standout Mode` (support some app / OS)
    - swap `fg` <-> `bg`

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
The reset will start with `C_RE_` and end with code below
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
`C_COMPLETE`: int -> possible value is **0** or positive number
    - where greater than 0, meaning color setup is successful, you can use color as you wish
        - and C_COMPLETE is the number of bit color that your app/OS support.
    - 0 meaning fail, you might need color_raw_constants instead (in raw branch (not maintained)).

### Example Usage
all variable can be nested, but the must be difference type. For example you can add `fg` and `bg` together (see more in [color_constants.sh](https://github.com/kamontat/bash-color/blob/4b2f7f29940b8001d1d2aca1f8e5b84262e44144/color_constants.sh#L159-L169)), or add `underline` and `blink` and `fg` and `bg` together.
