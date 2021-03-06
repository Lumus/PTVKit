//
//  PTVMockEndpoint.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
// swiftlint:disable all

@testable import PTVKit
import Foundation

enum PTVMockEndpoint {
    case mockGet
    case mockGetWithNilUrl
    case mockGetWithIncompatibleResponseType
    case mockGetWithSingleParameter(parameter: String)
    case mockGetWithMultiParameter(first: String, second: String)
    case mockPost
    case mockPostWithNilUrl
    case mockPostWithIncompatibleResponseType
    case mockPostWithSingleParameter(parameter: String)
    case mockPostWithMultiParameter(first: String, second: String)
}

extension PTVMockEndpoint: PTVEndpointConfigurer {
    var path: String {
        switch self {
        case .mockGet: return "/mock"
        case .mockGetWithNilUrl: return "/mock"
        case .mockGetWithIncompatibleResponseType: return "/mock"
        case let .mockGetWithSingleParameter(parameter): return "/mockWithSingleParameter/parameter/\(parameter)"
        case let .mockGetWithMultiParameter(first, second): return "/mockWithMultiParameter/first/\(first)/second/\(second)"
        case .mockPost: return "/mock"
        case .mockPostWithNilUrl: return "/mock"
        case .mockPostWithIncompatibleResponseType: return "/mock"
        case let .mockPostWithSingleParameter(parameter): return "/mockWithSingleParameter/parameter/\(parameter)"
        case let .mockPostWithMultiParameter(first, second): return "/mockWithMultiParameter/first/\(first)/second/\(second)"
        }
    }

    var method: PTVHTTPMethod {
        switch self {
        case .mockPost,
             .mockPostWithSingleParameter,
             .mockPostWithMultiParameter: return .post
        default: return .get
        }
    }

    var url: URL? {
        switch self {
        case .mockGetWithNilUrl,
             .mockPostWithNilUrl: return nil
        default:
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = path
            return components.url
        }
    }

    var responseType: Decodable.Type? {
        switch self {
        case .mockGet,
             .mockGetWithSingleParameter,
             .mockGetWithMultiParameter: return MockDecodable.self
        case .mockGetWithIncompatibleResponseType,
             .mockPostWithIncompatibleResponseType: return MockIncompatibleDecodable.self
        default: return nil
        }
    }
}
