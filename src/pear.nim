import std/[net, os]
import core/option
import network/node
import utility/logger

var TARGET = "localhost";
var TARGET_PORT = 57963;

proc runNode()

proc testNode()

proc runNode() =
    newN()

proc testNode() =
    let socket = newSocket()
    socket.connect("localhost", Port(TARGET_PORT), 3000)
    socket.send("Hello")
    socket.close()

when isMainModule:
    parseCmdLine()