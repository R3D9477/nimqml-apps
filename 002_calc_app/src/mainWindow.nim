import nimqml, qtkey, re, strutils, windowHandler, calc

QtObject:
  type MainWindowHandler* = ref object of WindowHandler
    exprBuff: string
  
  proc exprBuffChanged (self: MainWindowHandler, value: string) {.signal.}
  
  proc setExprBuff (self: MainWindowHandler, value: string) {.slot.} =
    if self.exprBuff == value: return
    self.exprBuff = value
    self.exprBuffChanged(value)
  
  proc getExprBuff (self: MainWindowHandler): string {.slot.} =
    result = self.exprBuff
  
  QtProperty[string] exprBuff:
    read = getExprBuff
    notify = exprBuffChanged
  
  proc btnActNumClicked* (self: MainWindowHandler, value: string) {.slot.} =
    self.setExprBuff(self.exprBuff & value)
  
  proc btnCancelClicked* (self: MainWindowHandler) {.slot.} =
    self.setExprBuff("")
  
  proc btnEvalClicked* (self: MainWindowHandler) {.slot.} =
    if self.exprBuff.len > 0: self.setExprBuff(calcEval(self.exprBuff))
  
  proc tfKeyPressed* (self: MainWindowHandler, keyCode: int, key: string) {.slot.} =
    if match(key, re"[0-9\.\+\-\*\/\(\)]"): self.exprBuff &= key
    elif cast[QtKey](keyCode) == QtKey_Escape: btnCancelClicked(self)
    elif cast[QtKey](keyCode) == QtKey_Enter or cast[QtKey](keyCode) == QtKey_Return: btnEvalClicked(self)
    elif cast[QtKey](keyCode) == QtKey_Backspace and self.exprBuff.len > 0: self.exprBuff.delete(self.exprBuff.len-1, self.exprBuff.len-1)

proc loadMainWindow* (app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[MainWindowHandler](app, engine)
  mwh.setExprBuff("")
  loadWindow(mwh, "mainWindow")