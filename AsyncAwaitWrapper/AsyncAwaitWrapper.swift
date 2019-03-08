//
//  AsyncAwaitWrapper.swift
//
//  Created by ToKoRo on 2019-03-08.
//

import Foundation
import Hydra

typealias Promise = Hydra.Promise

// MARK: - async

func async<T>(in context: Context? = nil, token: InvalidationToken? = nil, _ body: @escaping ((_ status: PromiseStatus) throws -> (T))) -> Promise<T> {
    return Hydra.async(in: context, token: token, body)
}

func async(in context: Context, after: TimeInterval? = nil, _ block: @escaping () -> Void) {
    Hydra.async(in: context, after: after, block)
}

// MARK: - await

@discardableResult
func await<T>(in context: Context? = nil, _ promise: Promise<T>) throws -> T {
    return try Hydra.await(in: context, promise)
}

@discardableResult
func await<T>(in context: Context = .background, _ body: @escaping ((_ fulfill: @escaping (T) -> Void, _ reject: @escaping (Error) -> Void, _ operation: PromiseStatus) throws -> Void)) throws -> T {
    return try Hydra.await(in: context, body)
}

// MARK: - beginAsync

func beginAsync(block: @escaping () -> Void) {
    async({ _ -> Void in
        block()
    }).then {}
}
