//
//  TabView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 12.07.23.
//

import SwiftUI


struct MainView: View {
   
    @StateObject var homeViewModel = FormulaViewModel()
    @StateObject var dataManager = DataManager()
    let customFont = UIFont(name: "RussoOne-Regular", size: 10)!
    
    var body: some View {
        TabView {
            NavigationStack {
                if dataManager.currentUser.color == "Light"{
                    HomeView()
                        .preferredColorScheme(.light)
                } else {
                    HomeView()
                        .preferredColorScheme(.dark)
                }
            }
            .tabItem {

                Image(systemName: "flag.checkered")
                    Text("Home")
                
            }
            .font(Font(customFont))
            
            NavigationStack {
                DriverView()
            }
            .tabItem {
                Label("Driver", systemImage: "figure.mixed.cardio")
                 
            }
            NavigationStack {
                ConstructorView()
            }
            .tabItem {
                Label("Constructor", systemImage: "car")
                   
            }

            NavigationStack {
                AccountView()
            }
            .tabItem {
                Label("\(dataManager.currentUser.name)", systemImage: "person.and.background.dotted")
                    
            }
        }
   
        .font(.custom("RussoOne-Regular", size: 10))
        .accentColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color")"))
        
        
        
        .frame(height: 810)
        .offset(y:25)
        .environmentObject(homeViewModel)
        .environmentObject(dataManager)
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            
    }
}
