### 1. Rename Exes in bin/
tomcat8.exe -> tomcat8_SS_NN.exe

tomcat8w.exe -> tomcat8_SS_NNw.exe

### 2. bin/service.bat
- `SET CATALINA_HOME=Your Tomcat Root Folder`
- Rename Exes (i.e. tomcat8.exe & tomcat8w.exe)
- Change Service Name
  `set SERVICE_NAME=Tomcat8_SS_NN`
  `set DISPLAY_NAME=%SERVICE_NAME%`
 
### 3. conf/server.xml
- Change Shutdown Port
- Change Connector Port
- Change Engine tag add `jvmRoute=Node8_SS_NN`

### 4. lib/org/apache/catalina/util/ServerInfo.properties
`server.info=SSNN`
