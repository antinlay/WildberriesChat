//
//  Kandinsky.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 20.08.2024.
//

import SwiftUI
import OpenAPIURLSession
import OpenAPIRuntime

actor KandinskyImageGeneration: Observable {
    let config: URLSessionConfiguration
    
    var transport: URLSessionTransport
    var client: Client
    var modelId: Int = 4
    var uuid: String = ""
    var images: [String] = []
    
    init() {
        self.config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "X-Key": "Key 5D420063BF3EC14C8CD08C213F6C6D20",
            "X-Secret": "Secret 914C52A27C4430A58793933D6D9AD6EA"
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
    
    func generateMultiplatformBody(parameters: KandinskyParameters) -> MultipartBody<Operations.text2imageRun.Input.Body.multipartFormPayload> {
        let paramsDictionary: [String: Any] = [
            "type": "GENERATE",
            "style": parameters.style.rawValue,
            "width": parameters.imageSize.width,
            "height": parameters.imageSize.height,
            "numImages": parameters.numImages,
            "negativePromptUnclip": parameters.negativePrompt,
            "generateParams": [
                "query": parameters.prompt
            ]
        ]
        
        do {
            let params: Operations.text2imageRun.Input.Body.multipartFormPayload = .params(.init(
                payload: .init(
                    body: try .init(
                        unvalidatedValue: paramsDictionary))))
            let model_id: Operations.text2imageRun.Input.Body.multipartFormPayload = .model_id(.init(
                payload: .init(
                    body: HTTPBody(
                        stringLiteral: String(modelId)))))
            let multipartBody: MultipartBody = [params, model_id]
            return multipartBody
        } catch {
            print("Error: \(error)")
            return MultipartBody()
        }
    }
    
    func generateQuery(parameters: KandinskyParameters) async -> [UIImage] {
        do {
            let output = try await client.text2imageRun(body: .multipartForm(generateMultiplatformBody(parameters: parameters)))
            switch output {
            case .default(statusCode: let statusCode, let error):
                print("\(statusCode) \(error.body)")
            case .created(let ok):
                print(ok)
                if let jsonUuid = try ok.body.json.uuid {
                    uuid = jsonUuid
                } else {
                    print("No UUID found")
                }
            }
        } catch {
            print("Error: \(error)")
        }
        var status = "INITIAL"
        while status != "DONE" {
            if let getStatus = await getStatus() {
                status = getStatus
            }
        }
        return images.compactMap { $0.imageFromBase64 }
    }
    
    func getStatus() async -> String? {
        do {
            try await Task.sleep(nanoseconds: 10_000_000_000)
            let output = try await client.getGenerationStatus(path: .init(uuid: uuid))
            switch output {
            case .ok(let ok):
                if let jsonImages = try ok.body.json.images, let status = try ok.body.json.status {
                    images = jsonImages
                    return status
                } else {
                    print("No images found")
                    return "INITIAL"
                }
            case .default(statusCode: let statusCode, let error):
                print("\(statusCode) \(error.body)")
                return "\(statusCode) \(error.body)"
            }
        } catch {
            print("Error: \(error)")
            return "ERROR"
        }
    }
}
