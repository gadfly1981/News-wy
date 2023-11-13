//
//  NetworkManager.swift
//  News-wy
//
//  Created by wang yu on 2023/11/9.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
//    static let baseURL = "http://v.juhe.cn/toutiao/index?key=52f835848ee2a87c643073570c68b22e&is_filter=1"
    let baseURL = "https://apis.tianapi.com/"
    let apiKey = "47c03505957b12d36f9c4841c8333ede"
    
    private init() {}
    
    func getNews(type: NewsTianType, page: Int, searchText word: String) async throws -> [NewsTian]? {
        var urlString = baseURL + type.name + "/index?key=" + apiKey + "&num=30&page=" + String(page)
        if !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            urlString += "&word=" + word
        }
        print("urlString:\(urlString)")
        
        guard let url = URL(string: urlString) else {
            throw APError.invalidURL
        }
        
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
//        let session = URLSession(configuration: configuration)
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let newsTianResponse = try decoder.decode(NewsTianResponse.self, from: data)
            return newsTianResponse.result?.newslist
        } catch {
            print(error.localizedDescription)
            throw APError.invalidData
        }
    }
}

enum APError: Error {
    case invalidURL
    case invalidData
}

