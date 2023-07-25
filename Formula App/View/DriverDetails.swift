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
                            .offset(y:5)
                        
                        
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [.black, Color(constructorColor(for: driver.code)!)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width:180, height: 50)
                                //                                .offset(y: 60)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 5)
                                        //                                        .offset(y: 60)
                                            .foregroundStyle(.linearGradient(colors: [ Color(constructorColor(for: driver.code)!), .black], startPoint: .leading, endPoint: .trailing))
                                    )
                                
                                HStack{
                                    
                                    Text("Driver Code:")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                    Text(driver.code)
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [ Color(constructorColor(for: driver.code)!), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width:180, height: 50)
    //                                .offset(y: 60)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 5)
    //                                        .offset(y: 60)
                                            .foregroundStyle(.linearGradient(colors: [.black, Color(constructorColor(for: driver.code)!)], startPoint: .leading, endPoint: .trailing))
                                             )
                                
                              HStack{
                               
                                    Text("Driver Number:")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                    Text(driver.permanentNumber)
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                }
                            }
                        }
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [.black, Color(constructorColor(for: driver.code)!)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width:180, height: 50)
                                //                                .offset(y: 60)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 5)
                                        //                                        .offset(y: 60)
                                            .foregroundStyle(.linearGradient(colors: [ Color(constructorColor(for: driver.code)!), .black], startPoint: .leading, endPoint: .trailing))
                                    )
                                
                                VStack{
                                    
                                    Text("Date of Birth:")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                    Text(reformatDate(_: driver.dateOfBirth))
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundStyle(.linearGradient(colors: [ Color(constructorColor(for: driver.code)!), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width:180, height: 50)
    //                                .offset(y: 60)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 5)
    //                                        .offset(y: 60)
                                            .foregroundStyle(.linearGradient(colors: [.black, Color(constructorColor(for: driver.code)!)], startPoint: .leading, endPoint: .trailing))
                                             )
                                
                              HStack{
                               
                                    Text("Nationality:")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                    Text(driver.nationality)
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.subheadline)
                                }
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
