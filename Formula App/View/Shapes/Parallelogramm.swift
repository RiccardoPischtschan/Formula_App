//
//  Shapes.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import SwiftUI

struct Parallelogramm: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
       
        path.move(to: CGPoint(x : rect.midX, y : rect.minY))
        path.addLine (to : CGPoint(x: rect.maxX, y : rect.minY))
        path.addLine (to : CGPoint(x: rect.midX, y : rect.maxY))
        path.addLine (to : CGPoint(x: rect.midX, y : rect.maxY))
        path.addLine (to : CGPoint(x: rect.minX, y : rect.maxY))
             
        return path
    }
}


