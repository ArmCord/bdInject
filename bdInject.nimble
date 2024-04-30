# Package

version       = "0.1.0"
author        = "smartfrigde"
description   = "bdCompat installer for ArmCord"
license       = "MIT"
srcDir        = "src"
bin           = @["bdInject"]


# Dependencies

requires "nim >= 2.0.2", "puppy >= 2.1.2", "zippy >= 0.10.12"
