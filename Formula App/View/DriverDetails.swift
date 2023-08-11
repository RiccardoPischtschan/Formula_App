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
            if dataManager.currentUser.color == "Light"{
                Color.white.edgesIgnoringSafeArea(.all)
                
            } else {
                Color.black.edgesIgnoringSafeArea(.all)
                
            }
            VStack{
                ForEach(driverViewModel.driverInfo, id: \.self) { driver in
                    VStack{
                        
                        
                        HStack{
                            Text(driver.givenName)
                                .foregroundColor(.white)
                                .font(.custom("RussoOne-Regular", size: 32))
                                .font(.largeTitle)
                            
                            Text(driver.familyName)
                                .foregroundColor(.white)
                                .font(.custom("RussoOne-Regular", size: 32))
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
                                        .font(.custom("RussoOne-Regular", size: 14))
                                        .font(.subheadline)
                                    Text(driver.code)
                                        .foregroundColor(.white)
                                        .font(.custom("RussoOne-Regular", size: 14))
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
                                        .font(.custom("RussoOne-Regular", size: 14))
                                        .font(.subheadline)
                                    Text(driver.permanentNumber)
                                        .foregroundColor(.white)
                                        .font(.custom("RussoOne-Regular", size: 14))
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
                                        .font(.custom("RussoOne-Regular", size: 14))
                                        .font(.subheadline)
                                    Text(reformatDate(_: driver.dateOfBirth))
                                        .foregroundColor(.white)
                                        .font(.custom("RussoOne-Regular", size: 14))
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
                                        .font(.custom("RussoOne-Regular", size: 14))
                                        .font(.subheadline)
                                    Text(driver.nationality)
                                        .foregroundColor(.white)
                                        .font(.custom("RussoOne-Regular", size: 14))
                                        .font(.subheadline)
                                }
                                
                            }
                        }
                        
                    }
                }
                VStack{
                ScrollView{
                    if dataManager.currentUser.color != "Light"{
                        Text("Karriere")
                            .foregroundColor(.white)
                            .font(.custom("RussoOne-Regular", size: 32))
                            .font(.title)
                        Text("\(driverInfo(for: selectedDriverCode) ?? "")")
                            .font(.custom("RussoOne-Regular", size: 14))
                            .foregroundColor(.white)
                            .frame(width: 360)
                    } else {
                        Text("Karriere")
                            .foregroundColor(.black)
                            .font(.custom("RussoOne-Regular", size: 32))
                            .font(.title)
                        Text("\(driverInfo(for: selectedDriverCode) ?? "")")
                            .font(.custom("RussoOne-Regular", size: 14))
                            .foregroundColor(.black)
                            .frame(width: 360)
                    }
                    }
                .frame(height: 289)
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
        DriverDetails(selectedDriverId: .constant("max_verstappen"), selectedDriverCode: .constant("ALB"))
            .environmentObject(FormulaViewModel())
            .environmentObject(DataManager())
    }
}
