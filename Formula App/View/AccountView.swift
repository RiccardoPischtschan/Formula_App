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
  
    @State private var showCircle = 0
    @State private var removeInnerFill = 45
    @State private var showCheckmark = false
    @State private var rotate3D = -180
    
    var body: some View {
        NavigationView{
            VStack{
                
                if dataManager.currentUser.color == "Light"{
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .foregroundStyle(.linearGradient(colors: [.red, Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")")], startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width:1000, height: 100)
//                        .rotationEffect(.degrees(180))
//                        .offset(y: -250)
//                       
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.custom("RussoOne-Regular", size: 36))
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width:1000, height: 100)
//                        .rotationEffect(.degrees(135))
//                        .offset(y: -250)
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.custom("RussoOne-Regular", size: 36))
                }
                
                
                                
                                    
                
                                    if dataManager.currentUser.color == "Alfa Romeo" || dataManager.currentUser.color == "Haas" || dataManager.currentUser.color == "Williams" {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .frame(width: 300, height: 130)
                                                .foregroundColor(Color(appColorStyle(for: dataManager.currentUser.color) ?? ""))

                                            Image("\(dataManager.currentUser.color) 1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame( width: 280 ,height: 130)
                                                .cornerRadius(20)
                                        }
                                    } else if dataManager.currentUser.color == "McLaren"  {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 15)
                                                .frame(width: 300, height: 50)
                                                .foregroundColor(Color(appColorStyle(for: dataManager.currentUser.color) ?? ""))

                                            Image("\(dataManager.currentUser.color) 1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame( width: 280 ,height: 130)
                                                .offset(y: 5)

                                        }
                                    }else if dataManager.currentUser.color == "Light" || dataManager.currentUser.color == "F1"{

                                        Image("formula-1-logo")
                                            .resizable()
                //                            .aspectRatio(contentMode: .fit)
                                            .frame( width: 300 ,height: 130)
                                            .cornerRadius(20)
//                                            .offset(y: 15)
                                    }else {

                                        Image("\(dataManager.currentUser.color) 1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame( width: 300 ,height: 130)
                                            .cornerRadius(20)
                                    }
            
                    
                        if dataManager.currentUser.color != "Light" {
                            HStack{
                                Image(systemName: "person.crop.rectangle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)


                                TextField("", text: $name, prompt: Text(dataManager.currentUser.name).foregroundColor(.white))
                                    .foregroundColor(.white)
                                    .font(.custom("RussoOne-Regular", size: 20))

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
                        } else {
                            HStack{
                                Image(systemName: "person.crop.rectangle")
                                    .resizable()
                                    .frame(width: 24, height: 24)                       .foregroundColor(.black)
                                    


                                TextField("", text: $name, prompt: Text(dataManager.currentUser.name).foregroundColor(.black))
                                    .foregroundColor(.black)
                                    .font(.custom("RussoOne-Regular", size: 20))

                            }
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.black)
                            )
                            .frame(width: 300)
                            .padding()
                            //                    .offset(y: 30)
                        }
                
                    HStack{
                        Text("App Style")
                            .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color")"))
                            .font(.custom("RussoOne-Regular", size: 24))

                        Picker("", selection: $selectedMode) {
                            ForEach(0 ..< mode.count) { index in
                                if dataManager.currentUser.color == "Red Bull" {
                                    Text(mode[index])
                                        .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color") 2"))
                                        .font(.custom("RussoOne-Regular", size: 18))
                                } else if dataManager.currentUser.color == "Aston Martin" || dataManager.currentUser.color == "Alpha Tauri" {
                                    Text(mode[index])
                                        .foregroundColor(.white)
                                        .font(.custom("RussoOne-Regular", size: 18))
                                } else {
                                    Text(mode[index])
                                        .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color")"))
                                        .font(.custom("RussoOne-Regular", size: 18))
                                }
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 140, height: 100)
                        .padding()
                    }
                    
                    AnimationsView(showCircle: $showCircle, removeInnerFill: $removeInnerFill, showCheckmark: $showCheckmark, rotate3D: $rotate3D)
                    

                    AccountInfoView(selectedMode: $selectedMode, name: $name, showCircle: $showCircle, removeInnerFill: $removeInnerFill, showCheckmark: $showCheckmark, rotate3D: $rotate3D)
                                .frame(height: 300)
                                .environmentObject(dataManager)
                                .offset(y: -100)

                        Divider()
                            .frame(height: 5)
                            .overlay( Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
                            .offset(y: -188)

//                }
            }
            .offset(y: 40)
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(DataManager())
    }
}
