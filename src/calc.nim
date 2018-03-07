import strutils, tables, re

let ops = ['+','-','*','/','(',')']
let prec = { "*": 1, "/": 3, "+": 2, "-": 2, "(": 1 }.toTable

proc splitExpr (sInfExpr: string): seq[string] =
  result = @[]
  var opInd = 0
  for i in 0..<sInfExpr.len:
    if sInfExpr[i] in ops:
      result.add($sInfExpr[i])
      opInd = result.len
    else:
      if opInd == result.len: result.add("")
      result[result.len-1].add(sInfExpr[i])

proc infToPostf (sInfExpr: string): seq[string] =
  result = @[]
  var infExpr = splitExpr(sInfExpr)
  var opStack: seq[string] = @[]
  for token in infExpr:
    if match(token, re"^(-?)([0-9]+)(.[0-9]+)?$"):
      result.add(token)
    elif token == "(":
      opStack.insert(token)
    elif token == ")":
      var topToken = opStack.pop()
      while topToken != "(":
        result.add(topToken)
        topToken = opStack.pop()
    else:
      while opStack.len > 0:
        if prec[opStack[0]] < prec[token]: break
        result.add(opStack.pop())
      opStack.add(token)
  while opStack.len > 0:
    result.add(opStack.pop())

proc calcEval* (sInfExpr: string): string =
  var exprStack = infToPostf(sInfExpr)
  var numStack: seq[float] = @[]
  for op in exprStack:
    if op[0] in ops:
      var op2: float;
      case op[0]:
      of '+':
        numStack.add(numStack.pop() + numStack.pop())
      of '*':
        numStack.add(numStack.pop() * numStack.pop())
      of '-':
        op2 = numStack.pop()
        numStack.add(numStack.pop() - op2)
      of '/':
        op2 = numStack.pop()
        if op2 != 0: numStack.add(numStack.pop() / op2)
      else: discard
    else: numStack.add(parseFloat(op))
  result = $(numStack.pop())