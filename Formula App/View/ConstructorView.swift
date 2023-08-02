//
//  ConstructorView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 12.07.23.
//

import SwiftUI

struct ConstructorView: View {
    @ObservedObject var constructorViewModel = FormulaViewModel()
    @EnvironmentObject  var dataManager : DataManager
    var body: some View {
        VStack{
            if dataManager.currentUser.color == "Light"{
                NavigationStack{
                    ZStack{
                        Color.white.edgesIgnoringSafeArea(.all)
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.red, Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width:1000, height: 70)
                            .rotationEffect(.degrees(180))
                            .offset(y: -330)
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width:1000, height: 60)
                            .rotationEffect(.degrees(180))
                            .offset(y: -330)
                        VStack{
                            Text("Constructor Standings")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .offset(y: 5)
                            HStack{
                                
                            }
                            .offset(x: -10)
                            VStack{
                                ScrollView{
                                    ForEach(constructorViewModel.constructor, id: \.self){ constructor in
                                        ConstructorStandingsRow(constructor: constructor)
                                    }
                                    .frame(width: 360)
                                    .offset(y: -25)
                                }
                                
                            }
                            .frame(height: 653)
                    
                            .offset(y: 18)
                            VStack{
                                Divider()
                                    .frame(height: 5)
                                    .overlay(.linearGradient(colors: [.red, Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .offset(y: 7)
                            }
                        }
                        
                    }
                    
                    
                }
                
            } else {
                NavigationStack{
                    ZStack{
                        Color.black.edgesIgnoringSafeArea(.all)
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width:1000, height: 100)
                            .rotationEffect(.degrees(135))
                            .offset(y: -250)
                        VStack{
                            Text("Constructor Standings")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .offset(y: 5)
                            HStack{
                                
                            }
                            .offset(x: -10)
                            VStack{
                                ScrollView{
                                    ForEach(constructorViewModel.constructor, id: \.self){ constructor in
                                        ConstructorStandingsRow(constructor: constructor)
                                    }
                                    .frame(width: 360)
                                    .offset(y: -25)
                                }
                                
                                
                            }
                            .frame(height: 653)
                            .offset(y: 18)
                          
                            VStack{
                                Divider()
                                    .frame(height: 5)
                                    .overlay(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
                                    .offset(y: 7)
                            }
                        }
                        
                    }
                    
                    
                }
                
            }
            
        }
        .onAppear{
            constructorViewModel.fetchFormulaApiResponse("current/constructorStandings","constructor")
        }
    }
}

    
struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
            .environmentObject(DataManager())
    }
}
