import nimqml, windowHandler, dialog

QtObject:
  type MainWindowHandler* = ref object of WindowHandler
    currentDate: string
  
  proc currentDateChanged(self: MainWindowHandler, currentDate: string) {.signal.}
  
  proc setCurrentDate(self: MainWindowHandler, currentDate: string) {.slot.} =
    if self.currentDate == currentDate: return
    self.currentDate = currentDate
    currentDateChanged(self, currentDate)
  
  proc getCurrentDate(self: MainWindowHandler): string {.slot.} =
    result = self.currentDate
  
  QtProperty[string] currentDate:
    read = getCurrentDate
    write = setCurrentDate
    notify = currentDateChanged
  
  proc btnShowDialogClicked* (self: MainWindowHandler) {.slot.} =
    loadDialogWindow(self.app, self.engine)

proc loadMainWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[MainWindowHandler](app, engine)
  mwh.setCurrentDate("-")
  loadWindow(mwh, "mainWindow")