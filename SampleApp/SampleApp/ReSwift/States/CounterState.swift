//
//  CounterState.swift
//  SampleApp
//
//  Created by Jaewon Yun on 2023/09/04.
//

import ReSwift
import ReSwiftTemplate

// MARK: - State

public struct CounterState: StateTemplate {

    public var count: Int

}

// MARK: - Reducer

extension CounterState {

    public struct Reducer: ReducerTemplate {

        public init() {}

        public func createNewState(action: Action, state: CounterState?) -> CounterState {
            var state: CounterState = state ?? .init(count: 0)

            switch action as? Actions {
            case .increaseCount:
                state.count += 1
            case .decreaseCount:
                state.count -= 1
            default:
                break
            }

            return state
        }

    }

}

// MARK: - Actions

extension CounterState {

    public enum Actions: Action {

        case increaseCount

        case decreaseCount

    }

}
