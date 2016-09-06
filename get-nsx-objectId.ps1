# $xml_input = API output to grep
# $nsx_name = name to obtain
# nsx_field_name = what NSX API calls the name element e.g. 'name'
# nsx_id_name = what NSX API calls the ID element e.g. 'objectId'
# nsx_path = path to XML child to iterate over e.g. 'datapart'

# example xml here from GET https://NSX-Manager-IP-Address/api/2.0/vdn/scopes/scopeId/virtualwires

$xml_input = @"
<virtualWires>
  <sortedDataPage>
    <datapart class="virtualWire">
      <objectId>virtualwire-1</objectId>
      <name>vWire1</name>
      <description>logical switch 1</description>
      <tenantId>logical switch tenant</tenantId>
      <revision>0</revision>
      <vdnScopeId>vdnscope-7</vdnScopeId>
      <vdsContextWithBacking>
        <teaming>ETHER_CHANNEL</teaming>
        <switchId>dvs-81</switchId>
        <backingType>portgroup</backingType>
        <backingValue>dvportgroup-88</backingValue>
      </vdsContextWithBacking>
      <vdnId>5002</vdnId>
      <multicastAddr>239.0.0.3</multicastAddr>
    </datapart>
    <datapart class="virtualWire">
      <objectId>virtualwire-2</objectId>
      <name>vWire2</name>
      <description>logical switch 2</description>
      <tenantId>logical switch tenant</tenantId>
      <revision>0</revision>
      <vdnScopeId>vdnscope-7</vdnScopeId>
      <vdsContextWithBacking>
        <teaming>ETHER_CHANNEL</teaming>
        <switchId>dvs-81</switchId>
        <backingType>portgroup</backingType>
        <backingValue>dvportgroup-88</backingValue>
      </vdsContextWithBacking>
      <vdnId>5002</vdnId>
      <multicastAddr>239.0.0.4</multicastAddr>
    </datapart>
    <pagingInfo>
      <pageSize>20</pageSize>
      <startIndex>0</startIndex>
      <totalCount>2</totalCount>
      <sortOrderAscending>false</sortOrderAscending>
    </pagingInfo>
  </sortedDataPage>
</virtualWires>
"@

function Get_nsx_objectId ($xml_input, $nsx_name, $nsx_name_field, $nsx_id_field, $nsx_path) 
{
$xml = '$xml_input' + '.' + $nsx_path

invoke-expression "$xml" | where { $_.$nsx_name_field -imatch $nsx_name } | ft $nsx_id

}

# Example: 
# (XML object defined previously)
#
# PS C:\Users\d237864> Get_nsx_objectId $xml_input_1 'vWire1' 'name' 'objectId' 'virtualWires.sortedDataPage.datapart'
#
# objectId                                                                                                                                                                                      
# --------                                                                                                                                                                                      
# virtualwire-1 



