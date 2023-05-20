//
//  Client.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import Foundation

/// A client to fetch Discourse Server infomation
public final class Client {
    // MARK: - Public Interface
    
    /// Init a discourse client with a baseURL
    /// - Parameter baseURL: The base URL of the Discourse Server
    public init?(baseURL: URL) {
        self.baseURL = baseURL
        guard let apiCollection = APICollectioin(baseURL: baseURL) else {
            return nil
        }
        self._apiCollection = apiCollection
    }
    
    /// Check if the url is a discourse server
    public static func check(url _: URL) -> Bool {
        fatalError("Not implemented")
    }
    
    /// Check if the url is a discourse server
    public func check() -> Bool {
        Client.check(url: baseURL)
    }
    
    // MARK: - Internal Implementation Detail

    let baseURL: URL
    
    let _apiCollection: APICollectioin

//    // MARK: Internal convenience methods
//
//    /// For GET requests.
//    ///
//    /// Takes a set of query params, an endpiont, and any path parameters.
//    /// For example, getting a list of posts from a particular category
//    /// sorted by new, in descending order. Usage could look like this:
//    /// ```
//    /// client.get(["ascending": false], from: .listPosts, pathParams: "pitches", "new") { parser in
//    ///     guard self.callbackIfError(parser, completion) else { return }
//    ///     // Parse the response into something useful
//    ///     // ...
//    ///     callback(posts, nil)
//    /// }
//    /// ```
//    /// The resulting URL might look something like: `https://example.org/pitches/new?ascending=0`
//    func get<T>(_ query: Query? = nil, from endpoint: Endpoint, node: String? = nil) -> DKResponse<T> {
//        self.get({ self.configure($0, query, endpoint, false) }).decode(node)
//    }
//
//    func get(_ query: Query? = nil, from endpoint: Endpoint) -> DKResponse<Void> {
//        self.get({ self.configure($0, query, endpoint, false) }).parse()
//    }
//
//    /// For POST requests.
//    ///
//    /// Behaves like `get(_:from:pathParams:callback)`, but the given query is sent as a part of the HTTP body.
//    func post<T>(_ query: Query? = nil, to endpoint: Endpoint, node: String? = nil) -> DKResponse<T> {
//        self.post({ self.configure($0, query, endpoint, true) }).decode(node)
//    }
//
//    func post(_ query: Query? = nil, to endpoint: Endpoint) -> DKResponse<Void> {
//        self.post({ self.configure($0, query, endpoint, true) }).parse()
//    }
//
//    /// Does any **shared** configuration of requests, such as setting the **base URL**
//    /// or providing **default header values** or other parameters.
//    @discardableResult
//    private func request(with configurationHandler: (URLRequestBuilder) -> Void) -> URLRequestProxy {
//        return URLRequestBuilder.make { make in
//            make.baseURL(self.baseURL.absoluteString).headers(self.defaultHTTPHeaders)
//            configurationHandler(make)
//        }
//    }
//
//    private func post(_ configurationHandler: (URLRequestBuilder) -> Void) -> AnyPublisher<ResponseParser,Error> {
//        return self.request(with: configurationHandler).post().map(self.preCallbackHook(_:)).eraseToAnyPublisher()
//    }
//
//    private func get(_ configurationHandler: (URLRequestBuilder) -> Void) -> AnyPublisher<ResponseParser,Error> {
//        return self.request(with: configurationHandler).get().map(self.preCallbackHook(_:)).eraseToAnyPublisher()
//    }
//
//    /// Does **boilerplate** configuration of requests, such as
//    /// setting **the endpoint** or applying any **query or path parameters.**
//    ///
//    /// TODO: this should be an extension on URLRequestBuilder instead
//    func configure(_ make: URLRequestBuilder, _ query: Query?, _ endpoint: Endpoint, _ useBody: Bool) {
//        // Gather the parameters and decide which format to send them in;
//        // POST requests use the body instead of standard queries
//        let format: URLRequestBuilder.ParamFormat = useBody ? .bodyJSON : .query
//        let params = (query ?? [:]) + self.defaultQueryParams
//
//        // Assign the endpoint and pass any parameters
//        make.endpoint(endpoint.rawValue).params(params, format: format)
//    }
//
//    /// This is a chance for API-specific code to run once a request has finished.
//    ///
//    /// Here, we intercept the response before it is passed to client code
//    /// and we parse the API response for an error. Any error found is used
//    /// to populate the parser.error field. This is a good place to check for
//    /// special header and do something with them for use in subsequent requests.
//    private func preCallbackHook(_ parser: ResponseParser) -> ResponseParser {
//        if parser.error == nil, let response = parser.JSONDictionary,
//            let errors = response["errors"] as? [String] {
//            let msg = errors.joined(separator: "\n")
//            parser.error = ResponseParser.error(msg, code: parser.response!.statusCode)
//        }
//
//        return parser
//    }
}
