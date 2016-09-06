#$invocation = (Get-Variable MyInvocation).Value
#$directorypath = Split-Path $invocation.MyCommand.Path
#$settingspath = $directorypath + '\virtualwire-example.xml'
#$xml_input_1 = [xml](get-content $settingspath)