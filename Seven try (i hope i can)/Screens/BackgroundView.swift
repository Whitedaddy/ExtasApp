//
//  BackgroundView.swift
//  ExtasApp
//
//  Created by MacBook on 14.01.2022.
//

import SwiftUI

struct BackgroundView: View {
    
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

    @State var UpdatePlaces: CGFloat = 3
    @State var CircleRadious: Bool = true
    
    var body: some View {
        ZStack
        {
            Color.black
            
            ForEach(0..<100, content:{
                index in
               
                    Circle()
                        .fill(Color.white)
                        .frame(width: CircleRadious ? 0:CGFloat.random(in:1...UpdatePlaces))
                        .offset(x: CGFloat.random(in:-200...200), y: CGFloat.random(in:-450...450))
                        .onReceive(timer) {
                        _ in
                        UpdatePlaces =  CGFloat.random(in:2...3) }
            }  )
            Color
                .black
                .opacity(CircleRadious ? 1:0)
                .animation(Animation
                            .easeInOut(duration: 2.0)
                            .repeatForever(autoreverses: true))
                .onAppear(perform: {CircleRadious.toggle()})
            
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
