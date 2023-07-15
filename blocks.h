// Path to the scripts folder
#define SCRIPTS_PATH "$HOME/src/dwmblocks/scripts/"

//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/        /*Command*/		                               /*Update Interval*/ /*Update Signal*/
    {" 󰆌 ",         "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,	      1},
    {"",            SCRIPTS_PATH "pubip.sh",                                    100,      2},
    {"",            SCRIPTS_PATH "locip.sh",                                    100,      3},
    {"",            SCRIPTS_PATH "wifi.sh",                                     100,      8},
    {"",            SCRIPTS_PATH "bluetooth.sh",                                100,      6},
    {"",            "date '+%b %d (%a) %T'",		                		    1,		  5},
    {"",            SCRIPTS_PATH "keyboard.sh",                                 0,       13},
    {"",            SCRIPTS_PATH "volume.sh",                                   0,        9},
    {"",            SCRIPTS_PATH "battery.sh",                                  30,       4}
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
