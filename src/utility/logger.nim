import std/[terminal, strformat, times]

proc info*(text: string) =
    setForegroundColor(stdout, fgCyan)
    stdout.write fmt"[INFO {getClockStr()}] "
    resetAttributes(stdout)
    echo text

proc warn*(text: string) =
    stdout.styledWriteLine(fgYellow, bgDefault,
     fmt"[WARN {getClockStr()}] {text}")

proc error*(text: string) =
    stdout.styledWriteLine(fgRed, bgDefault,
     fmt"[Error {getClockStr()}] {text}")