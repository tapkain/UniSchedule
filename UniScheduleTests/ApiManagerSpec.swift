//
//  ApiManagerSpec.swift
//  UniScheduleTests
//
//  Created by Yevhen Velizhenkov on 3/18/18.
//  Copyright © 2018 Yevhen Velizhenkov. All rights reserved.
//

import Quick
import Nimble
import PromiseKit
@testable import UniSchedule

class ApiManagerSpec: QuickSpec {
  static let uni = "IFNTUNG"
  
  override func spec() {
    var manager: ApiManager!
    var group: Group!
    
    beforeEach {
      manager = ApiManager()
    }
    
    describe("Fetch universities") {
      it("should fetch universities from api") {
        waitUntil(timeout: 10) { done in
          manager.universities().map { uni in
            expect(uni.first!).to(equal(ApiManagerSpec.uni))
            done()
          }.catch { error in
            fail(error.localizedDescription)
          }
        }
      }
    }
    
    describe("Fetch groups") {
      it("should fetch groups from api") {
        waitUntil(timeout: 10) { done in
          manager.groups(from: ApiManagerSpec.uni).map { groups in
            expect(!groups.isEmpty).to(beTrue())
            group = groups.first!
            done()
          }.catch { error in
            fail(error.localizedDescription)
          }
        }
      }
    }
    
    describe("Fetch schedule") {
      it("should fetch groups from api") {
        waitUntil(timeout: 10) { done in
          manager.schedule(for: group, from: ApiManagerSpec.uni).map { lessons in
            expect(!lessons.isEmpty).to(beTrue())
            done()
          }.catch { error in
            fail(error.localizedDescription)
          }
        }
      }
    }
  }
}
