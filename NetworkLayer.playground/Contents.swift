import UIKit

/**
 
            RequestHandler ----> APILoader -------> ResponseHandler
 
 */


protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(with data: RequestDataType) -> URLRequest?
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(for data: Data, urlResponse: HTTPURLResponse) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler


extension RequestHandler {
    func setQueryParam(params: [String: Any]) {
        
    }
    
    func setDefaultHeader(header: [String: Any]) {
        
    }
}


class APILoader<T: APIHandler> {
    var apiHandelr: T
    var urlSession: URLSession
    
    init(apihan: T, session : URLSession = .shared) {
        self.apiHandelr = apihan
        self.urlSession = session
    }
    
    func makeAPICall(requestData: T.RequestDataType, completionHandler : @escaping (T.ResponseDataType?,Error?) -> ()) {
        if let urlRequest = self.apiHandelr.makeRequest(with: requestData) {
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                guard response == nil else {
                    completionHandler(nil, error)
                    return
                }
                
                let data = try? self.apiHandelr.parseResponse(for: data!, urlResponse: ((response as? HTTPURLResponse)!))
                completionHandler(data, nil)
            }
        }
        
    }
}

extension ResponseHandler {
    func defaultParseWithCodable<T:Codable>(data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        do {
            let body = try jsonDecoder.decode(T.self, from: data)
            return body
        } catch {
            throw error
        }
    }
}

 
 enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "unsplash.com"
        case .staging:
            return "unsplash.com"
        case .production:
            return "unsplash.com"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api"
        }
    }
    
}
 
 #if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()
 
 struct APIPath {
    var gallary: String { return "\(baseURL)/search/photos"}

}

// Implementation of network layer in app - 

struct GallaryModel : Codable{
    
}

struct GallaryAPI: APIHandler {
    
    func makeRequest(with param: [String: Any]) -> URLRequest? {
//           let urlString =  APIPath().gallary
//           if var url = URL(string: urlString) {
//               if param.count > 0 {
//                   url = setQueryParams(parameters: param, url: url)
//               }
//               var urlRequest = URLRequest(url: url)
//               setDefaultHeaders(request: &urlRequest)
//               urlRequest.httpMethod = HTTPMethod.get.rawValue
//               return urlRequest
//           }
           return nil
       }
       
    func parseResponse(for data: Data, urlResponse response: HTTPURLResponse) throws -> GallaryModel {
           return try defaultParseWithCodable(data: data)
       }
    
}

class GalleryViewModel{
    func makeGallaryAPICall() {
        let api = APILoader(apihan: GallaryAPI())
        api.makeAPICall(requestData: [:]) { (model, error) in
            
        }
    }
}
