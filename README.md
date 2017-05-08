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
1. saparator is `_`
2. all is uppercase
3. the color name will by the latest
    |color |regular constant|
    |------|----------------|
    |Black |BLACK           |
    |Red   |RED             |
    |Green |GREEN           |
    |Yellow|YELLOW          |
    |Purple|PURPLE          |
    |Cyan  |CYAN            |
    |White |WHITE           |
4. xx