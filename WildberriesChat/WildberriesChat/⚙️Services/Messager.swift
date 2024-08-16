//
//  Messager.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.08.2024.
//

import Foundation

//actor Messenger {
//    private var clients: [ClientMessanger] = []
//    private var messages: [Message] = []
//    private var results: [Result<Message, Error>] = []
//    
//    func addClientMessanger(_ client: ClientMessanger) {
//        clients.append(client)
//    }
//    
//    func sendMessage(_ message: Message) {
//        messages.append(message)
//    }
//    
//    func startProcessing() {
//        Task {
//            while !messages.isEmpty {
//                await distributeMessage()
//                try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 секунды между распределением сообщений
//            }
//        }
//    }
//    
//    func getClientMessangerStats() async -> [(name: String, completedTasks: Int, averageTime: TimeInterval)] {
//        var stats: [(name: String, completedTasks: Int, averageTime: TimeInterval)] = []
//        for client in clients {
//            let count = await client.completedTasksCount
//            let avgTime = await client.averageExecutionTime
//            stats.append((name: client.name, completedTasks: count, averageTime: avgTime))
//        }
//        return stats
//    }
//    
//    private func distributeMessage() async {
//        guard let message = messages.first else { return }
//        for client in clients {
//            if await !client.isBusy {
//                messages.removeFirst()
//                
//                Task {
//                    do {
//                        let result = try await client.processMessage(message)
//                        handleResult(result)
//                    } catch {
//                        messages.append(message)
//                    }
//                }
//                break
//            }
//        }
//    }
//    
//    private func handleResult(_ result: Result<Message, Error>) {
//        results.append(result)
//        Task { await syncResults() }
//    }
//    
//    private func syncResults() async {
//        for client in clients {
//            await client.sync(results: results)
//        }
//    }
//}
//
//// MARK: Реализация клиента
//class ClientMessanger {
//    let name: String
//    
//    private let messenger: Messenger
//    private var busy = false
//    private var completedTasks = 0
//    private var totalExecutionTime: TimeInterval = 0
//    
//    var isBusy: Bool {
//        get async { busy }
//    }
//    
//    var completedTasksCount: Int {
//        get async { completedTasks }
//    }
//    
//    var averageExecutionTime: TimeInterval {
//        get async {
//            guard completedTasks > 0 else { return 0 }
//            return totalExecutionTime / Double(completedTasks)
//        }
//    }
//    
//    init(name: String, messenger: Messenger) {
//        self.name = name
//        self.messenger = messenger
//    }
//    
//    func connect() async throws {
//        await messenger.addClientMessanger(self)
//    }
//    
//    func disconnect() async {
//        
//    }
//    
//    func processMessage(_ message: Message) async throws -> Result<Message, Error> {
//        busy = true
//        let startTime = Date()
//        // Симулируем время обработки от 1 до 4 секунд
//        try await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...4_000_000_000))
//        let executionTime = Date().timeIntervalSince(startTime)
//        busy = false
//        completedTasks += 1
//        totalExecutionTime += executionTime
//        return Result {
//            message
//        }
//    }
//    
//    func sync(results: [Result<Message, Error>]) async {
//        print("Process \(results.count) messages")
//    }
//}
//
//func runMessenger(messagesContent: [Content]) async throws {
//    let messenger = Messenger()
//    let client1 = ClientMessanger(name: "ClientMessanger1", messenger: messenger)
//    let client2 = ClientMessanger(name: "ClientMessanger2", messenger: messenger)
//    let client3 = ClientMessanger(name: "ClientMessanger3", messenger: messenger)
//    try await client1.connect()
//    try await client2.connect()
//    try await client3.connect()
//    for content in messagesContent {
//        await messenger.sendMessage(Message(id: UUID(), timestamp: Date(), sender: "Server", recipient: client1.name, content: content))
//    }
//    await messenger.startProcessing()
//    // Ждем завершения всех сообщений
//    try await Task.sleep(nanoseconds: 15_000_000_000)
//    let stats = await messenger.getClientMessangerStats()
//    for stat in stats {
//        
//    }
//    await client1.disconnect()
//    await client2.disconnect()
//    await client3.disconnect()
//}
//
//func main() {
//    let contents: [Content] = [
//        Content(text: "This is the first message", link: [URL(string: "https://example.com/1")], image: nil),
//        Content(text: "This is the second message", link: [URL(string: "https://example.com/2")], image: nil),
//        Content(text: "This is the third message", link: [], image: nil),
//        Content(text: "This is the fourth message", link: [URL(string:"https://example.com/4")], image: nil),
//        Content(text: "This is the fifth message", link: [URL(string: "https://example.com/5")], image: nil),
//        Content(text: "This is the sixth message", link: []),
//        Content(text: "This is the seventh message", link: [URL(string: "https://example.com/8")], image: nil),
//        Content(text: "This is the eighth message", link: [URL(string: "https://example.com/9"), URL(string:"https://example.com/10")], image: nil),
//        Content(text: "This is the ninth message", link: []),
//        Content(text: "This is the tenth message", link: [URL(string:"https://example.com/11")], image: nil)
//    ]
//    Task {
//        do {
//            try await runMessenger(messagesContent: contents)
//        } catch {
//            print(error)
//        }
//    }
//}
