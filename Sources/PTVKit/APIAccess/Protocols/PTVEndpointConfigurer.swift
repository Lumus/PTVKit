//
//  PTVEndpointConfigurer.swift
//  PTVKit
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Provides API access configuration.
protocol PTVEndpointConfigurer {

    /// The URL scheme for the endpoint (e.g. `https`)
    var scheme: String { get }

    /// The base of the URL (e.g. `www.google.com`)
    var host: String { get }

    /// Any custom HTTP headers to pass through to the API
    var headers: [String: String]? { get }

    /// The HTTP method to use for the request to the endpoint
    var method: PTVHTTPMethod { get }

    /// The URL path for the request
    var path: String { get }

    /// The caching policy for the request
    var cachePolicy: URLRequest.CachePolicy { get }

    /// The API version that the endpoint configuration is for
    var version: String { get }

    /// The URL for the endpoint
    var url: URL? { get }

    /// The type of object the API is expecting to return
    var responseType: Decodable.Type? { get }
}

// MARK: - Default Implementations
extension PTVEndpointConfigurer {

    var scheme: String { "https" }
    var host: String { "timetableapi.ptv.vic.gov.au" }
    var headers: [String: String]? { nil }
    var method: PTVHTTPMethod { .get } // All PTVAPI methods are currently GET
    var cachePolicy: URLRequest.CachePolicy { .useProtocolCachePolicy }
    var version: String { "v3" }

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        return components.url
    }
}
