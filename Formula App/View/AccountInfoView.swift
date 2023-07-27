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
    private let mode = ["F1","Light","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    var body: some View {
        ZStack{
            Color.clear.edgesIgnoringSafeArea(.all)
            VStack{
                

                
                
                Button{
                    
                    let selectedModeText = mode[selectedMode]
                    
                    if name.count != 0 {
                        dataManager.addUserInfo(userInfo: firebaseAuth.user?.uid ?? "", name: name, color: selectedModeText)
                        dataManager.fetchUser()
                    } else if name.count == 0 {
                        let nameSave = dataManager.currentUser.name
                        if nameSave.count != 0 {
                            dataManager.addUserInfo(userInfo: firebaseAuth.user?.uid ?? "", name: nameSave, color: selectedModeText)
                            dataManager.fetchUser()
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
                    } else {
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
//                .offset(y: 100)
                
                Button{
                    
                    firebaseAuth.signOut()
                    
                    
                } label: {
                    if dataManager.currentUser.color == "Light" || dataManager.currentUser.color == "Haas"{
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
                    } else {
                        Text("Log Out")
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
//                    .offset(y: 100)
            }
            .frame(height: 100)
        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView(selectedMode: .constant(1), name: .constant(""))
//            .environmentObject(FirebaseAuthService())
            .environmentObject(DataManager())
    }
}
