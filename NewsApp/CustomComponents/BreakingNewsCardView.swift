//
//  BreakingNewsCardView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct BreakingNewsCardView: View {
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.black
            
            VStack(spacing: 0){
                HStack {
                    Text("by Ryan Browne")
                        .foregroundColor(.white)
                        .font(.custom(.NunitoExtraBold, 10))
                    Spacer()
                }
                .padding(.top, 80)
                
                HStack{
                    Text("Crypto investors should be prepared to lose all their money, BOE governor says")
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.custom(.NunitoBold, 20))
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Text("“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”")
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
