FROM maven AS buildstage
RUN mkdir /opt/demo
WORKDIR /opt/demo
COPY . .
RUN mvn clean install    ## artifact -- .war 

## tomcat deploy stage 
FROM tomcat 
WORKDIR webapps 
COPY --from=buildstage /opt/demo/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
