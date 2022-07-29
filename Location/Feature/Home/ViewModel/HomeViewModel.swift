//
//  HomeViewModel.swift
//  Location
//
//  Created by macbook on 27/07/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    let mockApi = MockApi()
    var profile: DataInformationElement? = nil
    var map: DataInformationElement? = nil
    var information: DataInformationElement? = nil
    
    @Published  var data: DataInformation? = []
    func getData() {
        data =  mockApi.retreiveInformation()
        if data != nil {
            profile = data?[0]
            map = data?[1]
            information =  data?[2]
        }
    }
}
