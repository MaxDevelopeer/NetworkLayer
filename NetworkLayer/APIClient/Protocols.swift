//
//  Protocols.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

//import Foundation
//
//typealias Parameters = [String : Any]
//typealias response = (Result <Data,Error>) -> ()
//
//
//
//protocol HTTPRequestProtocol {
//
//    func getDataWith(completion: @escaping response)
//
//}
//
//
//// core layer
//protocol NetworkRequestConstructor {
//
//   func asUrlRequest() throws -> HTTPRequestProtocol
//
//}
//
//
//// core layer
//protocol HTTPGetRequest {
//
//    static func defaultRequestFor(resource: NetworkRequestConstructor, completion: @escaping response)
//
//}
//
//
//
//extension HTTPGetRequest {
//
//    static func defaultRequestFor(resource: NetworkRequestConstructor, completion: @escaping response) {
//
//        guard let request = try? resource.asUrlRequest() else { return }
//
//        request.getDataWith { result in
//            switch result {
//            case .success(let data):
//                completion(.success(data))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//
//}























//
//enum DeserializeType {
//
//    enum Application {
//        case json
//        case xml
//        case zip
//        case pdf
//    }
//    enum Audio {
//        case mpeg
//    }
//
//    enum Image {
//        case gif
//        case jpeg
//        case png
//    }
//
//    enum Video {
//        case mp4
//    }
//
//    enum Multipart {
//        case formData
//    }
//
//    enum Text {
//        case css
//        case html
//        case plain
//    }
//
//}
//
//enum DeserializeValue {
//
//
//}
//
//
//protocol Deserializeble {
//    func deserializeWith(type: DeserializeType) throws ->
//}
//
//
//
//protocol Mapper {
//    func map(_ object: Dictionary<String,Any>) -> Self?
//}
//
//
//final class User: Mapper {
//
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func map(_ object: Dictionary<String,Any>) -> User? {
//        guard let name = object["name"] as? String, let age = object["age"] as? Int else { return nil }
//        return User(name: name, age: age)
//    }
//
//
//}








//protocol Deserialize {
//    static func deserialize(
//}
//
//protocol Parserable {
//    func parse() throws -> String
//}

//protocol Serializer {}

//protocol Validator {
//    func validate() throws -> Bool
//}
