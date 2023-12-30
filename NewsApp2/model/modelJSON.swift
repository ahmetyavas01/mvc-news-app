//
//  modelJSON.swift
//  NewsApp2
//
//  Created by Ahmet Yavaş on 30.12.2023.
//

import Foundation

struct Model : Decodable {
    
    var title : String?
    var urlToImage : String?
    var description : String?
    
}

struct NewsResponse : Decodable {
    
    var articles : [Model]
}
