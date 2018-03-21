//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

let q = DispatchQueue(label: "My.Super.Queue", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit)

let sema = DispatchSemaphore(value: 0)
DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
    print("In Async")
    sema.signal()
    sema.signal()
}

let res = sema.wait(timeout: .now() + 5)
print(res)
let res2 = sema.wait(timeout: .now() + 5)
print(res2)