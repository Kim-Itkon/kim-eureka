FROM java:8

VOLUME /tmp

COPY target/kim-Eureka-1.0.0-SNAPSHOT.jar kim-Eureka-1.0.0-SNAPSHOT.jar

#bash方式执行，使demo-1.0.0.jar可访问
#RUN新建立一层，在其上执行这些命令，执行结束后， commit 这一层的修改，构成新的镜像。
RUN bash -c "touch /kim-Eureka-1.0.0-SNAPSHOT.jar"

#声明运行时容器提供服务端口，这只是一个声明，在运行时并不会因为这个声明应用就会开启这个端口的服务
EXPOSE 8761

#指定容器启动程序及参数   <ENTRYPOINT> "<CMD>"
ENTRYPOINT ["java","-jar","kim-Eureka-1.0.0-SNAPSHOT.jar"]