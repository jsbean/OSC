//
//  MessageTests.swift
//  OSC
//
//  Created by James Bean on 11/17/16.
//
//

import XCTest
import OSC

class MessageTests: XCTestCase, PacketDestination {

    var server: Server!
    var client: Client!
    
    var message: Message?
    
    override func setUp() {
        super.setUp()
        configureServer()
        configureClient()
    }
    
    private func configureServer() {
        self.server = Server()
        self.server.port = 9999
        self.server.delegate = self
    }
    
    private func configureClient() {
        self.client = Client()
        self.client.port = 9999
    }
    
    // MARK: - PacketDestination
    
    func take(_ message: Message) {
        self.message = message
    }

    func testSendAndReceiveSingleMessageOnLocalHost() {
    
        // Ensure message = `nil`
        self.message = nil
        
        let unfulfilledExpectation = expectation(description: "Ensure OSC messages received")
        
        XCTAssert(server.startListening())
        
        // Create message
        let message = Message(addressPattern: "/a", arguments: [1])
        client.send(message)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            XCTAssertNotNil(message)
            XCTAssertEqual(message!.addressPattern, "/a")
            XCTAssertEqual(message!.arguments as! [Int], [1])
        
            unfulfilledExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in }
    }
}
