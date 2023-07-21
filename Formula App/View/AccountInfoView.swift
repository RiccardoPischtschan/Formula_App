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
    private let mode = ["F1","Light","Dark","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    var body: some View {
        ZStack{
            Color.clear.edgesIgnoringSafeArea(.all)
            VStack{
                

                
                
                Button{
                    let selectedModeText = mode[selectedMode]
                    dataManager.addUserInfo(userInfo: firebaseAuth.user?.uid ?? "", name: name, color: selectedModeText)
                    
                    
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
//                .offset(y: 100)
                
                Button{
                    
                    firebaseAuth.signOut()
                    
                    
                } label: {
                    Text("Log Out")
                        .bold()
                        .frame(width: 200,height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.red,.white], startPoint: .top, endPoint: .bottomTrailing ))
                        )
                        .foregroundColor(.black)
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
