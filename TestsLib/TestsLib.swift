//
//  TestsLib.swift
//  TestsLib
//
//  Created by hao yin on 2018/9/3.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import XCTest
@testable import DecoLib
class TestsLib: XCTestCase {
    
    class ta:Layout{
        func setFrame(frame: CGRect) {
            self.frame = frame
        }
        var frame:CGRect = .zero
        
    }
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStack() {
        let stack = StackLayout()
        stack.height = .volume(1000)
        stack.width = .volume(200)
        let subs = [
            PlainItem(volume: .volume(100)),
            PlainItem(volume: .volume(100)),
            PlainItem(volume: .volume(100)),
            PlainItem(volume: .volume(100)),
            PlainItem(volume: .volume(100)),
            PlainItem(volume: .volume(100)),
        ]
        stack.stackItem = subs
        stack.layout()
        var start:CGFloat = 0
        for i in subs {
            
            XCTAssertTrue(i.frame.equalTo(CGRect(x: 0, y: start * 100, width: 200, height: 100)))
            print(i.frame,CGRect(x: 0, y: start * 100, width: 200, height: 100))
            start += 1
        }
        let ns = [
            PlainItem(width: .volume(200), height: .volume(100)),
            PlainItem(width: .volume(200), height: .volume(100)),
            PlainItem(width: .volume(200), height: .volume(100)),
            PlainItem(width: .volume(200), height: .volume(100))
        ]
        stack.stackItem = ns
        stack.layout()
        start = 0
        for i in ns {
            XCTAssertTrue(i.frame.equalTo(CGRect(x: 0, y: start * 100, width: 200, height: 100)))
            print(i.frame,CGRect(x: 0, y: start * 100, width: 200, height: 100))
            start += 1
        }
        stack.direction = .colume
        stack.layout()
        start = 0
        for i in ns {
            XCTAssertTrue(i.frame.equalTo(CGRect(x: start * 200, y: 0, width: 200, height: 1000)))
            print(i.frame,CGRect(x: start * 200, y: 0, width: 200, height: 1000))
            start += 1
        }
        let h = ta()
        stack.host = h
        stack.applyFrame(frame: CGRect(x: 1, y: 1, width: 1, height: 1));
        XCTAssertTrue(h.frame.equalTo(CGRect(x: 1, y: 1, width: 1, height: 1)))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
