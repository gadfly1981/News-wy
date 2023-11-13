//
//  NewsTianType.swift
//  News-wy
//
//  Created by wang yu on 2023/11/12.
//

import Foundation

enum NewsTianType: String, CaseIterable {
    case generalnews = "综合"
    case esports = "电竞"
    case internet = "互联网"
    case sicprobe = "科学"
    
    var name: String {
        get {
            return String(describing: self)
        }
    }
    
    var description: String {
        get {
            return String(reflecting: self)
        }
    }
}
