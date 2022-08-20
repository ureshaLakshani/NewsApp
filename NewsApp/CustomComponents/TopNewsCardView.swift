//
//  TopNewsCardView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopNewsCardView: View {
    
    // MARK: - Variables
    var article : Article?

    // MARK: - Body
    var body: some View {
        ZStack{
            Color.black
            
            WebImage(url: URL(string: article?.urlToImage ?? ""))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.black)
                }
                .indicator(.activity)
                .frame(width: UIScreen.main.bounds.width - 32, height: 128)
                .scaledToFill()
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                )
            
            VStack{
                HStack{
                    Text(article?.title ?? "N/A")
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.custom(.NunitoBold, 14))
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Text(article?.author ?? "Unknown")
                        .foregroundColor(.white)
                        .font(.custom(.NunitoBold, 12))
                    Spacer()
                    Text(Helpers.parseApiDateString(article?.publishedAt ?? "", format: .EEEEDMMMYYYY))
                        .foregroundColor(.white)
                        .font(.custom(.NunitoBold, 12))
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
                
            }
        }
        .frame(height: 128)
        .cornerRadius(16)
    }
}

struct TopNewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsCardView()
            .previewLayout(.sizeThatFits)

    }
}
