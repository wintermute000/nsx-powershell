$tag_table = Import-Csv ./tags.csv
$varcount = 1
ForEach ($row in $tag_table)
{ $tagname =  $row.name
  $tagdescription = $row.description

  $body = @"
    <securityTag>
        <objectTypeName>SecurityTag</objectTypeName>
        <type>
            <typeName>SecurityTag</typeName>
        </type>
        <name>$tagname</name>
        <description>$tagdescription</description>
        <extendedAttributes></extendedAttributes>
    </securityTag>
"@

    $varname = "body" + $varcount
    echo $varname
    New-Variable -Name $varname -Value $body

    $varcount = $varcount + 1
}