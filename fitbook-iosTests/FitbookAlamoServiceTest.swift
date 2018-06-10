//
//  FitbookAlamoServiceTest.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import XCTest
@testable import FitBook

class FitbookAlamoServiceTest: XCTestCase {
    
    func handleResult(result: FitbookLoginResult) {
        XCTAssertNotNil(result.user?.images?.cover)
    }
    
    func testExample() {
//        service.login(token: FacebookToken(token: "A1312"), callback: handleResult)
    
    }
    
}
