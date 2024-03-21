//
//  StoreActionTests.swift
//  DemoShopAppTests
//
//  Created by Steven Zeng on 2024/3/21.
//

@testable import DemoShopApp
import XCTest
import Combine

final class StoreActionTests: XCTestCase {
    var cancellables: [AnyCancellable] = []

    override func setUpWithError() throws {
        cancellables = []
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func testStoreGetList() async throws {
        let list = ShopItem.testObjects
        let initState = AppState(list: [], cart: [], historyOrders: [])
        let service = MockService()
        let store = Store(initialState: initState, environment: Environment(service: service))
        
        let expectation = XCTestExpectation(description: "get list")
        
        service.list = list
        
        // test initial state
        XCTAssertEqual(store.state.list, [])
        store.$state
            .dropFirst(2)
            .map(\.list)
            .sink(receiveValue: {
                // test fetched state
                XCTAssertEqual($0, list)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        store.dispatch(.getList)
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    @MainActor
    func testStoreGetCart() async throws {
        let cart = ShopItem.testObjects.prefix(2).map { CartItem(item: $0) }
        let initState = AppState(list: [], cart: [], historyOrders: [])
        let service = MockService()
        let store = Store(initialState: initState, environment: Environment(service: service))
        
        let expectation = XCTestExpectation(description: "get cart")
        
        service.cart = cart
        
        // test initial state
        XCTAssertEqual(store.state.cart, [])
        store.$state
            .dropFirst(2)
            .map(\.cart)
            .sink(receiveValue: {
                // test fetched state
                XCTAssertEqual($0, cart)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        store.dispatch(.getCart)
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    @MainActor
    func testStoreAddToCart() async throws {
        let initState = AppState(list: [], cart: [], historyOrders: [])
        let service = MockService()
        let store = Store(initialState: initState, environment: Environment(service: service))
        
        let expectation = XCTestExpectation(description: "add to cart")
        
        service.cart = []
        
        let item = ShopItem.testObjects[0]
        
        // test initial state
        XCTAssertEqual(store.state.cart.count, 0)
        let count = 1
        store.$state
            .dropFirst(2)
            .map(\.cart.count)
            .sink(receiveValue: {
                // test fetched state
                XCTAssertEqual($0, count)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        store.dispatch(.addToCart(item: item))
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    @MainActor
    func testStoreDeleteCartItem() async throws {
        let cartItem: CartItem = CartItem(item: ShopItem.testObjects[0])
        let initState = AppState(list: [], cart: [cartItem], historyOrders: [])
        let service = MockService()
        let store = Store(initialState: initState, environment: Environment(service: service))
        
        let expectation = XCTestExpectation(description: "delete cart item")
        
        service.cart = [cartItem]
        
        // test initial state
        XCTAssertEqual(store.state.cart.count, 1)
        store.$state
            .dropFirst(2)
            .map(\.cart.count)
            .sink(receiveValue: {
                // test fetched state
                XCTAssertEqual($0, 0)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        store.dispatch(.deleteCartItem(item: cartItem))
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    @MainActor
    func testStoreMakeOrder() async throws {
        let cartItem: CartItem = CartItem(item: ShopItem.testObjects[0])
        let initState = AppState(list: [], cart: [cartItem], historyOrders: [])
        let service = MockService()
        let store = Store(initialState: initState, environment: Environment(service: service))
        
        let expectation = XCTestExpectation(description: "make order")
        
        service.cart = [cartItem]
        service.historyOrders = []
        
        // test initial state
        XCTAssertEqual(store.state.cart.count, 1)
        XCTAssertEqual(store.state.historyOrders.count, 0)
        store.$state
            .dropFirst(3)
            .sink(receiveValue: {
                // test fetched state
                XCTAssertEqual($0.cart.count, 0)
                XCTAssertEqual($0.historyOrders.count, 1)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        store.dispatch(.makeOrder(items: [cartItem]))
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    @MainActor
    func testStoreGetHistoryOrder() async throws {
        let order = HistoryOrder(items: [CartItem(item: ShopItem.testObjects[0])])
        let initState = AppState(list: [], cart: [], historyOrders: [])
        let service = MockService()
        let store = Store(initialState: initState, environment: Environment(service: service))
        
        let expectation = XCTestExpectation(description: "make order")
        
        service.historyOrders = [order]
        
        // test initial state
        XCTAssertEqual(store.state.historyOrders.count, 0)
        store.$state
            .dropFirst(2)
            .map(\.historyOrders.count)
            .sink(receiveValue: {
                // test fetched state
                XCTAssertEqual($0, 1)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        store.dispatch(.getHistoryOrder)
        await fulfillment(of: [expectation], timeout: 2)
    }
}
