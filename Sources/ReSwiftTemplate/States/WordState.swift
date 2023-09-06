//
//  WordState.swift
//  WordChecker
//
//  Created by Jaewon Yun on 2023/09/04.
//

import ReSwift

// MARK: - State

public struct CounterState: StateType {

    public var count: Int

}

// MARK: - Reducer

extension CounterState {

    public struct Reducer: ReducerType {

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
