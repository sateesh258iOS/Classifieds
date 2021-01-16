//
//  DataParsable.swift
//  Infra
//
//  Created by NewZenTech on 5/22/19.
//  Copyright © 2019 NewZenTech. All rights reserved.
//

import Foundation


protocol DataParsable {
    static func convert(from data: Data?) throws -> Self
}


protocol RequiredDataParsable: DataParsable {
        
    static func convert(from data: Data) throws -> Self
}


struct DataConversionError: Error {
    let message: String
}


extension RequiredDataParsable {
    static func convert(from data: Data?) throws -> Self {
        if let data = data {
            return try convert(from: data)
        } else {
            throw DataConversionError(message: "Failed to get data from the server.")
        }
    }
}

// String as data convertible.

extension String: RequiredDataParsable {
    static func convert(from data: Data) throws -> String {
        if let result = String(data: data, encoding: .utf8) {
            return result
        } else {
            throw DataConversionError(message: "Failed to parse data into a utf8 string.")
        }
    }
}

 // Dictionary as data convertible.
 
extension Dictionary: DataParsable where Key: Any, Value:Any {
    static func convert(from data: Data?) throws -> Dictionary<Key, Value> {
        
        guard let dataResponse = data else {
            throw DataConversionError(message: "Failed to parse data into a utf8 string.")
        }
        do{
            //here dataResponse received from a network request
            let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: [])
            print(jsonResponse) //Response result
            return jsonResponse as! Dictionary<Key, Value>

        } catch let parsingError {
            print("Error", parsingError)
            throw DataConversionError(message: "Failed to parse data into a utf8 string.")
        }
        
    }
}

//extension Dictionary: RequiredDataParsable where Key: NSObject, Value:AnyObject {
//    static func convert(from data: Data) throws -> String {
//        if let result = String(data: data, encoding: .utf8) {
//            return result
//        } else {
//            throw DataConversionError(message: "Failed to parse data into a utf8 string.")
//        }
//    }
//}

// Parsing  empty response

struct Empty: DataParsable {
    static func convert(from data: Data?) throws -> Empty {
        return Empty()
    }
}


// Parsing to provided model class
struct DecodableConvertible<T: Decodable>: RequiredDataParsable {
    let model: T

    init(_ model: T) {
        self.model = model
    }

    static func convert(from data: Data) throws -> DecodableConvertible<T> {
        let decoder = JSONDecoder()
        let model = try decoder.decode(T.self, from: data)
        return DecodableConvertible(model)
    }
}
