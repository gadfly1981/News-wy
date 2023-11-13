//
//  NewsTianResponse.swift
//  News-wy
//
//  Created by wang yu on 2023/11/12.
//

import Foundation

struct NewsTianResponse: Codable {
    var code: Int
    var msg: String
    var result: NewsTianResult?
}

struct NewsTianResult: Codable {
    var curpage: Int
    var allnum: Int
    var newslist: [NewsTian]
}

struct NewsTian: Codable {
    var id: String
    var ctime: String
    var title: String
    var description: String
    var source: String
    var picUrl: String
    var url: String
    
    var picUrlFix: String {
        if picUrl.starts(with: "//") {
            return "http:" + picUrl
        } else {
            return picUrl
        }
    }
}
