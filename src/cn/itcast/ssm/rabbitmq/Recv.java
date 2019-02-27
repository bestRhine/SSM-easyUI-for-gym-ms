package cn.itcast.ssm.rabbitmq;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.AMQP.BasicProperties;

/**
 * 	消费者 获取消息
 * @author YAO
 *
 */
public class Recv {
	private static final String QUEUE_NAME = "test_simple_queue";
	public static void main(String[] args) throws IOException, TimeoutException {
		//获取连接
		Connection connection = ConnectionUtils.getConnection();
		//创建通道
		Channel channel = connection.createChannel();
		//队列声明，
		channel.queueDeclare(QUEUE_NAME, false, false, false, null);
		
		//定义消费者
		DefaultConsumer consumer = new DefaultConsumer(channel) {
			//队列中一有消息，就会触发此函数
			//重写此函数
			@Override
			public void handleDelivery(String consumerTag, Envelope envelope, BasicProperties properties, byte[] body)
					throws IOException {
				String msg = new String(body,"utf-8");
				System.out.println("recv:"+msg);
			}
		};
		
		//监听队列,一有消息则调用第三个参数中的handlerDelivery方法
		channel.basicConsume(QUEUE_NAME, true, consumer);
		
		
	}
	
}
