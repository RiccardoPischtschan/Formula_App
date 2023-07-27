//
//  ContentView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//
import FirebaseFirestore
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel : FormulaViewModel
    @EnvironmentObject  var dataManager : DataManager
    @EnvironmentObject var firebaseAuth: FirebaseAuthService
    
    @State private var text = ""
    @State private var selectedOption = 0
    private let year = ["2023", "2022", "2021",  "2020", "2019", "2018", "2017",
                        "2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009",
                        "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001",
                        "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993",
                        "1992", "1991", "1990", "1989", "1988", "1987", "1986", "1985",
                        "1984", "1983", "1982", "1981", "1980", "1979", "1978", "1977",
                        "1976", "1975", "1974", "1973", "1972", "1971", "1970", "1969",
                        "1968", "1967", "1966", "1965", "1964", "1963", "1962", "1961",
                        "1960", "1959", "1958", "1957", "1956", "1955", "1954", "1953",
                        "1952", "1951", "1950"]
    
    @State private var selectedCircuitID: String?
    @State private var selectedCircuitIDBinding: Binding<String>?
    @State private var selectedYear: String?
    @State private var selectedYearBinding: Binding<String>?
    @State private var selectedCountry: String?
    @State private var selectedCountryBinding: Binding<String>?
    @State private var selectedRound: String?
    @State private var selectedRoundBinding: Binding<String>?
    @State private var selectedDate: String?
    @State private var selectedDateBinding: Binding<String>?
    @State private var isAccountViewPresented = false
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                if dataManager.currentUser.color == "Light"{
                    Color.white.edgesIgnoringSafeArea(.all)
                    
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                }
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                VStack{
                   
                        Image("F1LOGO 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                            .padding(-30)
                        
                    
                  
                    HStack {
                        Text("Race Info")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        Picker("", selection: $selectedOption) {
                            ForEach(0 ..< year.count) { index in
                                if dataManager.currentUser.color == "Red Bull" {
                                    Text(year[index])
                                        .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color") 2"))
                                } else {
                                    Text(year[index])
                                        .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Haas F1 Team Color")"))
                                }
                            }
                        }
                        
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100, height: 100)
                        .padding()
                        
                    }
                      
//                }
                       
                    
                    ZStack{
                     
                        Image("rennstrecke")
                            .resizable()
                            .frame(width: 350, height: 510)
                            .cornerRadius(40)
                            .overlay{
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(lineWidth: 5)
                                    .foregroundStyle(.linearGradient(colors: [.white, Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "")")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                
                            }
                    
                        ScrollView{
                            
                            
                            
                            ForEach(homeViewModel.races, id: \.self) { race in
                                let circuitID = race.Circuit.circuitId
                                let yearId = race.season
                                let country = race.Circuit.Location.country
                                let round = race.round
                                let raceDate = race.date
                                
                                    NavigationLink(
                                        destination: CircuitDetails(circuitViewModel: FormulaViewModel(), circuitID: selectedCircuitIDBinding ?? .constant(circuitID),selectedYear: selectedYearBinding ?? .constant(yearId), selectedCountry: selectedCountryBinding ?? .constant(country), selectedRound: selectedRoundBinding ?? .constant(round), selectedDate: selectedDateBinding ?? .constant(raceDate)),
                                        label: {
                                            SeasonRow(formula: race)
                                                .frame(width: 300)
                                        })
                                        .onTapGesture {
                                        selectedCircuitID = circuitID
                                        selectedCircuitIDBinding = Binding<String>(get: { circuitID }, set: { _ in })
                                        selectedYear = yearId
                                        selectedYearBinding = Binding<String>(get: { yearId }, set: { _ in })
                                        selectedCountry = country
                                        selectedCountryBinding = Binding<String>(get: { country }, set: { _ in })
                                        selectedRound = round
                                        selectedRoundBinding = Binding<String>(get: { round }, set: { _ in })
                                        selectedDate = raceDate
                                        selectedDateBinding = Binding<String>(get: { raceDate }, set: { _ in })
                                        }
                                }
                           
                            
                            .onChange(of: selectedOption) { newValue in
                                let selectedYear = year[newValue]
                                homeViewModel.fetchFormulaApiResponse(selectedYear,"race")
                                
                            }
                            .onAppear {
                                let selectedYear = year[selectedOption]
                                
                                
                                    homeViewModel.fetchFormulaApiResponse(selectedYear, "race")
                                    dataManager.fetchUser()
                                   
                            
                        
                                print(dataManager.currentUser.name)
                            }
                        }
                        .foregroundColor(.black)
                        .background(.clear)
                        .frame(width: 350 ,height: 506)
                }
                    VStack{
                    
                        
                    }
                    .padding()
                }
               
                
                
                
            }
            .frame(height: 900)
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FormulaViewModel())
            .environmentObject(DataManager())
    }
}
