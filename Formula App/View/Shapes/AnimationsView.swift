//
//  AnimationsView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 02.08.23.
//

import SwiftUI

struct AnimationsView: View {
    @Binding var showCircle : Int
    @Binding var removeInnerFill : Int
    @Binding var showCheckmark : Bool
    @Binding var rotate3D : Int
    @EnvironmentObject var dataManager : DataManager
    var body: some View {
//        VStack {
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: -1, y: -1))
                    path.addCurve(to: CGPoint(x: 21, y: 26), control1: CGPoint(x: -1, y: -1), control2: CGPoint(x: 22, y: 26))
                    path.addCurve(to: CGPoint(x: 56, y: -28), control1: CGPoint(x: 20, y: 26), control2: CGPoint(x: 56, y: -28))
                    path.move(to: CGPoint(x: -1, y: -1))
                }
                .trim(from: 0.0, to: showCheckmark ? 1.0 : 0.0)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .offset(x: 170, y: 65)
                .foregroundColor(showCheckmark ? .green : .red)
                .animation(Animation.easeInOut(duration: 1).delay(1.5))

                Circle()
                    .strokeBorder(lineWidth: CGFloat(removeInnerFill))
                    .animation(Animation.easeInOut(duration: 1).delay(0.25))
                    .frame(width: 120, height: 120)
                    .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
//                    .foregroundColor(.red)
                    .scaleEffect(Double(showCircle))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(0.1))
                    .rotation3DEffect(
                        .degrees(Double(rotate3D)),
                        axis: (x: 15, y: 15, z: 0.0))
                    .animation(Animation.timingCurve(1.000, -0.600, 1.000, 1.63).speed(0.2).delay(1.25))
            }

//            Button {
//                showCircle = 1
//                removeInnerFill = 4
//                rotate3D = 180
//                showCheckmark.toggle()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//                    showCircle = 0
//                    removeInnerFill = 45
//                    rotate3D = -180
//                    showCheckmark.toggle()
//                }
//
//            } label: {
//                Text("Bestätigen")
//            }
//        }
    }
}


struct AnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsView(showCircle: .constant(0), removeInnerFill: .constant(45), showCheckmark: .constant(false), rotate3D: .constant(-180))
            .environmentObject(DataManager())
    }
}
