infix operator |> { associativity left precedence 150 }

public func |> <T, U>(lhs: T, rhs: T -> U) -> U {
  return rhs(lhs)
}
