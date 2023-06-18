import OpenAPIRuntime
import OpenAPIURLSession
@_exported import DiscourseClient
@_exported import DiscourseModel
import Foundation

func test() async throws {
    let client = Client(serverURL: URL(string: "https://forums.swift.org/")!, transport: URLSessionTransport())
    let output = try await client.getCategory(.init(path: .init(id: 3)))
//    if let .ok(resp) = output,
//       let .json(value) = resp.body {
////        value.category.
//    }
    
}
