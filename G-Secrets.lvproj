<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="25008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">25.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Unit Testing" Type="Folder">
			<Item Name="Support" Type="Folder">
				<Property Name="NI.SortType" Type="Int">0</Property>
				<Item Name="Add Free Labels.vi" Type="VI" URL="../Unit Testing/Support/Add Free Labels.vi"/>
				<Item Name="Add Front Panel Labels to Element.vi" Type="VI" URL="../Unit Testing/Support/Add Front Panel Labels to Element.vi"/>
				<Item Name="Add Front Panel Labels.vi" Type="VI" URL="../Unit Testing/Support/Add Front Panel Labels.vi"/>
				<Item Name="Add Numeric Indicators to Element.vi" Type="VI" URL="../Unit Testing/Support/Add Numeric Indicators to Element.vi"/>
				<Item Name="Add Numeric Indicators.vi" Type="VI" URL="../Unit Testing/Support/Add Numeric Indicators.vi"/>
				<Item Name="Add String Constants.vi" Type="VI" URL="../Unit Testing/Support/Add String Constants.vi"/>
				<Item Name="Add String Controls to Element.vi" Type="VI" URL="../Unit Testing/Support/Add String Controls to Element.vi"/>
				<Item Name="Add String Controls.vi" Type="VI" URL="../Unit Testing/Support/Add String Controls.vi"/>
				<Item Name="Class Definition--cluster.ctl" Type="VI" URL="../Unit Testing/Support/Class Definition--cluster.ctl"/>
				<Item Name="Clean Test Folder.vi" Type="VI" URL="../Unit Testing/Support/Clean Test Folder.vi"/>
				<Item Name="Cluster Definition--cluster.ctl" Type="VI" URL="../Unit Testing/Support/Cluster Definition--cluster.ctl"/>
				<Item Name="Create Class.vi" Type="VI" URL="../Unit Testing/Support/Create Class.vi"/>
				<Item Name="Create Cluster.vi" Type="VI" URL="../Unit Testing/Support/Create Cluster.vi"/>
				<Item Name="Create Project.vi" Type="VI" URL="../Unit Testing/Support/Create Project.vi"/>
				<Item Name="Create Test Classes.vi" Type="VI" URL="../Unit Testing/Support/Create Test Classes.vi"/>
				<Item Name="Create Test Clusters.vi" Type="VI" URL="../Unit Testing/Support/Create Test Clusters.vi"/>
				<Item Name="Create Test Projects.vi" Type="VI" URL="../Unit Testing/Support/Create Test Projects.vi"/>
				<Item Name="Create Test VIs.vi" Type="VI" URL="../Unit Testing/Support/Create Test VIs.vi"/>
				<Item Name="Create VI.vi" Type="VI" URL="../Unit Testing/Support/Create VI.vi"/>
				<Item Name="Element does not exist--error.vi" Type="VI" URL="../Unit Testing/Support/Element does not exist--error.vi"/>
				<Item Name="Element Strings--cluster.ctl" Type="VI" URL="../Unit Testing/Support/Element Strings--cluster.ctl"/>
				<Item Name="Generic Cluster--cluster.ctl" Type="VI" URL="../Unit Testing/Support/Generic Cluster--cluster.ctl"/>
				<Item Name="Get All Class Strings from Definition.vi" Type="VI" URL="../Unit Testing/Support/Get All Class Strings from Definition.vi"/>
				<Item Name="Get All Cluster Strings from Definition.vi" Type="VI" URL="../Unit Testing/Support/Get All Cluster Strings from Definition.vi"/>
				<Item Name="Get All Project Strings from Definition.vi" Type="VI" URL="../Unit Testing/Support/Get All Project Strings from Definition.vi"/>
				<Item Name="Get All VI Strings from Definition.vi" Type="VI" URL="../Unit Testing/Support/Get All VI Strings from Definition.vi"/>
				<Item Name="Project Definition--cluster.ctl" Type="VI" URL="../Unit Testing/Support/Project Definition--cluster.ctl"/>
				<Item Name="Setup Test.vi" Type="VI" URL="../Unit Testing/Support/Setup Test.vi"/>
				<Item Name="Test Class Definition.xml" Type="Document" URL="../Unit Testing/Support/Test Class Definition.xml"/>
				<Item Name="Test Cluster Definition.xml" Type="Document" URL="../Unit Testing/Support/Test Cluster Definition.xml"/>
				<Item Name="Test Folder--constant.vi" Type="VI" URL="../Unit Testing/Support/Test Folder--constant.vi"/>
				<Item Name="Test Project Definition.xml" Type="Document" URL="../Unit Testing/Support/Test Project Definition.xml"/>
				<Item Name="Test VI Definition.xml" Type="Document" URL="../Unit Testing/Support/Test VI Definition.xml"/>
				<Item Name="VI Definition--cluster.ctl" Type="VI" URL="../Unit Testing/Support/VI Definition--cluster.ctl"/>
			</Item>
			<Item Name="Test Export Strings.vi" Type="VI" URL="../Unit Testing/Test Export Strings.vi"/>
			<Item Name="Test Find Leaks.vi" Type="VI" URL="../Unit Testing/Test Find Leaks.vi"/>
		</Item>
		<Item Name="src" Type="Folder">
			<Item Name="Errors" Type="Folder">
				<Item Name="Code Contains Secrets--error.vi" Type="VI" URL="../src/Errors/Code Contains Secrets--error.vi"/>
			</Item>
			<Item Name="Constants" Type="Folder">
				<Item Name="Temp Folder--constant.vi" Type="VI" URL="../src/Constants/Temp Folder--constant.vi"/>
				<Item Name="Default String File--constant.vi" Type="VI" URL="../src/Constants/Default String File--constant.vi"/>
				<Item Name="Default Log File--constant.vi" Type="VI" URL="../src/Constants/Default Log File--constant.vi"/>
			</Item>
			<Item Name="Type Definitions" Type="Folder">
				<Item Name="Export Strings States--enum.ctl" Type="VI" URL="../src/Type Definitions/Export Strings States--enum.ctl"/>
				<Item Name="Extensions--enum.ctl" Type="VI" URL="../src/Type Definitions/Extensions--enum.ctl"/>
				<Item Name="Export Strings Data--enum.ctl" Type="VI" URL="../src/Type Definitions/Export Strings Data--enum.ctl"/>
				<Item Name="Secret--cluster.ctl" Type="VI" URL="../src/Type Definitions/Secret--cluster.ctl"/>
				<Item Name="Leak--cluster.ctl" Type="VI" URL="../src/Type Definitions/Leak--cluster.ctl"/>
			</Item>
			<Item Name="Export Strings.vi" Type="VI" URL="../src/Export Strings.vi"/>
			<Item Name="Find Leaks.vi" Type="VI" URL="../src/Find Leaks.vi"/>
		</Item>
		<Item Name="cli" Type="Folder">
			<Item Name="Type Definitions" Type="Folder">
				<Item Name="CLI States--enum.ctl" Type="VI" URL="../cli/Type Definitions/CLI States--enum.ctl"/>
				<Item Name="CLI Data--cluster.ctl" Type="VI" URL="../cli/Type Definitions/CLI Data--cluster.ctl"/>
				<Item Name="Project References--cluster.ctl" Type="VI" URL="../src/Type Definitions/Project References--cluster.ctl"/>
			</Item>
			<Item Name="Constants" Type="Folder">
				<Item Name="CLI Parameters--constant.vi" Type="VI" URL="../cli/Constants/CLI Parameters--constant.vi"/>
				<Item Name="Help Message Top--constant.vi" Type="VI" URL="../cli/Constants/Help Message Top--constant.vi"/>
				<Item Name="Help Message Bottom--constant.vi" Type="VI" URL="../cli/Constants/Help Message Bottom--constant.vi"/>
				<Item Name="Default Secret Configuration--constant.vi" Type="VI" URL="../cli/Constants/Default Secret Configuration--constant.vi"/>
			</Item>
			<Item Name="Subvis" Type="Folder">
				<Item Name="Create Info Strings.vi" Type="VI" URL="../cli/Subvis/Create Info Strings.vi"/>
				<Item Name="Parse CLI Arguments.vi" Type="VI" URL="../cli/Subvis/Parse CLI Arguments.vi"/>
			</Item>
			<Item Name="g-secrets.vi" Type="VI" URL="../cli/g-secrets.vi"/>
		</Item>
		<Item Name="Package Dependencies" Type="IIO Ladder Diagram">
			<Property Name="NI.SortType" Type="Int">0</Property>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
