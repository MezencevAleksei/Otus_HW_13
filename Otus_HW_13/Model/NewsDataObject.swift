//
//  NewsArrayData.swift
//  Otus_HW_13
//
//  Created by alex on 12.10.2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import Foundation
import RealmSwift
import Combine

final class NewsDataObject: ObservableObject{
    
    fileprivate let dataProvider: DataProvider = DataProvider.shared
    
    @Published var newsArray:[News]
    
    init() {
        newsArray = [News]()
    }
    
    func startUpdating(){
        dataProvider.getNews(){
            newsFromeCache in
            self.newsArray = newsFromeCache
        }
    }
    
}
