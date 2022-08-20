//
//  FilterContentCardView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import SwiftUI

struct FilterContentCardView: View {
    
    // MARK: - PROPERTIES
    var name : String = "Sample"
    
    // MARK: - BODY
    var body: some View {
        VStack{
            
            Button {
                
            } label: {
                Text(name)
                    .foregroundColor(.black)
                    .font(.custom(.NunitoSemibold, 12))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
        }
    }
}

// MARK: - PREVIEW
struct FilterContentCardView_Previews: PreviewProvider {
    static var previews: some View {
        FilterContentCardView()
            .previewLayout(.sizeThatFits)
    }
}
