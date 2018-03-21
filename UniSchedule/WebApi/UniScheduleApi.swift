//
//  UniScheduleApi.swift
//  UniSchedule
//
//  Created by Yevhen Velizhenkov on 3/18/18.
//  Copyright © 2018 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

enum Environment: String {
  case debug = "http://127.0.0.1:5000/api/v1"
  case release = "https://unischeduleapi.herokuapp.com/api/v1"
}

struct UniScheduleApi {
  private static let baseURL = Environment.debug.rawValue
  
  static func uni() -> URL {
    return (URLComponents(string: "\(baseURL)/universities")?.url)!
  }
  
  static func groups(university: String) -> URL {
    var url = URLComponents(string: "\(baseURL)/groups")
    url?.queryItems = [URLQueryItem(name: "university", value: university)]
    return (url?.url)!
  }
  
  static func schedule(group: String, university: String) -> URL {
    var url = URLComponents(string: "\(baseURL)/schedule")
    url?.queryItems = [
      URLQueryItem(name: "university", value: university),
      URLQueryItem(name: "group_id", value: group)
    ]
    return (url?.url)!
  }
}
