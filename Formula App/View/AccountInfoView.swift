//
//  AccountInfoView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 18.07.23.
//

import SwiftUI

struct AccountInfoView: View {
    @EnvironmentObject var dataManger: DataManager
    @State private var selectedMode = 0
    private let mode = ["F1","Light","Dark","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    @State private var name = ""
    var body: some View {
        ZStack{
            Color.clear.edgesIgnoringSafeArea(.all)
            VStack{
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
                .padding()
                HStack{
                    Image(systemName: "person.crop.rectangle")
                        .foregroundColor(.white)
                    TextField("", text: $name, prompt: Text("Name").foregroundColor(.white))
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
                .offset(y: 30)
                
                
                Button{
                    let selectedModeText = mode[selectedMode]
                    //                            DataManager.addUserInfo(userInfo: firebaseAuth.user?.uid ?? "", name: name, color: selectedModeText)
                    //
                    
                } label: {
                    Text("Speichern")
                        .bold()
                        .frame(width: 200,height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.red,.white], startPoint: .top, endPoint: .bottomTrailing ))
                        )
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 100)
            }
            .frame(height: 100)
        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView()
    }
}
