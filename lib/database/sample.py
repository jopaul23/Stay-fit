import asyncio
import pickle as pickle
import websockets,json
from database import TrainerDatabase

# create handler for each connection
trainer_db =TrainerDatabase()
print("Database connected")
users = []

async def parse_command(websocket,data):
    command = data["command"]
    try:
        if command.lower() =="get_all_messages":
            data["result"] = trainer_db.get_all_messages(data["user"])
        elif command.lower() =="get_message":#get al messages from a user
            data["result"]=trainer_db.getMessages(data["sender"],data["reciver"]) 
        elif command.lower() == "send":#send message
            result = trainer_db.send_msg(data["chat_id"],data["from"],data["to"],data["message"])
            if result["success"]:
                await send_to_recivier(data["to"],data)
                data["result"] = result
            else:
                data["result"] = result
        await websocket.send(json.dumps(data))
    except:
        remove_user(data["from"])

async def send_to_recivier(user,data):
    for u in users:
        if u["user"] == user:
            data["command"] = "recivied"
            try:
                await u["socket"].send(json.dumps(data))
            except:
                remove_user(u["user"])


async def handler(websocket):
    data = await websocket.recv()
    data = json.loads(data)
    user = data["user"]
    if data["user"]:
        #check for valid user
        print(data)
        d = {"user": data["user"],"socket":websocket}
        users.append(d)

    while(True):
        try:
            data = await websocket.recv()
            print(data)
            await parse_command(websocket,json.loads(data))
        except:
            remove_user(user)
        

 
def remove_user(user):
    index = -1
    for i,u in enumerate(users):
        if u["user"] == user:
            index = i
            break
    if index > -1:
        users.pop(index) 

start_server = websockets.serve(handler, "10.100.24.187", 5000)

 

asyncio.get_event_loop().run_until_complete(start_server)

asyncio.get_event_loop().run_forever()