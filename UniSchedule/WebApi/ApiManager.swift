//
//  ApiManager.swift
//  UniSchedule
//
//  Created by Yevhen Velizhenkov on 3/18/18.
//  Copyright © 2018 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import PromiseKit

class ApiManager {
  func groups(from university: String) -> Promise<[Group]> {
    let url = UniScheduleApi.groups(university: university)
    return URLSession.shared.dataTask(.promise, with: url).compactMap {
      try JSONDecoder().decode([Group].self, from: $0.data)
    }
  }
  
  func schedule(for group: Group, from university: String) -> Promise<Schedule> {
    let url = UniScheduleApi.schedule(group: String(group.id), university: university)
    return URLSession.shared.dataTask(.promise, with: url).compactMap {
      try JSONDecoder().decode(Schedule.self, from: $0.data)
    }
  }
  
  func universities() -> Promise<[String]> {
    let url = UniScheduleApi.uni()
    return URLSession.shared.dataTask(.promise, with: url).compactMap {
      try JSONSerialization.jsonObject(with: $0.data) as? [String]
    }
  }
}
