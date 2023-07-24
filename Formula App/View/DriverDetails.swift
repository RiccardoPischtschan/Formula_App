//
//  DriverDetails.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 24.07.23.
//

import SwiftUI


struct DriverDetails: View {
    @EnvironmentObject var driverViewModel : FormulaViewModel
    @EnvironmentObject  var dataManager : DataManager
    @Binding var selectedDriverId: String
    @Binding var selectedDriverCode: String
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ForEach(driverViewModel.driverInfo, id: \.self) { driver in
                    VStack{
                        
                        
                        HStack{
                            Text(driver.givenName)
                                .foregroundColor(.white)
                                .bold()
                                .font(.largeTitle)
                            
                            Text(driver.familyName)
                                .foregroundColor(.white)
                                .bold()
                                .font(.largeTitle)
                        }
                        Image("\(driverPic(for: selectedDriverCode) ?? "")_front")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                        ZStack{
                            
                            
                          HStack{
                           
                                Text("Driver Code")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.subheadline)
                                Text(driver.code)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .onAppear{
                driverViewModel.fetchFormulaApiResponse("drivers/\(selectedDriverId)", "driverInfo")
            }
        }
    }
}

struct DriverDetails_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetails(selectedDriverId: .constant("max_verstappen"), selectedDriverCode: .constant("VER"))
            .environmentObject(FormulaViewModel())
            .environmentObject(DataManager())
    }
}
