//
//  StateTemplate.swift
//  ReSwiftTemplate
//
//  Created by Jaewon Yun on 2023/09/05.
//

import ReSwift

public protocol StateTemplate {

    associatedtype Reducer: ReducerTemplate

    associatedtype Actions: Action

}
