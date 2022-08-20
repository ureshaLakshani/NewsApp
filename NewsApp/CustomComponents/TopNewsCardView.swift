//
//  TopNewsCardView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct TopNewsCardView: View {
    
    // MARK: - BODY
    var body: some View {
        ZStack{
            Color.black
            
            VStack{
                
                HStack{
                    Text("5 things to know about the 'conundrum' of lupus 5 things to know about the 'conundrum' of lupus")
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
                    Text("Matt Villano")
                        .foregroundColor(.white)
                        .font(.custom(.NunitoBold, 12))
                    Spacer()
                    Text("Sunday, 9 May 2021")
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

// MARK: - PREVIEW
struct TopNewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsCardView()
            .previewLayout(.sizeThatFits)

    }
}
