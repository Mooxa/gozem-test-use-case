//
//  MockApi.swift
//  Location
//
//  Created by macbook on 27/07/2022.
//

import Foundation

final class MockApi {
    
    func retreiveInformation() -> DataInformation? {
        if let localData = self.readLocalFile(forName: "DataInformation") {
             return self.parse(jsonData: localData)
        }
        return nil
    }
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        }
        catch {
            print("decode error")
        }
        
        
        return nil
    }
    
    
    private func parse(jsonData: Data) -> DataInformation? {
        do {
            let decodedData = try JSONDecoder().decode(DataInformation.self,
                                                       from: jsonData)
            print("Title: ", decodedData)
            print("===================================")
            return decodedData

        }
        catch DecodingError.dataCorrupted(let context) {
            print("Key not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let error{
            print("error: ", error)
        }
        return nil
    }
}
