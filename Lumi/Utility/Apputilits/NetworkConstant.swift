//
//  NetworkConstant.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/04/22.
//

import Foundation

// MARK: - setting up names that will be used as parameters
typealias JSONDictionary = [String : Any]
typealias HTTPHeaders = [String:String]
typealias APIResponse = (Result<JSON,NSError>) -> Void
