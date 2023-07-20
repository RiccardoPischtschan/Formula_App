//
//  TabView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 12.07.23.
//

import SwiftUI

struct MainView: View {
   
    @StateObject var homeViewModel = FormulaViewModel()
    @StateObject  var dataManager = DataManager()
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
                    
            }
            .tabItem {
                Label("Home", systemImage: "flag.checkered")
            }
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
   
        
         .accentColor(.red)
//        .tint(.black)
        
        
        .frame(height: 810)
        .offset(y:25)
        .environmentObject(FormulaViewModel())
        .environmentObject(DataManager())
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
