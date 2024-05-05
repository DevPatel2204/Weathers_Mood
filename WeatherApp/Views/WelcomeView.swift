//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Dev Patel on 05/05/24.
//

import SwiftUI
import CoreLocationUI
struct WelcomeView: View {
    var body: some View {
        
        @EnvironmentObject var locationManager:
        LocationManager
        
        VStack{
            VStack(spacing:20){
                Text("Welcome to the Weather App")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Please share your current Location to get get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
