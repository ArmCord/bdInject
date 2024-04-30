import os
import zippy/ziparchives
import puppy
const jsIndex: string = staticRead"index.js"
const jsonPackage: string = staticRead"package.json"
type
  Paths = array[3, string]
# let commonInstallPaths: Paths = ["Jasmine", "Ktisztina", "Kristof"]
when isMainModule:
  echo("BDCompat injector")
  write(stdout, "Your resources directory -> ")
  var input: string = readLine(stdin)
  var asar: string = joinPath(input & "/app.asar")
  echo(asar)
  if fileExists(asar):
    echo "Injecting BDCompat..."
    moveFile(asar, input & "/app-original.asar")
    createDir(input & "/app")
    writeFile(input & "/app/index.js", jsIndex)
    writeFile(input & "/app/package.json", jsonPackage)
    writeFile(input & "/app/kernel.asar", fetch("https://github.com/kernel-mod/electron/releases/download/2023-01-15-07-14-02/kernel.asar"))
    writeFile(input & "/app/bdCompat.zip", fetch("https://github.com/ArmCord/bdCompat/archive/refs/heads/main.zip"))
    extractAll(input & "/app/bdCompat.zip", input & "/app/packages")
    removeFile(input & "/app/bdCompat.zip")
  else:
    echo "Directory does not exist"