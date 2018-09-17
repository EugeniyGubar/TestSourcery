// Generated using Sourcery 0.14.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif













class SomeProtocolMock: SomeProtocol {

    //MARK: - someFunction

    var someFunctionCallsCount = 0
    var someFunctionCalled: Bool {
        return someFunctionCallsCount > 0
    }
    var someFunctionReturnValue: Int
    @discardableResult!
    var someFunctionClosure: (() -> Int
    @discardableResult)?

    func someFunction() -> Int
    @discardableResult {
        someFunctionCallsCount += 1
        return someFunctionClosure.map({ $0() }) ?? someFunctionReturnValue
    }

    //MARK: - returnValueA

    var returnValueACallsCount = 0
    var returnValueACalled: Bool {
        return returnValueACallsCount > 0
    }
    var returnValueAReturnValue: Int!
    var returnValueAClosure: (() -> Int)?

    func returnValueA() -> Int {
        returnValueACallsCount += 1
        return returnValueAClosure.map({ $0() }) ?? returnValueAReturnValue
    }

    //MARK: - returnValueA

    var returnValueACallsCount = 0
    var returnValueACalled: Bool {
        return returnValueACallsCount > 0
    }
    var returnValueAReturnValue: Int!
    var returnValueAClosure: (() -> Int)?

    func returnValueA() -> Int {
        returnValueACallsCount += 1
        return returnValueAClosure.map({ $0() }) ?? returnValueAReturnValue
    }

}
