package cn.itcast.ssm.rabbitmq;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

public class ConnectionUtils {

	
	/**
	 *	获取rabbitmq链接
	 * @throws TimeoutException 
	 * @throws IOException 
	 */
	public static Connection getConnection() throws IOException, TimeoutException {
		
		//定义连接工厂
		ConnectionFactory factory = new ConnectionFactory();
		
		//设置服务器ip
		factory.setHost("127.0.0.1");
		//设置端口号
		factory.setPort(5672);
		//设置要使用的‘数据库’vhost
		factory.setVirtualHost("/vhost_yao");
		//设置用户名
		factory.setUsername("yao");
		//设置密码
		factory.setPassword("123456");
		
		
		//从工厂获取链接并返回
		return factory.newConnection();
	}
}
