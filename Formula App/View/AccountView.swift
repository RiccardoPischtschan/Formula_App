//
//  AccountView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 05.07.23.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    
    
    @EnvironmentObject var dataManager : DataManager
    @State private var selectedMode = 0
    private let mode = ["F1","Light","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    @State var name = ""
    
    
    var body: some View {
        NavigationView{
            ZStack{
             
                if dataManager.currentUser.color == "Light"{
                    Color.white.edgesIgnoringSafeArea(.all)
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:1000, height: 100)
                        .rotationEffect(.degrees(135))
                        .offset(y: -250)
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:1000, height: 100)
                        .rotationEffect(.degrees(135))
                        .offset(y: -250)
                }
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                
                VStack{
                    Text("Your Settings")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                   
                  
                    
                        Image("\(dataManager.currentUser.color) 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame( width: 300 ,height: 130)
                            .cornerRadius(20)
                    
                    
                    HStack{
                        Image(systemName: "person.crop.rectangle")
                            .foregroundColor(.white)
                        
                        
                            TextField("", text: $name, prompt: Text(dataManager.currentUser.name).foregroundColor(.white))
                                .foregroundColor(.white)
                       
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                    )
                    .frame(width: 300)
                    .padding()
//                    .offset(y: 30)
                    
                    HStack{
                        Text("App Style")
                            .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color")"))
                        
                        Picker("", selection: $selectedMode) {
                            ForEach(0 ..< mode.count) { index in
                                if dataManager.currentUser.color == "Red Bull" {
                                    Text(mode[index])
                                        .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color") 2"))
                                } else {
                                    Text(mode[index])
                                        .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color")"))
                                }
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 140, height: 100)
                        .padding()
                    }
                    
                    
                    AccountInfoView(selectedMode: $selectedMode, name: $name)
                        .frame(height: 300)
                        .environmentObject(dataManager)
                   
                }
            }
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(DataManager())
    }
}
