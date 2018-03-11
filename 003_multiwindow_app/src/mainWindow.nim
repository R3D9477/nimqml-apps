import nimqml, windowHandler, childWindow

QtObject:
  type MainWindowHandler* = ref object of WindowHandler
    messageText: string
  
  proc messageTextChanged(self: MainWindowHandler, messageText: string) {.signal.}
  
  proc setMessageText(self: MainWindowHandler, messageText: string) {.slot.} =
    if self.messageText == messageText: return
    self.messageText = messageText
    messageTextChanged(self, messageText)
  
  proc getMessageText(self: MainWindowHandler): string {.slot.} =
    result = self.messageText
  
  QtProperty[string] messageText:
    read = getMessageText
    write = setMessageText
    notify = messageTextChanged
  
  proc showChildWindow*(self: MainWindowHandler) {.slot.} =
    loadChildWindow(self.app, self.engine)

proc loadMainWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[MainWindowHandler](app, engine)
  mwh.setMessageText("")
  loadWindow(mwh, "mainWindow")