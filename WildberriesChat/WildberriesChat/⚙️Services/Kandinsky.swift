//
//  Kandinsky.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 20.08.2024.
//

import Foundation
import OpenAPIURLSession
import OpenAPIRuntime

actor KandinskyImageGeneration {
    let config: URLSessionConfiguration
    
    var transport: URLSessionTransport
    var client: Client
    var modelId: Int = 4
    var uuid: String = ""
    var images: [String] = []
    
    init() {
        self.config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "X-Key": "Key FD2DAE1D7AAF62CA0117466807A09C98",
            "X-Secret": "Secret CE27DB724B078C37CE3408E41793FEAE"
        ]
        
        self.transport = URLSessionTransport()
        transport.configuration.session = URLSession(configuration: config)
        
        self.client = Client(serverURL: try! Servers.server1(), transport: transport)
        
        Task {
            await getModelId()
        }
    }
    
    func getModelId() async {
        do {
            let output = try await client.modelsGet()
            switch output {
            case .ok(let ok):
                if let model = try ok.body.json.last, let id = model.id {
                    modelId = id
                } else {
                    print("No models found")
                }
            case .default(statusCode: let statusCode, let error):
                print("\(statusCode) \(error.body)")
            }
        } catch {
            print("Error: \(error)")
        }
    }
        
//    func generateQuery(promt: String, style: KandinskyStyle, numImages: Int = 1, imageSize: KandinskyImageSize = .square, negativePromt: String = "") async {
//        let parameters = Parameters(
//            type: "GENERATE",
//            style: style.rawValue,
//            width: imageSize.width,
//            height: imageSize.height,
//            numImages: numImages,
//            negativePromptUnclip: "яркие цвета, кислотность, высокая контрастность, \(negativePromt)",
//            generateParams: GenerateParams(query: promt)
//        )
//        
//        do {
//            let jsonData = try JSONEncoder().encode(parameters)
//            let body = OpenAPIRuntime.HTTPBody(jsonData)
//            do {
//                let output = try! await client.text2imageRun(body: .multipartForm(.init(arrayLiteral: .params([.init(payload: .init(body: body))]))))
//                switch output {
//                case .ok(let ok):
//                    if let jsonUuid = try ok.body.json.uuid {
//                        uuid = jsonUuid
//                    } else {
//                        print("No UUID found")
//                    }
//                case .default(statusCode: let statusCode, let error):
//                    print("\(statusCode) \(error.body)")
//                }
//            } catch {
//                print("Error: \(error)")
//            }
//            // Use the body in your request
//        } catch {
//            // Handle error
//            print("Error: \(error)")
//        }
//
//    }
    
    func getQuery(promt: String, style: KandinskyStyle, numImages: Int = 1, imageSize: KandinskyImageSize = .square, negativePromt: String = "") {
        let url = URL(string: "https://api-key.fusionbrain.ai/key/api/v1/text2image/run")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.setValue("Key FD2DAE1D7AAF62CA0117466807A09C98", forHTTPHeaderField: "X-Key")
        request.setValue("Secret CE27DB724B078C37CE3408E41793FEAE", forHTTPHeaderField: "X-Secret")

        let parameters: [String: Any] = [
            "type": "GENERATE",
            "style": style.rawValue,
            "width": imageSize.width,
            "height": imageSize.height,
            "numImages": numImages,
            "negativePromptUnclip": "яркие цвета, кислотность, высокая контрастность, \(negativePromt)",
            "generateParams": [
                "query": promt
            ]
        ]
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"params\"; filename=\"params.json\"\r\n".data(using: .utf8)!)
            data.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
            data.append(jsonData)
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"model_id\"\r\n\r\n".data(using: .utf8)!)
            data.append("4\r\n".data(using: .utf8)!)
            data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        } catch {
            print("Error: \(error)")
        }

        let task = URLSession.shared.uploadTask(with: request, from: data) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                   let serverResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
                } catch {
                    print("Error: \(error)")
                }
            }
        }

        task.resume()
    }
    
    func getStatus() async {
        do {
            let output = try await client.getGenerationStatus(path: .init(uuid: uuid))
            switch output {
            case .ok(let ok):
                if let jsonImages = try ok.body.json.images {
                    images = jsonImages
                } else {
                    print("No images found")
                }
            case .default(statusCode: let statusCode, let error):
                print("\(statusCode) \(error.body)")
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
}


struct GenerateParams: Codable {
    let query: String
}

struct Parameters: Codable {
    let type: String
    let style: String
    let width: Int
    let height: Int
    let numImages: Int
    let negativePromptUnclip: String
    let generateParams: GenerateParams
}

struct ServerResponse: Codable {
    let status: String
    let uuid: String
}
