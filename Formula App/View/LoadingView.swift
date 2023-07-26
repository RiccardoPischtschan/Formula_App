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
            
            Image("F1LOGO 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
