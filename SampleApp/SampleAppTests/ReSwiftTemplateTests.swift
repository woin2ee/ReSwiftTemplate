import ReSwift
import ReSwiftTemplate
import XCTest

final class ReSwiftTemplateTests: XCTestCase {

    var store: StateStore!

    override func setUp() {
        super.setUp()
        let counterStateReducer: CounterState.Reducer = .init()
        let appStateReducer: AppState.Reducer = .init(counterStateReducer: counterStateReducer)
        store = .init(reducer: appStateReducer.createNewState, state: nil)
    }

    override func tearDown() {
        super.tearDown()
        store = nil
    }

    func testAppState() {
        XCTAssertEqual(store.state.isLoggedIn, false)
        store.dispatch(AppState.Actions.login)
        XCTAssertEqual(store.state.isLoggedIn, true)
        store.dispatch(AppState.Actions.logout)
        XCTAssertEqual(store.state.isLoggedIn, false)
    }

    func testCounterState() {
        XCTAssertEqual(store.state.counterState.count, 0)
        store.dispatch(CounterState.Actions.increaseCount)
        XCTAssertEqual(store.state.counterState.count, 1)
        store.dispatch(CounterState.Actions.decreaseCount)
        XCTAssertEqual(store.state.counterState.count, 0)
    }

}
