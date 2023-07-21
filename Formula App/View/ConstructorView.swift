//
//  ConstructorView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 12.07.23.
//

import SwiftUI

struct ConstructorView: View {
    @ObservedObject var constructorViewModel = FormulaViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                VStack{
                    Text("Constructor Standings")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    HStack{
                        
                    }
                    .offset(x: -10)
                    VStack{
                        ScrollView{
                            ForEach(constructorViewModel.constructor, id: \.self){ constructor in
                               ConstructorStandingsRow(constructor: constructor)
                            }
                            .frame(width: 360)
                        }
                        
                    }
                    
                    .onAppear{
                        constructorViewModel.fetchFormulaApiResponse("current/constructorStandings","constructor")
                    }
                    VStack{
                        Spacer()
                    }
                }
                
            }
            
        }
       
    }
}

    
struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
    }
}