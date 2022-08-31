import net
import std/strformat
import std/locks
import ../utility/logger

proc createNode() {.thread.} = 
    var socket = newSocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, true)
    socket.bindAddr(Port(57963))
    socket.listen()

    var client: Socket
    var address = ""
    while true:
        info "Node started running"
        socket.acceptAddr(client, address)
        info "Client connected from: " & address

proc newN*() =
    var thread: Thread[void]
    createThread(thread, createNode)
    joinThread(thread)