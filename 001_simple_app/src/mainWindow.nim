import nimqml, windowHandler

QtObject:
  type MainWindowHandler* = ref object of WindowHandler
    labelText: string
  
  proc labelTextChanged(self: MainWindowHandler, labelText: string) {.signal.}
  
  proc setLabelText(self: MainWindowHandler, labelText: string) {.slot.} =
    if self.labelText == labelText: return
    self.labelText = labelText
    labelTextChanged(self, labelText)
  
  proc getLabelText(self: MainWindowHandler): string {.slot.} =
    result = self.labelText
  
  QtProperty[string] labelText:
    read = getLabelText
    write = setLabelText
    notify = labelTextChanged
  
  proc btnClicked*(self: MainWindowHandler) {.slot.} =
    self.setLabelText("button clicked!")

proc loadMainWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[MainWindowHandler](app, engine)
  mwh.setLabelText("nothing happens")
  loadWindow(mwh, "mainWindow")