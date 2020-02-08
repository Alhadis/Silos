local app = {
  globals = {
    "__love",
    "__debug",
    "__filter",
  }
}

stds.app = app
std = "luajit+love+app"