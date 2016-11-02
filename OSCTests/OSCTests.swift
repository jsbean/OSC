//
//  OSCTests.swift
//  OSC
//
//  Created by James Bean on 11/1/16.
//
//

import XCTest
@testable import OSC

class OSCTests: XCTestCase {
    
    func testMessage() {
        let _ = OSC.Message()
    }
    
    func testPacket() {
        let _ = OSC.Packet()
    }
    
    func testBundle() {
        let _ = OSC.Bundle()
    }
    
    func testClient() {
        let _ = OSC.Client()
    }
    
    func testServer() {
        let _ = OSC.Server()
    }
    
    func testSocket() {
        let _ = OSC.Socket()
    }
    
    func testParser() {
        let _ = OSC.Parser()
    }
    
    func testTimeTag() {
        let _ = OSC.TimeTag()
    }
}
