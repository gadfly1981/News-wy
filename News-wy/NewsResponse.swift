//
//  NewsResponse.swift
//  News-wy
//
//  Created by wang yu on 2023/11/9.
//

import Foundation

struct NewsResponse: Codable {
    var reason = ""
    var error_code = 0
    var result = NewsResult()
}

struct NewsResult: Codable {
    var stat = ""
    var page = ""
    var pageSize = ""
    var data: [News] = []
}

struct News: Codable {
    var uniquekey = ""
    var title = ""
    var date = ""
    var category = ""
    var author_name = ""
    var url = ""
    var thumbnail_pic_s: String?
    var thumbnail_pic_s02: String?
    var thumbnail_pic_s03: String?
    var is_content = ""
    
    var pics: [String] {
        var array: [String] = []
        if let pic1 = thumbnail_pic_s, !pic1.isEmpty {
            array.append(pic1)
        }
        if let pic2 = thumbnail_pic_s02, !pic2.isEmpty {
            array.append(pic2)
        }
        if let pic3 = thumbnail_pic_s03, !pic3.isEmpty {
            array.append(pic3)
        }
        return array
    }
}
