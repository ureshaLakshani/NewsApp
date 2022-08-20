//
//  SearchVM.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation
import RappleProgressHUD

class SearchVM : ObservableObject{
    
    //MARK: - Variables
    @Published var isShowAlert = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    @Published var searchResult : [Article] = []
    @Published var selectedArticle : Article?
    @Published var searchText : String = ""
    @Published var page : Int = 1
    @Published var pageSize : Int = 20
    @Published var totalResult : Int = 0
    @Published var selectedCountry : String = ""
    @Published var selectedLanguage : String = ""
    @Published var selectedCategory : String = ""
    @Published var isReset : Bool = false
    @Published var isHideCountryNCategorySection : Bool = false
    @Published var useFor: UseFor = .search
    
    init(searchText: String? = nil, isHideCountryNCategorySection: Bool? = false, useFor: UseFor? = .search){
        self.searchText = searchText ?? ""
        self.isHideCountryNCategorySection = isHideCountryNCategorySection ?? false
        self.useFor = useFor ?? .search
        if self.useFor == .breakingNews{
            getAllBreakingNews()
        }else{
            findContent()
        }
        
    }
}

//MARK: - Find Articles For Search
extension SearchVM{
    
    func findContent(){
        
        RappleActivityIndicatorView.startAnimating()
        
        //Check internet availability
        guard Reachability.isInternetAvailable() else {
            RappleActivityIndicatorView.stopAnimation()
            self.isShowAlert = true
            self.alertMessage = "Internet connection is offline"
            self.alertTitle = "Error"
            return
        }
        
        //Set Params
        let param = ["q":searchText, "pageSize": "\(pageSize)", "page":"\(page)", "language": selectedLanguage]
        
        //API Call
        NetworkManager.shared.getNews(generalType: NewsResponse.self, parameters: param, endPont: .everything) { result in
            RappleActivityIndicatorView.stopAnimation()
            switch result{
                
            case .success(let res):
                DispatchQueue.main.async {

                    self.searchResult += res.articles ?? []
                    self.totalResult = res.totalResults ?? 0
                  
                }
            case .failure(let error):
                self.isShowAlert = true
                self.alertMessage = error.localizedDescription
                self.alertTitle = "Error"
            }
        }
    }
}

//MARK: - Get Breaking News
extension SearchVM{
    
    func getAllBreakingNews(){
        
        RappleActivityIndicatorView.startAnimating()
        
        //Check internet availability
        guard Reachability.isInternetAvailable() else {
            RappleActivityIndicatorView.stopAnimation()
            self.isShowAlert = true
            self.alertMessage = "Internet connection is offline"
            self.alertTitle = "Error"
            return
        }
        
        //Set default value for category if it is not avilable
        //It is compulsory param
        if self.selectedCategory == ""{
            selectedCategory = "general"
        }
        
        //Set Params
        let param = ["q": searchText, "pageSize": "\(pageSize)", "page":"\(page)", "language": selectedLanguage, "category": selectedCategory, "country": selectedCountry]
        
        //API Call
        NetworkManager.shared.getNews(generalType: NewsResponse.self, parameters: param, endPont: .topHeadLines) { result in
            RappleActivityIndicatorView.stopAnimation()
            switch result{
                
            case .success(let res):
                DispatchQueue.main.async {
                    DispatchQueue.main.async {
                        self.searchResult += res.articles ?? []
                        self.totalResult = res.totalResults ?? 0
                    }
                  }
            case .failure(let error):
                self.isShowAlert = true
                self.alertMessage = error.localizedDescription
                self.alertTitle = "Error"
            }
        }
    }
}

enum UseFor{
    case breakingNews
    case topNews
    case search
}
