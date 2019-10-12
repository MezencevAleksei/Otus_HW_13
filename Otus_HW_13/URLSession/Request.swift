//
//  Request.swift
//  Otus_HW_13
//
//  Created by alex on 06/10/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import Foundation

class Request {

    let request = BaseRequest()
    var baseUrl = Base_URL()
    
    func getJsonNewsFromURL(complitionHendler: @escaping(_ newsArray: [NewsModel])->()) {
        let url = baseUrl.urlConfigList()
        self.request.downloadTask(url: url.absoluteString) {(json, _)  in
            let dJson = JSON(json)
            let array = dJson["articles"].array
         
            var mNews:[NewsModel] = [NewsModel]()
            if (array != nil) {
                
                for newsJSON in array! {
                    mNews.append(NewsModel(data: newsJSON))
                }
                complitionHendler(mNews)
            }
        }
    }
}

