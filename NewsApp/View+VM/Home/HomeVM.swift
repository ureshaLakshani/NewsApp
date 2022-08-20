//
//  HomeVM.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation
import RappleProgressHUD

class HomeVM: ObservableObject{
    
    //MARK: - Variables
    @Published var isShowAlert = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    @Published var breakingNews : [Article] = []
    @Published var topNews : [Article] = []
    @Published var selectedArticle : Article?
    
}

//MARK: - Get Breaking News
extension HomeVM{
    
    func getBreakingNews(){
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
        let param = ["category":"general", "pageSize": "10"]
        
        //API Call - get all Breaking News list
        NetworkManager.shared.getNews(generalType: NewsResponse.self, parameters: param, endPont: .topHeadLines) { result in
            RappleActivityIndicatorView.stopAnimation()
            switch result{
                
            case .success(let res):
                DispatchQueue.main.async {
                    self.breakingNews = res.articles ?? []
                  }
            case .failure(let error):
                self.isShowAlert = true
                self.alertMessage = error.localizedDescription
                self.alertTitle = "Error"
            }
        }
    }
}


//MARK: - Get Top News
extension HomeVM{
    
    func getTopNews(){
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
        let param = ["q":"politics", "pageSize": "10"]
        
        //API Call - get all Top News  list
        NetworkManager.shared.getNews(generalType: NewsResponse.self, parameters: param, endPont: .everything) { result in
            RappleActivityIndicatorView.stopAnimation()
            switch result{
                
            case .success(let res):
                DispatchQueue.main.async {
                    self.topNews = res.articles ?? []
                  }
            case .failure(let error):
                self.isShowAlert = true
                self.alertMessage = error.localizedDescription
                self.alertTitle = "Error"
            }
        }
    }
}

