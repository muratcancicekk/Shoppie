//
//  DefinexTests.swift
//  DefinexTests
//
//  Created by Murat Çiçek on 27.07.2023.
//

import XCTest
@testable import Definex

final class DefinexTests: XCTestCase {
    
    var sut : HomeViewController?
    
    override func setUp() {
        super.setUp()
        sut = HomeViewController()
        sut?.loadViewIfNeeded()
    }
    
    
    
    func testExample() throws {
       try? denemeTest()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("*testExample")
        
        
    }
    
    final class MockHomeViewController : HomeViewInterface {
        var configureUICalled = false
        var collectionViewConfigureCalled = false
        var activityStartCalled = false
        var activityStopCalled = false
        var collectionViewReloadCalled = false
        var reflessControlCalled = false
        var refreshCalled = false
        var endRefleshingCalled = false
        
        func configureUI() {
            configureUICalled = true
        }
        
        func collectionViewConfigure() {
            collectionViewConfigureCalled = true
            
        }
        
        func activityStart() {
            activityStartCalled = true
        }
        
        func activityStop() {
            activityStopCalled = true
        }
        
        func collectionViewReload() {
            collectionViewReloadCalled = true
        }
        
        func reflessControl() {
            reflessControlCalled = true
        }
        
        func refresh() {
            refreshCalled = true
        }
        
        func endRefleshing() {
            endRefleshingCalled = true
        }
        
    }
    
    func denemeTest() throws {
        let spy = MockHomeViewController()
        let viewModel = HomeViewModel(view: spy)
        sut?.viewModel = viewModel
        
        sut?.viewModel.view?.activityStop()
        
        XCTAssertTrue(spy.activityStopCalled)
    }
    
}

