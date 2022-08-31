import parseopt

type
  # Global config which can be read by arbitrary action
  Options* = object
    nodePort*: int

  ActionType* = enum
    actionRun, actionHelp, actionVersion

  Action* = object
    case typ*: ActionType
    of actionHelp, actionVersion:
        nil
    of actionRun:
        port*: int


const HELP_TEXT = """
 Pear Help
 Usage: pear [options]
 Options:
    run    make client start running
    --help or --h  check out Pear's help infomation
    --version or --v  check out Pear's version
"""
proc writeHelpInfo() =
    echo HELP_TEXT

proc writeVersion() =
    echo "v1.0.0"

proc parseAction() =
    echo ""

proc parseCmdLine*() =
    for kind, key, value in getopt():
        case kind
        of cmdArgument:
            echo key
        of cmdLongOption:
            case key
            of "h", "help":
                writeHelpInfo()
            of "v", "version":
                writeVersion()
        of cmdShortOption:
            echo key
        of cmdEnd: assert false
            
