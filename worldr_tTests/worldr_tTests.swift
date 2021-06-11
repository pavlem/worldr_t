//
//  worldr_tTests.swift
//  worldr_tTests
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import XCTest
@testable import worldr_t

class worldr_tTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInfoCellVMIsImageHidden() throws {
        let infoCell1VM = InfoCellVM(text: "Lorem Ipsum", urlString: "http://www.fff.com")
        XCTAssert(infoCell1VM.isImageHidden == false)
        
        let infoCell2VM = InfoCellVM(text: "Lorem Ipsum", urlString: nil)
        XCTAssert(infoCell2VM.isImageHidden == true)
    }
    
    func testInfoDetailsVMImageHidden() throws {
        let infoCell1VM = InfoCellVM(text: "Lorem Ipsum", urlString: "http://www.fff.com")
        let infoCell2VM = InfoCellVM(text: "Lorem Ipsum", urlString: nil)
        
        let infoDetails1VM = InfoDetailsVM(infoVM: infoCell1VM)
        let infoDetails2VM = InfoDetailsVM(infoVM: infoCell2VM)
        
        XCTAssert(infoDetails1VM.text == infoCell1VM.text)
        XCTAssert(infoDetails1VM.textColor == infoCell1VM.textColor)
        XCTAssert(infoDetails1VM.backgroundColor == infoCell1VM.backgroundColor)

        XCTAssert(infoDetails2VM.text == infoCell2VM.text)
        XCTAssert(infoDetails2VM.textColor == infoCell2VM.textColor)
        XCTAssert(infoDetails2VM.backgroundColor == infoCell2VM.backgroundColor)
    }
}
