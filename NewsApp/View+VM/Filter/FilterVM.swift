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
        
    @Published var language : [String] = ["ar","de","en","es","fr","he","it","nl","no","pt","ru","sv","ud","zh"]
    @Published var countries : [String] = ["ae","ar","at","au","be","bg","br","ca","ch","cn","co","cu","cz","de","eg","fr","gb","gr","hk","hu","id","ie","il","in"]
        
}

struct Filter: Identifiable{
    var id: UUID = UUID()
    var name : String
    var isSelected : Bool = false
}
