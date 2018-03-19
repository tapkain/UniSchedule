//
//  UniScheduleApi.swift
//  UniSchedule
//
//  Created by Yevhen Velizhenkov on 3/18/18.
//  Copyright © 2018 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

struct UniScheduleApi {
  private static let baseURL = "https://unischeduleapi.herokuapp.com/api/v1"
  
  static func uni() -> URL {
    return (URLComponents(string: "\(baseURL)/universities")?.url)!
  }
  
  static func groups(university: String) -> URL {
    var url = URLComponents(string: "\(baseURL)/groups")
    url?.queryItems = [URLQueryItem(name: "university", value: university)]
    return (url?.url)!
  }
  
  static func schedule(group: String, university: String) -> URL {
    var url = URLComponents(string: "\(baseURL)/groups")
    url?.queryItems = [
      URLQueryItem(name: "university", value: university),
      URLQueryItem(name: "group_id", value: group)
    ]
    return (url?.url)!
  }
}
