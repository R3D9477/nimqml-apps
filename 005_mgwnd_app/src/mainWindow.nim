import nimqml, windowHandler

QtObject:
  type MainWindowHandler* = ref object of WindowHandler
    title: string
  
  proc titleChanged(self: MainWindowHandler, title: string) {.signal.}
  
  proc setTitle(self: MainWindowHandler, title: string) {.slot.} =
    if self.title == title: return
    self.title = title
    titleChanged(self, title)
  
  proc getTitle(self: MainWindowHandler): string {.slot.} =
    result = self.title
  
  QtProperty[string] title:
    read = getTitle
    write = setTitle
    notify = titleChanged

proc loadMainWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[MainWindowHandler](app, engine)
  mwh.setTitle("Main Window")
  loadWindow(mwh, "mainWindow")