//
//  BreakingNewsCardView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct BreakingNewsCardView: View {
    
    //MARK: - Variables
    var article : Article?

    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.black
            
            WebImage(url: URL(string: article?.urlToImage ?? ""))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.black)
                }
                .indicator(.activity)
                .frame(width: 321, height: 240)
                .scaledToFill()
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                )
            
            VStack(spacing: 0){
                HStack {
                    Text("by \(article?.author ?? "unknown")")
                        .foregroundColor(.white)
                        .font(.custom(.NunitoExtraBold, 10))
                    Spacer()
                }
                .padding(.top, 80)
                
                HStack{
                    Text(article?.title ?? "N/A")
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.custom(.NunitoBold, 20))
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Text(article?.articleDescription ?? "N/A")
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .font(.custom(.NunitoRegular, 10))
                    Spacer()
                }
                .padding(.bottom, 16)
            }
            .padding(.horizontal, 16)
        }
        
        .frame(width: 321, height: 240)
        .cornerRadius(16)
    }
}

// MARK: - PREVIEW
struct BreakingNewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingNewsCardView()
            .previewLayout(.sizeThatFits)

    }
}
