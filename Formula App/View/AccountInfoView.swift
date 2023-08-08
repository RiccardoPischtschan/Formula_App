//
//  AccountInfoView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 18.07.23.
//

import SwiftUI

struct AccountInfoView: View {
    @EnvironmentObject var firebaseAuth: FirebaseAuthService
    @EnvironmentObject var dataManager : DataManager
    @Binding var selectedMode : Int
    @Binding var name : String
    
    @Binding var showCircle : Int
    @Binding var removeInnerFill : Int
    @Binding var showCheckmark : Bool
    @Binding var rotate3D : Int
    
    private let mode = ["F1","Light","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    var body: some View {
        
        ZStack{
            
//            Color.clear.edgesIgnoringSafeArea(.all)
            VStack{
               
//                AnimationsView(showCircle: $showCircle, removeInnerFill: $removeInnerFill, showCheckmark: $showCheckmark, rotate3D: $rotate3D)
                
                
                Button{
                                        let selectedModeText = mode[selectedMode]
                    
                    if name.count != 0 {
                        dataManager.addUserInfo(userInfo: firebaseAuth.user?.uid ?? "", name: name, color: selectedModeText)
                        dataManager.fetchUser()
                        
                        showCircle = 1
                        
                        removeInnerFill  = 4
                        rotate3D = 180
                        showCheckmark = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            showCircle = 0
                            
                            removeInnerFill  = 45
                            rotate3D = -180
                            showCheckmark = false
                        }

                        
                    } else if name.count == 0 {
                        let nameSave = dataManager.currentUser.name
                        if nameSave.count != 0 {
                            dataManager.addUserInfo(userInfo: firebaseAuth.user?.uid ?? "", name: nameSave, color: selectedModeText)
                            dataManager.fetchUser()
                            
                            showCircle = 1
                            
                            removeInnerFill  = 4
                            rotate3D = 180
                            showCheckmark = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                showCircle = 0
                                
                                removeInnerFill  = 45
                                rotate3D = -180
                                showCheckmark = false
                            }

                        }
                    }
                    
                    
                } label: {
                    if dataManager.currentUser.color == "Light" || dataManager.currentUser.color == "Haas"{
                        Text("Speichern")
                            .bold()
                            .frame(width: 200,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.black,.black], startPoint: .top, endPoint: .bottomTrailing ))
                            )
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.white))
                    }
                    
                    else if dataManager.currentUser.color == "Red Bull" {
                        Text("Speichern")
                            .bold()
                            .frame(width: 200,height: 40)
                            .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color") 3")], startPoint: .top, endPoint: .bottomTrailing ))
                                                )
                                                .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color") 2"))
                            }
                     else  {
                        Text("Speichern")
                            .bold()
                            .frame(width: 200,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"),.white], startPoint: .top, endPoint: .bottomTrailing ))
                            )
                            .foregroundColor(.white)
                    }
                }
                .padding(.top)
          
                if dataManager.currentUser.color == "Light" || dataManager.currentUser.color == "Haas"{

                Button{

                    firebaseAuth.signOut()

                } label: {

                    Text("Log Out")
                        .bold()
                        .frame(width: 200,height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.black,.black], startPoint: .top, endPoint: .bottomTrailing ))
                        )
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white))
                }

            }
                    else if dataManager.currentUser.color == "Red Bull" {
                        Button{

                            firebaseAuth.signOut()


                        } label: {
                            Text("Log Out")
                                .bold()
                                .frame(width: 200,height: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color") 3")], startPoint: .top, endPoint: .bottomTrailing ))
                                )
                                .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color") 2"))
                        }

                    }
                
                

                else {
                    Button{
                      
                        
                            firebaseAuth.signOut()
                        
                        
                    } label: {
                        Text("Log Out")
                            .bold()
                            .frame(width: 200,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .white], startPoint: .top, endPoint: .bottomTrailing ))
                            )
                            .foregroundColor(.white)
                    }

                  }
                }
               

            }
            .frame(height: 100)
        }
    }


//struct AccountInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountInfoView(selectedMode: .constant(1), name: .constant(""), showCircle: .constant(0), removeInnerFill: constant(45), showCheckmark: constant(false), rotate3D: constant(-180))
//            .environmentObject(FirebaseAuthService())
//            .environmentObject(DataManager())
//    }
//}
