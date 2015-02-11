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

    func testAsciiIteration() {
        
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
    
    func testAsciiIterationInUTF16View() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: false)
        
        sleep(2)
        
        self.measureBlock() {
            let reference = first("~".utf16)!
            for char in text.utf16 {
                if char == reference {
                    println(char)
                }
            }
        }
    }
    
    func testUnicodeIteration() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: true)
        
        sleep(2)
        
        self.measureBlock() {
            for char in text {
                if char == Character("~") {
                    println(char)
                }
            }
        }
    }
    
    func testUnicodeIterationInUTF16View() {
        
        let text:String = StringProvider.stringWithLength(100000, unicode: true)
        
        sleep(2)
        
        self.measureBlock() {
            let reference = first("~".utf16)!
            for char in text.utf16 {
                if char == reference {
                    println(char)
                }
            }
        }
    }
    
    func XtestIteration() {
        let text:String = StringProvider.stringWithLength(4, unicode: true)
        for char in text {
            println(join(",", map(String(char).unicodeScalars, { "\($0.value)" })))
        }
    }

}
