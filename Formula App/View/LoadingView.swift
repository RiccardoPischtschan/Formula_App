//
//  LoadingView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 26.07.23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            VStack{
                Image("F1LOGO 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .offset(y: 150)
                Text("Ergast API")
                    .foregroundColor(.white)
                    .position(x: 280, y: 550)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
