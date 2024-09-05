//
//  NetworkErrors.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 29.08.24.
//

import Foundation

enum NetworkError: Error {
   case badUrl
   case invalidRequest
   case badResponse
   case badStatus
   case failedToDecodeResponse
}
