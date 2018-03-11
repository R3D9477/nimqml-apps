import nimqml, windowHandler

QtObject:
  type ChildWindowHandler* = ref object of WindowHandler

proc loadChildWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[ChildWindowHandler](app, engine)
  loadWindow(mwh, "childWindow")