//
//  RoundedCornersShape.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    
    // MARK: - PROPERTIES
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

