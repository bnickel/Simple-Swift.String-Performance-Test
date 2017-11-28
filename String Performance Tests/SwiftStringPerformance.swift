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
        
        let text:String = StringProvider.string(withLength: 100000, unicode: false)
        
        sleep(2)
        
        self.measure() {
            for char in text.characters {
                if char == Character("~") {
                    print(char)
                }
            }
        }
    }
    
    func testAsciiIterationInUTF16View() {
        
        let text:String = StringProvider.string(withLength: 100000, unicode: false)
        
        sleep(2)
        
        self.measure() {
            let reference = "~".utf16.first!
            for char in text.utf16 {
                if char == reference {
                    print(char)
                }
            }
        }
    }
    
    func testUnicodeIteration() {
        
        let text:String = StringProvider.string(withLength: 100000, unicode: true)
        
        sleep(2)
        
        self.measure() {
            for char in text.characters {
                if char == Character("~") {
                    print(char)
                }
            }
        }
    }
    
    func testUnicodeIterationInUTF16View() {
        
        let text:String = StringProvider.string(withLength: 100000, unicode: true)
        
        sleep(2)
        
        self.measure() {
            let reference = "~".utf16.first!
            for char in text.utf16 {
                if char == reference {
                    print(char)
                }
            }
        }
    }
    
    func XtestIteration() {
        let text:String = StringProvider.string(withLength: 4, unicode: true)
        for char in text.characters {
            print(String(char).unicodeScalars.map({ "\($0.value)" }).joined(separator: ","))
        }
    }

}
