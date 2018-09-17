import Quick
import Nimble
@testable import SourceryTest

class QNTest: QuickSpec {

    var viewController: ViewController!
    var authenticationService: AuthenticationServiceMock!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        authenticationService = AuthenticationServiceMock()
        viewController = ViewController()
        viewController.authenticationService = authenticationService
        viewController.login = "Test login"
        viewController.password = "Test password"
    }

    func testPerformAuthentication() {
        // given
        authenticationService.authenticateWithAndReturnValue = true

        // when
        viewController.performAuthentication()

        // then
        XCTAssert(authenticationService.authenticateWithAndReceivedArguments?.login == viewController.login, "Логин не был передан в функцию аутентификации")
        XCTAssert(authenticationService.authenticateWithAndReceivedArguments?.password == viewController.password, "Пароль не был передан в функцию аутентификации")
        XCTAssert(authenticationService.authenticateWithAndCalled, "Не произошёл вызова функции аутентификации")
    }

    func testPerformAsyncAuthentication() {
        // given
        var isAuthenticated = false
        viewController.aunthenticationHandler = { isAuthenticated = $0 }

        // when
        viewController.performAsyncAuthentication()
        authenticationService.asyncAuthenticateWithAndAuthenticationHandlerReceivedArguments?.authenticationHandler(true)

        // then
        XCTAssert(authenticationService.asyncAuthenticateWithAndAuthenticationHandlerCalled, "Не произошёл вызов асинхронной функции аутентификации")
        XCTAssert(authenticationService.asyncAuthenticateWithAndAuthenticationHandlerReceivedArguments?.login == viewController.login, "Логин не был передан в асинхронную функцию аутентификации")
        XCTAssert(authenticationService.asyncAuthenticateWithAndAuthenticationHandlerReceivedArguments?.password == viewController.password, "Пароль не был передан в асинхронную функцию аутентификации")
        XCTAssert(isAuthenticated, "Контроллер не обрабтывает результат аутентификации")
    }
    
}
