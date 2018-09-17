import UIKit

protocol AutoMockable {}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Result: \(SomeClass().someFunction())")
    }
}

class SomeClass: SomeProtocol {

    func someFunction() -> Int {
        return 0
    }

    @discardableResult
    func returnValueA() -> Int {
        return 1
    }

}

protocol SomeProtocol: ProtocolA, AutoMockable {

    func someFunction() -> Int

    @discardableResult
    func returnValueA() -> Int
}

protocol ProtocolA {
    @discardableResult
    func returnValueA() -> Int
}



