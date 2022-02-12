//
//  WidyaMiniProjectTests.swift
//  WidyaMiniProjectTests
//
//  Created by Dion Lamilga on 12/02/22.
//

import XCTest
@testable import WidyaMiniProject

class WidyaMiniProjectTests: XCTestCase {

    var datas: Datas?
    func testStruct(){
        
        NetworkService.Login(username: datas?.username ?? "", password: datas?.password ?? "") { data in
            self.datas = data
            XCTAssertEqual(self.datas?.username, "Dion")
        }
    }

}
