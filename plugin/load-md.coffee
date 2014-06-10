Plugin.registerSourceHandler "md", (compileStep) ->
  return if compileStep.arch.match(/^browser(\.|$)/)
  compileStep.addAsset
    path: compileStep.inputPath
    data: compileStep.read()
