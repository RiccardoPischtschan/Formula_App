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
    private let mode = ["F1","Light","Dark","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    @State var name = ""
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                
                VStack{
                    Text("Your Settings")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    HStack{
                        Text("App Style")
                            .foregroundColor(.red)
                        
                        Picker("", selection: $selectedMode) {
                            ForEach(0 ..< mode.count) { index in
                                Text(mode[index])
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.878, brightness: 0.988, opacity: 0.949))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 140, height: 100)
                        .padding()
                    }
                  
                    
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
