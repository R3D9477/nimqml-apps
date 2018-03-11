import nimqml, windowHandler

QtObject:
  type DialogWindowHandler* = ref object of WindowHandler

proc loadDialogWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[DialogWindowHandler](app, engine)
  loadWindow(mwh, "dialog")