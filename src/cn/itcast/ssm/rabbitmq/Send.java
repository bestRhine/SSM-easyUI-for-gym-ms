package cn.itcast.ssm.rabbitmq;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;

/**
 * 	消息生产者
 * @author YAO
 *
 */
public class Send {
	private static final String QUEUE_NAME = "test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException {
		//从连接工厂获取连接
		Connection connection = ConnectionUtils.getConnection();
		//从连接获取通道
		Channel channel = connection.createChannel();
		
		//声明队列（创建队列）
		channel.queueDeclare(QUEUE_NAME, false, false, false, null);
		
		String msg = "hello simple!";
		
		//发送消息
		channel.basicPublish("", QUEUE_NAME, null, msg.getBytes());
		
		System.out.println("--send message:"+msg);
		
		
		channel.close();
		connection.close();
		
		
		
		
		
	}
}
