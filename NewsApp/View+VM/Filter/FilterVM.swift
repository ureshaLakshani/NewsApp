//
//  FilterVM.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import Foundation

class FilterVM: ObservableObject{
    
    // MARK: - PROPERTIES
    @Published var categories : [Filter] = [
        Filter(name: "business", isSelected: false),
        Filter(name: "health", isSelected: false),
        Filter(name: "science", isSelected: false),
        Filter(name: "sports", isSelected: false),
        Filter(name: "entertainment", isSelected: false),
        Filter(name: "technology", isSelected: false),
        Filter(name: "business", isSelected: false)
    ]
        
    @Published var language : [Filter] = [
        Filter(name: "ar", isSelected: false),
        Filter(name: "de", isSelected: false),
        Filter(name: "en", isSelected: false),
        Filter(name: "es", isSelected: false),
        Filter(name: "fr", isSelected: false),
        Filter(name: "he", isSelected: false),
        Filter(name: "it", isSelected: false),
        Filter(name: "nl", isSelected: false),
        Filter(name: "pt", isSelected: false),
        Filter(name: "no", isSelected: false),
        Filter(name: "sv", isSelected: false),
        Filter(name: "ud", isSelected: false),
        Filter(name: "zh", isSelected: false)
    ]
    
    @Published var countries : [Filter] = [
        Filter(name: "ae", isSelected: false),
        Filter(name: "ar", isSelected: false),
        Filter(name: "at", isSelected: false),
        Filter(name: "au", isSelected: false),
        Filter(name: "be", isSelected: false),
        Filter(name: "bg", isSelected: false),
        Filter(name: "br", isSelected: false),
        Filter(name: "ca", isSelected: false),
        Filter(name: "ch", isSelected: false),
        Filter(name: "cn", isSelected: false),
        Filter(name: "co", isSelected: false),
        Filter(name: "cu", isSelected: false),
        Filter(name: "de", isSelected: false),
        Filter(name: "eg", isSelected: false),
        Filter(name: "fr", isSelected: false),
        Filter(name: "gb", isSelected: false),
        Filter(name: "gr", isSelected: false),
        Filter(name: "hk", isSelected: false),
        Filter(name: "hu", isSelected: false),
        Filter(name: "id", isSelected: false),
        Filter(name: "ie", isSelected: false),
        Filter(name: "il", isSelected: false),
        Filter(name: "in", isSelected: false),
        Filter(name: "cn", isSelected: false)
    ]
        
}

struct Filter: Identifiable{
    var id: UUID = UUID()
    var name : String
    var isSelected : Bool = false
}
