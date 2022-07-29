//
//  HomeView.swift
//  Location
//
//  Created by macbook on 26/07/2022.
//

import MapKit
import SwiftUI

struct HomeView: View {
    @StateObject private var manager = LocationManager()
    
    private var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            VStack {
                Image("connected_world")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                Text(viewModel.profile?.content.name ?? "unknown name")
                    .font(.title)
                    .bold()
                Text(viewModel.profile?.content.email ?? "unknown email")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                
            }
            .foregroundColor(.white)
            .padding(.bottom)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            
            Map(coordinateRegion: $manager.region, showsUserLocation: true)
                .frame(minWidth: 0, maxWidth: .infinity,maxHeight: .infinity)
            
            Text("\(viewModel.information?.content.value ?? "Unknown value") data from \(viewModel.information?.content.source ?? "Unknown source")  ")
                .font(.caption)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
        }
        .onAppear(perform: fetch)
        
    }
    private func fetch() {
        viewModel.getData()
       }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
