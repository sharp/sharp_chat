# README

* Stroy1:
本方案是基于rails action cable组件实现，这块是rails做实时系统的标准方案，底层是基于websocket, 需要客户端的consumer发起websocket请求：`https://localhost:3000/cable`,从而服务器将用户的连接丢在相应的channel里面， 并且在这一步建了2个业务模型User和Message。相关代码:

https://github.com/sharp/sharp_chat/blob/master/app/channels/application_cable/chat_channel.rb
https://github.com/sharp/sharp_chat/tree/master/app/models


* Story2:
这一步跟上一步类似，在服务器端接收客户端消息的时候解析消息内容做相应转发：
https://github.com/sharp/sharp_chat/blob/master/app/channels/application_cable/chat_channel.rb

* Story3:
向客户端发送消息的时候如果该用户不在线，则将消息保存至服务器，客户上线后，从服务器按照时间顺序重发
https://github.com/sharp/sharp_chat/blob/master/app/channels/application_cable/appearance_channel.rb

* Strory4:
由于本方案底层主要依赖于Redis，APP节点之间并无直接通信或者相互依赖，所以可以做到水平扩展，业务功能并不受影响。

* Strory5:


* Strory6:
采用标准扽Rails实现了该接口，相关代码: https://github.com/sharp/sharp_chat/blob/master/app/controllers/users_controller.rb

* Strory7:
目前是采用遍历接受者进行群发，可能会导致redis队列变大，这块我会考虑如何扩展redis
