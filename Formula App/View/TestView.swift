//
//  TestView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 09.08.23.
//

import SwiftUI

struct TestView: View {
    @Binding var selectedDriverId: String
    @Binding var selectedDriverCode: String
    var body: some View {
        VStack{
            Text(selectedDriverId)
            Text(selectedDriverCode)
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
