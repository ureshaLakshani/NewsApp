//
//  Filter.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation

struct Filter: Identifiable{
    var id: UUID = UUID()
    var name : String = ""
    var isSelected : Bool = false
}
