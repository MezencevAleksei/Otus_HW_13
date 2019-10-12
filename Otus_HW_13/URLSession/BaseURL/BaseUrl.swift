//
//  BaseUrl.swift
//  Otus_HW_13
//
//  Created by alex on 06/10/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import Foundation

struct Base_URL {
    
    /* https://newsapi.org/v2/top-headlines?' +
    'country=us&' +
    'apiKey=ffcf3615bbe24a18805af3af69eb0d5f'
     */
    var urlComponents = URLComponents()
    let scheme = "https"
    let host   = "newsapi.org"
    let path   = "/v2/top-headlines"

    let queryItem1 = URLQueryItem(name: "country", value: "ru")
    let queryItem2 = URLQueryItem(name: "apiKey", value: "ffcf3615bbe24a18805af3af69eb0d5f")
 
    mutating func urlConfigList() -> URL {
        urlComponents.scheme = self.scheme
        urlComponents.host   = self.host
        urlComponents.path   = self.path
        urlComponents.queryItems = [queryItem1,queryItem2]
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        return url
    }
}

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
