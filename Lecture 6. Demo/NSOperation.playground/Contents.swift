//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func doBackgroundWork() {
    
}

func doUIWork() {
    
}

func process(item: Int, completion: @escaping (() -> ())) {
    DispatchQueue.global().asyncAfter(deadline: .now() + TimeInterval(item)) {
        completion()
    }
}

let items = [2, 3, 4, 5]

let queue1 = OperationQueue.main

let queue2 = OperationQueue() // SERIAL
queue2.maxConcurrentOperationCount = 1

let queue3 = OperationQueue() // CONCURRENT
queue3.maxConcurrentOperationCount = 5

class MyOperation : Operation {
    
    override func main() {
        // do the work
        print("Hello")
    }
    
}

let op1 = MyOperation()

let op2 = BlockOperation {
    // do the work
    print("Hello2")
}
op1.addDependency(op2)
queue3.addOperation(op1)
queue3.addOperation(op2)

class AsyncOperation : Operation {
    
    var success: (() -> ())? = nil
    
    fileprivate var _executing = false
    fileprivate var _finished = false
    
    override func start() {
        guard !isCancelled else {
            finish()
            return
        }
        
        willChangeValue(forKey: "isExecuting")
        _executing = true
        main()
        didChangeValue(forKey: "isExecuting")
    }
    
    override func main() {
        // NOTE: should be overriden
        finish()
    }
    
    fileprivate func finish() {
        success?()
        
        willChangeValue(forKey: "isFinished")
        _finished = true
        didChangeValue(forKey: "isFinished")
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    override var isFinished: Bool {
        return _finished
    }
}

class MyAsyncOperation: AsyncOperation {
    override func main() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let sself = self else { return }
            // do the work
            print("Hello3")
            sself.finish()
        }
    }
}


let op4 = MyAsyncOperation()
op4.success = {
    print("Finish Hello 4")
}

let op3 = MyAsyncOperation()
op3.success = {
    // do some post operation things
    print("Finish Hello 3")
    let op5 = MyAsyncOperation()
    op5.success = {
        print("Finish Hello 5")
    }
    op4.addDependency(op5)
    queue2.addOperation(op5)
}


op4.addDependency(op3)

queue3.addOperation(op3)
queue3.addOperation(op4)
