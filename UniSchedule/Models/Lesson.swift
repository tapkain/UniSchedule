//
//  Lesson.swift
//  UniSchedule
//
//  Created by Yevhen Velizhenkov on 3/18/18.
//  Copyright © 2018 Yevhen Velizhenkov. All rights reserved.
//

class Lesson: Codable {
  var lessonNumber: Int?
  var week: Int?
  var day: Int?
  var subgroup: Int?
  var type: String?
  var name: String?
  var teacher: String?
}
