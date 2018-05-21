//
//  Router.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Alamofire

typealias jsonDictionary = [String: AnyObject]

enum Router {
    
    // MARK: - Configuration
    private static let baseHostPath = "https://grocifyapi.azurewebsites.net"
    private static let versionPath = "/api"
    var baseURLPath: String {
        return "\(Router.baseHostPath)\(Router.versionPath)"
    }
    
    //PRODUCTS
    case getProducts()
    case getProduct(String)
    case createProduct(jsonDictionary)
    case updateProduct(jsonDictionary)
    case deleteProduct(String)

    //MARKET
    case getSuperMarkets()
    case getSuperMarket(String)
    
    //RECIPE
    case getRecipes()
    case getRecipe(String)
    
    //SHOPPING LIST
    case getShoppingLists()
    case getShoppingList(String)
    case requestShoppingList(String)
    case createShoppingList(jsonDictionary)
    case updateShoppingList(jsonDictionary)
    case deleteShoppingList(String)
}

extension Router {
    
    struct Request {
        let method: Alamofire.HTTPMethod
        let path: String
        let encoding: ParameterEncoding?
        let parameters: jsonDictionary?
        
        init(method: Alamofire.HTTPMethod,
             path: String,
             parameters: jsonDictionary? = nil,
             encoding: ParameterEncoding = JSONEncoding.default) {
            
            self.method = method
            self.path = path
            self.encoding = encoding
            self.parameters = parameters
        }
    }
    
    var request: Request {
        switch self {
            
        //PRODUCTS
        case .getProducts():
            return Request(method: .get, path: "/Product", encoding: URLEncoding.default)
        
        case .getProduct(let id):
            return Request(method: .get, path: "/Product/\(id)", encoding: URLEncoding.default)
            
        case .createProduct(let product):
            return Request(method: .post, path: "/Product", parameters: product, encoding: URLEncoding.default)
            
        case .updateProduct(let product):
            return Request(method: .put, path: "/Product", parameters: product, encoding: URLEncoding.default)
            
        case .deleteProduct(let id):
            return Request(method: .delete, path: "/Product/\(id)", encoding: URLEncoding.default)
            
        //MARKET
        case .getSuperMarkets():
            return Request(method: .get, path: "/Supermarket", encoding: URLEncoding.default)
            
        case .getSuperMarket(let id):
            return Request(method: .get, path: "/Supermarket/\(id)", encoding: URLEncoding.default)
            
        //RECIPE
        case .getRecipes():
            return Request(method: .get, path: "/Recipe", encoding: URLEncoding.default)
            
        case .getRecipe(let id):
            return Request(method: .get, path: "/Recipe/\(id)", encoding: URLEncoding.default)
        
        //SHOPPING LIST
        case .getShoppingLists():
            return Request(method: .get, path: "/ShoppingList", encoding: URLEncoding.default)
        
        case .getShoppingList(let id):
            return Request(method: .get, path: "/ShoppingList/\(id)", encoding: URLEncoding.default)
        
        case .requestShoppingList(let id):
            return Request(method: .get, path: "/ShoppingList/doSLA/\(id)", encoding: URLEncoding.default)
        
        case .createShoppingList(let product):
            return Request(method: .post, path: "/ShoppingList", parameters: product, encoding: URLEncoding.default)
        
        case .updateShoppingList(let product):
            return Request(method: .put, path: "/ShoppingList", parameters: product, encoding: URLEncoding.default)
        
        case .deleteShoppingList(let id):
            return Request(method: .delete, path: "/ShoppingList/\(id)", encoding: URLEncoding.default)
        }
    }
}

// MARK: - URLRequestConvertible
extension Router: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURLPath)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(request.path))
        urlRequest.httpMethod = request.method.rawValue
        
        if let encoding = request.encoding {
            return try encoding.encode(urlRequest, with: request.parameters)
        } else {
            return urlRequest
        }
    }
}
