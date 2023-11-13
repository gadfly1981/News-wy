//
//  NewsType.swift
//  News-wy
//
//  Created by wang yu on 2023/11/11.
//

import Foundation

enum NewsType: String, CaseIterable {
    case top = "推荐"
    case guonei = "国内"
    case guoji = "国际"
    case yule = "娱乐"
    case tiyu = "体育"
    case junshi = "军事"
    case keji = "科技"
    case caijing = "财经"
    case youxi = "游戏"
    case qiche = "汽车"
    case jiankang = "健康"
    
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
