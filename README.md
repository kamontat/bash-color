# Install
1. clone this project by `git clone https://gist.github.com/717f75e6b87606940017adf385274044.git color`

# Run
1. make computer can run install.bash
    1. run `chmod 755 ./install.bash`
    2. run `./install.bash`
2. run by `source ./install.bash`

# result / expected
1. make all file are root readable
2. testing color on commandline (enter `Y` to start testing)
    1. if start test the result should show all color that commandline support
    
# How to know constants?
1. Saparator is `_`
2. All is **UPPERCASE**
3. The color name will by the latest

|color |Constants Code|
|------|--------------|
|Black |BLACK         |
|Red   |RED           |
|Green |GREEN         |
|Yellow|YELLOW        |
|Purple|PURPLE        |
|Cyan  |CYAN          |
|White |WHITE         |

## Special Charactor
1. Bold
2. Underline
3. Background
4. High Intensity
5. Bold and High Intensity
6. High Intensity with Background
7. Blink

|Special       |Constants Code|
|--------------|--------------|
|Bold          |B             |
|Underline     |U             |
|Background    |BG            |
|High Intensity|HI            |
|Blink         |BLINK         |

### Rule of Merge Special Charactor
1. Order by `Length` First, If same length
2. Order by `alphabel`
#### For example:
- Bold and High Intensity = B_HI_XXXXX (XXXXX is regular color)
- High Intensity with Background = BG_HI_XXXXX (XXXXX is regular color)