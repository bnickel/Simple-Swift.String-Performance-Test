//
//  SwiftStringPerformance.swift
//  String Performance
//
//  Created by Brian Nickel on 9/29/14.
//
//

import Foundation
import XCTest

class SwiftStringPerformance: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        StringProvider.stringWithLength(100000, unicode: false) // Preload
        sleep(2) // Attach breakpoint here, then
    }

    func testAsciiIterationWithImplicitType() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: false)
        sleep(2)
        self.measureBlock() {
            for char in text {
                if char == "~" {
                    println(char)
                }
            }
        }
    }
    
    func testAsciiIterationWithExplicitType() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: false)
        sleep(2)
        self.measureBlock() {
            for char in text {
                if char == "~" as Character {
                    println(char)
                }
            }
        }
    }
    
    func testAsciiIterationWithInitializer() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: false)
        sleep(2)
        self.measureBlock() {
            for char in text {
                if char == Character("~") {
                    println(char)
                }
            }
        }
    }
    
    func testAsciiIterationWithPreassignment() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: false)
        let reference = "~" as Character
        sleep(2)
        self.measureBlock() {
            for char in text {
                if char == reference {
                    println(char)
                }
            }
        }
    }
}
